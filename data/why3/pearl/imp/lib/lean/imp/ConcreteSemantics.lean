import Why3.Base
import pearl.imp.lib.lean.imp.Syntax
open Classical
open Lean4Why3
namespace ConcreteSemantics
axiom environment : Type
axiom inhabited_axiom_environment : Inhabited environment
attribute [instance] inhabited_axiom_environment
inductive expr_behaviour where
  | Enormal : ℤ -> expr_behaviour
  | Eunbound_var : expr_behaviour
axiom inhabited_axiom_expr_behaviour : Inhabited expr_behaviour
attribute [instance] inhabited_axiom_expr_behaviour
inductive eval_expr : (Syntax.program_var -> Option ℤ) -> Syntax.expr -> expr_behaviour -> Prop where
 | eval_lit (env : Syntax.program_var -> Option ℤ) (n : ℤ) : eval_expr env (Syntax.expr.Elit n) (expr_behaviour.Enormal n)
 | eval_var (env : Syntax.program_var -> Option ℤ) (x : Syntax.program_var) (n : ℤ) : env x = Option.some n → eval_expr env (Syntax.expr.Evar x) (expr_behaviour.Enormal n)
 | eval_var_undefined (env : Syntax.program_var -> Option ℤ) (x : Syntax.program_var) : env x = Option.none → eval_expr env (Syntax.expr.Evar x) expr_behaviour.Eunbound_var
 | eval_sub (env : Syntax.program_var -> Option ℤ) (e1 : Syntax.expr) (n1 : ℤ) (e2 : Syntax.expr) (n2 : ℤ) : eval_expr env e1 (expr_behaviour.Enormal n1) → eval_expr env e2 (expr_behaviour.Enormal n2) → eval_expr env (Syntax.expr.Esub e1 e2) (expr_behaviour.Enormal (n1 - n2))
 | eval_sub_error1 (env : Syntax.program_var -> Option ℤ) (e1 : Syntax.expr) (e2 : Syntax.expr) : eval_expr env e1 expr_behaviour.Eunbound_var → eval_expr env (Syntax.expr.Esub e1 e2) expr_behaviour.Eunbound_var
 | eval_sub_error2 (env : Syntax.program_var -> Option ℤ) (e1 : Syntax.expr) (n1 : ℤ) (e2 : Syntax.expr) : eval_expr env e1 (expr_behaviour.Enormal n1) → eval_expr env e2 expr_behaviour.Eunbound_var → eval_expr env (Syntax.expr.Esub e1 e2) expr_behaviour.Eunbound_var
noncomputable def identifiers_in_expr : Syntax.expr -> Finset Syntax.program_var
  | (Syntax.expr.Elit x) => (∅ : Finset Syntax.program_var)
  | (Syntax.expr.Evar v) => insert v (∅ : Finset Syntax.program_var)
  | (Syntax.expr.Esub e1 e2) => identifiers_in_expr e1 ∪ identifiers_in_expr e2
inductive behavior where
  | Cnormal : behavior
  | Cunbound_var : behavior
  | Cloop_limit : behavior
axiom inhabited_axiom_behavior : Inhabited behavior
attribute [instance] inhabited_axiom_behavior
axiom config : Type
axiom inhabited_axiom_config : Inhabited config
attribute [instance] inhabited_axiom_config
axiom loop_limit : config -> Option ℤ
axiom config'invariant (self : config) : match loop_limit self with | Option.none => True | Option.some n => (0 : ℤ) ≤ n
noncomputable def config'eq (a : config) (b : config) := loop_limit a = loop_limit b
axiom config'inj (a : config) (b : config) (fact0 : config'eq a b) : a = b
axiom no_limit_cnf : config
axiom no_limit_cnf'def : loop_limit no_limit_cnf = Option.none
axiom mk_loop_cnf : ℤ -> config
axiom mk_loop_cnf'def (n : ℤ) (fact0 : (0 : ℤ) ≤ n) : loop_limit (mk_loop_cnf n) = Option.some n
mutual
inductive exec_cmd : config -> (Syntax.program_var -> Option ℤ) -> Syntax.cmd -> (Syntax.program_var -> Option ℤ) -> behavior -> Prop where
 | exec_skip (cnf : config) (env : Syntax.program_var -> Option ℤ) : exec_cmd cnf env Syntax.cmd.Cskip env behavior.Cnormal
 | exec_assign (env : Syntax.program_var -> Option ℤ) (e : Syntax.expr) (n : ℤ) (cnf : config) (v : Syntax.program_var) : eval_expr env e (expr_behaviour.Enormal n) → exec_cmd cnf env (Syntax.cmd.Cassign v e) (Function.update env v (Option.some n)) behavior.Cnormal
 | exec_assign_error (env : Syntax.program_var -> Option ℤ) (e : Syntax.expr) (cnf : config) (v : Syntax.program_var) : eval_expr env e expr_behaviour.Eunbound_var → exec_cmd cnf env (Syntax.cmd.Cassign v e) env behavior.Cunbound_var
 | exec_seq (cnf : config) (env1 : Syntax.program_var -> Option ℤ) (c1 : Syntax.cmd) (env2 : Syntax.program_var -> Option ℤ) (c2 : Syntax.cmd) (env3 : Syntax.program_var -> Option ℤ) (bhv : behavior) : exec_cmd cnf env1 c1 env2 behavior.Cnormal → exec_cmd cnf env2 c2 env3 bhv → exec_cmd cnf env1 (Syntax.cmd.Cseq c1 c2) env3 bhv
 | exec_seq_error (cnf : config) (env1 : Syntax.program_var -> Option ℤ) (c1 : Syntax.cmd) (env2 : Syntax.program_var -> Option ℤ) (bhv : behavior) (c2 : Syntax.cmd) : exec_cmd cnf env1 c1 env2 bhv → ¬bhv = behavior.Cnormal → exec_cmd cnf env1 (Syntax.cmd.Cseq c1 c2) env2 bhv
 | exec_if_false (env : Syntax.program_var -> Option ℤ) (e : Syntax.expr) (cnf : config) (c2 : Syntax.cmd) (env' : Syntax.program_var -> Option ℤ) (bhv : behavior) (c1 : Syntax.cmd) : eval_expr env e (expr_behaviour.Enormal (0 : ℤ)) → exec_cmd cnf env c2 env' bhv → exec_cmd cnf env (Syntax.cmd.Cif e c1 c2) env' bhv
 | exec_if_true (n : ℤ) (env : Syntax.program_var -> Option ℤ) (e : Syntax.expr) (cnf : config) (c1 : Syntax.cmd) (env' : Syntax.program_var -> Option ℤ) (bhv : behavior) (c2 : Syntax.cmd) : ¬n = (0 : ℤ) → eval_expr env e (expr_behaviour.Enormal n) → exec_cmd cnf env c1 env' bhv → exec_cmd cnf env (Syntax.cmd.Cif e c1 c2) env' bhv
 | exec_if_error (env : Syntax.program_var -> Option ℤ) (e : Syntax.expr) (cnf : config) (c1 : Syntax.cmd) (c2 : Syntax.cmd) : eval_expr env e expr_behaviour.Eunbound_var → exec_cmd cnf env (Syntax.cmd.Cif e c1 c2) env behavior.Cunbound_var
 | exec_while1 (cnf : config) (env : Syntax.program_var -> Option ℤ) (e : Syntax.expr) (c : Syntax.cmd) (env' : Syntax.program_var -> Option ℤ) (bhv : behavior) : exec_while cnf (0 : ℤ) env e c env' bhv → exec_cmd cnf env (Syntax.cmd.Cwhile e c) env' bhv
inductive exec_while : config -> ℤ -> (Syntax.program_var -> Option ℤ) -> Syntax.expr -> Syntax.cmd -> (Syntax.program_var -> Option ℤ) -> behavior -> Prop where
 | exec_while_overflow (cnf : config) (ctr : ℤ) (env : Syntax.program_var -> Option ℤ) (e : Syntax.expr) (c : Syntax.cmd) : (match loop_limit cnf with | Option.none => False | Option.some n => n ≤ ctr) → exec_while cnf ctr env e c env behavior.Cloop_limit
 | exec_while_false (cnf : config) (ctr : ℤ) (env : Syntax.program_var -> Option ℤ) (e : Syntax.expr) (c : Syntax.cmd) : (match loop_limit cnf with | Option.none => True | Option.some n => ctr < n) → eval_expr env e (expr_behaviour.Enormal (0 : ℤ)) → exec_while cnf ctr env e c env behavior.Cnormal
 | exec_while_test_error (cnf : config) (ctr : ℤ) (env : Syntax.program_var -> Option ℤ) (e : Syntax.expr) (c : Syntax.cmd) : (match loop_limit cnf with | Option.none => True | Option.some n => ctr < n) → eval_expr env e expr_behaviour.Eunbound_var → exec_while cnf ctr env e c env behavior.Cunbound_var
 | exec_while_body_error (cnf : config) (ctr : ℤ) (env1 : Syntax.program_var -> Option ℤ) (e : Syntax.expr) (v : ℤ) (c : Syntax.cmd) (env2 : Syntax.program_var -> Option ℤ) (bhv : behavior) : (match loop_limit cnf with | Option.none => True | Option.some n => ctr < n) → eval_expr env1 e (expr_behaviour.Enormal v) → ¬v = (0 : ℤ) → exec_cmd cnf env1 c env2 bhv → ¬bhv = behavior.Cnormal → exec_while cnf ctr env1 e c env2 bhv
 | exec_while_loop (cnf : config) (ctr : ℤ) (env1 : Syntax.program_var -> Option ℤ) (e : Syntax.expr) (v : ℤ) (c : Syntax.cmd) (env2 : Syntax.program_var -> Option ℤ) (env3 : Syntax.program_var -> Option ℤ) (bhv : behavior) : (match loop_limit cnf with | Option.none => True | Option.some n => ctr < n) → eval_expr env1 e (expr_behaviour.Enormal v) → ¬v = (0 : ℤ) → exec_cmd cnf env1 c env2 behavior.Cnormal → exec_while cnf (ctr + (1 : ℤ)) env2 e c env3 bhv → exec_while cnf ctr env1 e c env3 bhv
end
end ConcreteSemantics

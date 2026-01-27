import Why3.Base
import pearl.imp.lib.lean.imp.Syntax
open Classical
open Lean4Why3
namespace imp_ConcreteSemantics_eval_expr_functionalqtvc
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
theorem eval_expr_functional'vc (env : Syntax.program_var -> Option ℤ) (e : Syntax.expr) (n1 : expr_behaviour) (n2 : expr_behaviour) (fact0 : eval_expr env e n1) (fact1 : eval_expr env e n2) : n1 = n2
  := sorry
end imp_ConcreteSemantics_eval_expr_functionalqtvc

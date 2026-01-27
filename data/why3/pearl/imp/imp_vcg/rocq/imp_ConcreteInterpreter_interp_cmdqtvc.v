From Stdlib Require Import Strings.String.
From Stdlib Require Import String Ascii.
From Stdlib Require Arith.
From stdpp Require Import base.
From stdpp Require Import fin_maps.
From stdpp Require Import gmap.
From stdpp Require Import base gmultiset.
From Stdlib Require Classical.
From Stdlib Require Import ZArith.
From stdpp.bitvector Require Import definitions tactics.
From Stdlib Require Import Sorting.Sorted.
From Stdlib Require Import Reals.Rbasic_fun.
From Stdlib Require Import Reals.Abstract.ConstructiveAbs.
From Stdlib Require Import Reals.Rdefinitions.
From stdpp Require Import list_relations.
From stdpp Require Import list_numbers.
From stdpp Require Import functions.
From Stdlib Require Import ClassicalEpsilon.
From stdpp Require Import base decidable.
From Stdlib Require Import ZArith.Zeuclid.
From Stdlib Require Import ZArith.Znumtheory.
From stdpp Require Import propset.
From Stdlib Require Import Reals.
Require Import Why3.Base.
Require Import Why3.why3.Ref.Ref.
Require Import imp.imp.Syntax.
Require Import imp.imp.ConcreteSemantics.
Require Import imp.dict.Imperative.
Open Scope Z_scope.
Axiom env : Type.
Axiom env_inhabited : Inhabited env.
Global Existing Instance env_inhabited.
Axiom env_countable : Countable env.
Global Existing Instance env_countable.
Theorem interp_cmd'vc (c : cmd) (env1 : t program_var Z) : match c with | Cskip => exec_cmd no_limit_cnf (model1 env1) c (model1 env1) Cnormal | Cassign x e => (∀(o1 : Z), eval_expr (model1 env1) e (Enormal o1) -> (∀(env2 : t program_var Z), model1 env2 = fun_updt (model1 env1) x (Some o1) -> exec_cmd no_limit_cnf (model1 env1) c (model1 env2) Cnormal)) ∧ (eval_expr (model1 env1) e Eunbound_var -> exec_cmd no_limit_cnf (model1 env1) c (model1 env1) Cunbound_var) | Cseq c1 c2 => (∀(env2 : t program_var Z), (exec_cmd no_limit_cnf (model1 env1) c1 (model1 env2) Cnormal -> (∀(env3 : t program_var Z), (exec_cmd no_limit_cnf (model1 env2) c2 (model1 env3) Cnormal -> exec_cmd no_limit_cnf (model1 env1) c (model1 env3) Cnormal) ∧ (exec_cmd no_limit_cnf (model1 env2) c2 (model1 env3) Cunbound_var -> exec_cmd no_limit_cnf (model1 env1) c (model1 env3) Cunbound_var))) ∧ (exec_cmd no_limit_cnf (model1 env1) c1 (model1 env2) Cunbound_var -> exec_cmd no_limit_cnf (model1 env1) c (model1 env2) Cunbound_var)) | Cif e c1 c2 => (∀(o1 : Z), eval_expr (model1 env1) e (Enormal o1) -> (if decide (¬ o1 = 0%Z) then ∀(env2 : t program_var Z), (exec_cmd no_limit_cnf (model1 env1) c1 (model1 env2) Cnormal -> exec_cmd no_limit_cnf (model1 env1) c (model1 env2) Cnormal) ∧ (exec_cmd no_limit_cnf (model1 env1) c1 (model1 env2) Cunbound_var -> exec_cmd no_limit_cnf (model1 env1) c (model1 env2) Cunbound_var) else ∀(env2 : t program_var Z), (exec_cmd no_limit_cnf (model1 env1) c2 (model1 env2) Cnormal -> exec_cmd no_limit_cnf (model1 env1) c (model1 env2) Cnormal) ∧ (exec_cmd no_limit_cnf (model1 env1) c2 (model1 env2) Cunbound_var -> exec_cmd no_limit_cnf (model1 env1) c (model1 env2) Cunbound_var))) ∧ (eval_expr (model1 env1) e Eunbound_var -> exec_cmd no_limit_cnf (model1 env1) c (model1 env1) Cunbound_var) | Cwhile e c1 => (let env0 : program_var -> option Z := model1 env1 in (∀(env11 : program_var -> option Z) (bhv : behavior), exec_while no_limit_cnf 0%Z (model1 env1) e c1 env11 bhv -> exec_while no_limit_cnf 0%Z env0 e c1 env11 bhv) ∧ (∀(ctr : Z) (env2 : t program_var Z), (∀(env11 : program_var -> option Z) (bhv : behavior), exec_while no_limit_cnf ctr (model1 env2) e c1 env11 bhv -> exec_while no_limit_cnf 0%Z env0 e c1 env11 bhv) -> (∀(o1 : Z), eval_expr (model1 env2) e (Enormal o1) -> (if decide (¬ o1 = 0%Z) then ∀(env3 : t program_var Z), (exec_cmd no_limit_cnf (model1 env2) c1 (model1 env3) Cnormal -> (∀(env11 : program_var -> option Z) (bhv : behavior), exec_while no_limit_cnf (ctr + 1%Z) (model1 env3) e c1 env11 bhv -> exec_while no_limit_cnf 0%Z env0 e c1 env11 bhv)) ∧ (exec_cmd no_limit_cnf (model1 env2) c1 (model1 env3) Cunbound_var -> exec_cmd no_limit_cnf (model1 env1) c (model1 env3) Cunbound_var) else exec_cmd no_limit_cnf (model1 env1) c (model1 env2) Cnormal)) ∧ (eval_expr (model1 env2) e Eunbound_var -> exec_cmd no_limit_cnf (model1 env1) c (model1 env2) Cunbound_var))) end.
Admitted.

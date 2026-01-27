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
Require Import imp.imp.Syntax.
Open Scope Z_scope.
Axiom environment : Type.
Axiom environment_inhabited : Inhabited environment.
Global Existing Instance environment_inhabited.
Axiom environment_countable : Countable environment.
Global Existing Instance environment_countable.
Inductive expr_behaviour :=
  | Enormal : Z -> expr_behaviour
  | Eunbound_var : expr_behaviour.
Axiom expr_behaviour_inhabited : Inhabited expr_behaviour.
Global Existing Instance expr_behaviour_inhabited.
Axiom expr_behaviour_countable : Countable expr_behaviour.
Global Existing Instance expr_behaviour_countable.
Inductive eval_expr : (program_var -> option Z) -> expr -> expr_behaviour -> Prop :=
 | eval_lit (env : program_var -> option Z) (n : Z) : eval_expr env (Elit n) (Enormal n)
 | eval_var (env : program_var -> option Z) (x : program_var) (n : Z) : env x = Some n -> eval_expr env (Evar x) (Enormal n)
 | eval_var_undefined (env : program_var -> option Z) (x : program_var) : env x = None -> eval_expr env (Evar x) Eunbound_var
 | eval_sub (env : program_var -> option Z) (e1 : expr) (n1 : Z) (e2 : expr) (n2 : Z) : eval_expr env e1 (Enormal n1) -> eval_expr env e2 (Enormal n2) -> eval_expr env (Esub e1 e2) (Enormal (n1 - n2))
 | eval_sub_error1 (env : program_var -> option Z) (e1 : expr) (e2 : expr) : eval_expr env e1 Eunbound_var -> eval_expr env (Esub e1 e2) Eunbound_var
 | eval_sub_error2 (env : program_var -> option Z) (e1 : expr) (n1 : Z) (e2 : expr) : eval_expr env e1 (Enormal n1) -> eval_expr env e2 Eunbound_var -> eval_expr env (Esub e1 e2) Eunbound_var.
Program Fixpoint identifiers_in_expr (e : expr) : gset program_var :=
match e with | Elit _ => (∅ : gset program_var) | Evar v => ({[v]} : gset _) | Esub e1 e2 => identifiers_in_expr e1 ∪ identifiers_in_expr e2 end.
Admit Obligations.
Inductive behavior :=
  | Cnormal : behavior
  | Cunbound_var : behavior
  | Cloop_limit : behavior.
Axiom behavior_inhabited : Inhabited behavior.
Global Existing Instance behavior_inhabited.
Axiom behavior_countable : Countable behavior.
Global Existing Instance behavior_countable.
Theorem config'vc : True.
Admitted.

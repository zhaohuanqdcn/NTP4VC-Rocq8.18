From Coq Require Import Strings.String.
From Coq Require Import String Ascii.
From Coq Require Arith.
From stdpp Require Import base.
From stdpp Require Import fin_maps.
From stdpp Require Import gmap.
From stdpp Require Import base gmultiset.
From Coq Require Classical.
From Coq Require Import ZArith.
From stdpp.bitvector Require Import definitions tactics.
From Coq Require Import Sorting.Sorted.
From Coq Require Import Reals.Rbasic_fun.
From Coq Require Import Reals.Abstract.ConstructiveAbs.
From Coq Require Import Reals.Rdefinitions.
From stdpp Require Import list_relations.
From stdpp Require Import list_numbers.
From stdpp Require Import functions.
From Coq Require Import ClassicalEpsilon.
From stdpp Require Import base decidable.
From Coq Require Import ZArith.Zeuclid.
From Coq Require Import ZArith.Znumtheory.
From stdpp Require Import propset.
From Coq Require Import Reals.
Require Import Why3.Base.
Require Import Why3.why3.Ref.Ref.
Require Import prover.Unification.Types.
Require Import prover.Functions.Config.
Require Import prover.Functions.Func.
Require Import prover.BacktrackArray.Types.
Require Import prover.Predicates.Pred.
Require Import prover.BacktrackArray.Logic.
Require Import prover.Choice.Choice.
Require Import prover.BacktrackArray.Impl.
Require Import prover.Firstorder_symbol_spec.Spec.
Require Import prover.Nat.Nat.
Require Import prover.OptionFuncs.Funcs.
Require Import prover.Sum.Sum.
Require Import prover.Firstorder_symbol_impl.Types.
Require Import prover.Firstorder_symbol_impl.Logic.
Require Import prover.Firstorder_symbol_impl.Impl.
Require Import prover.Firstorder_term_spec.Spec.
Require Import prover.Firstorder_term_impl.Types.
Require Import prover.Firstorder_term_impl.Logic.
Require Import prover.Firstorder_term_impl.Impl.
Require Import prover.Unification.Logic.
Open Scope Z_scope.
Theorem unification_term_list'vc (t1 : nlimpl_fo_term_list) (t2 : nlimpl_fo_term_list) (rhob : t sdata) (rho : unifier_subst) (lv : list Z) (lp : Z -> bool) (fact0 : nlimpl_fo_term_list_ok t1) (fact1 : nlimpl_fo_term_list_ok t2) (fact2 : unifier_subst_ok rhob rho) (fact3 : ∀(y : Z), is_fo_term_free_var_in_fo_term_list y (model_fo_term_list_field t1) -> 0%Z ≤ y) (fact4 : ∀(y : Z), is_fo_term_free_var_in_fo_term_list y (model_fo_term_list_field t2) -> 0%Z ≤ y) (fact5 : ∀(x : Z), x ∈ lv -> lp x = true ∧ 0%Z ≤ x) (fact6 : ∀(x : Z), unassigned (current_timestamp rhob) x -> lp x = true) : nlimpl_fo_term_list_ok t2 ∧ (∀(o1 : cons_fo_term_list), cons_ok_fo_term_list o1 ∧ cons_rel_fo_term_list o1 t2 ∧ cons_open_rel_fo_term_list o1 t2 -> nlimpl_fo_term_list_ok t1 ∧ (∀(o2 : cons_fo_term_list), cons_ok_fo_term_list o2 ∧ cons_rel_fo_term_list o2 t1 ∧ cons_open_rel_fo_term_list o2 t1 -> (match o1 with | NLC_FONil => (match o2 with | NLC_FONil => unifier_subst_ok rhob rho ∧ precede rhob rhob ∧ (∀(x : Z), x ∈ lv -> lp x = true ∧ 0%Z ≤ x) ∧ (∀(x : Z), unassigned (current_timestamp rhob) x -> lp x = true) ∧ subst_compose_fo_term (unifier rho) subst_id_symbol (subst_id_fo_term : Z -> fo_term Z Z) = unifier rho ∧ (∀(s : Z -> fo_term Z Z), let s' : Z -> fo_term Z Z := subst_compose_fo_term (unifier rho) subst_id_symbol s in subst_fo_term_list (model_fo_term_list_field t1) subst_id_symbol s' = subst_fo_term_list (model_fo_term_list_field t2) subst_id_symbol s' -> s' = subst_compose_fo_term (unifier rho) subst_id_symbol s) ∧ (let s0 : Z -> fo_term Z Z := unifier rho in subst_fo_term_list (model_fo_term_list_field t1) subst_id_symbol s0 = subst_fo_term_list (model_fo_term_list_field t2) subst_id_symbol s0) ∧ (let s0 : Z -> fo_term Z Z := unifier rho in let s1 : Z -> fo_term Z Z := unifier_base_model rho in subst_compose_fo_term s0 subst_id_symbol s1 = s0 ∧ s0 = subst_compose_fo_term s1 subst_id_symbol s0) ∧ (let s0 : Z -> fo_term Z Z := unifier rho in let s1 : Z -> fo_term Z Z := unifier rho in subst_compose_fo_term s0 subst_id_symbol s1 = s0 ∧ s0 = subst_compose_fo_term s1 subst_id_symbol s0) | NLC_FOCons x x1 => precede rhob rhob ∧ correct rhob end) | NLC_FOCons x x1 => (match o2 with | NLC_FOCons x2 x3 => (nlimpl_fo_term_list_ok x3 ∧ nlimpl_fo_term_list_ok x1 ∧ unifier_subst_ok rhob rho ∧ (∀(y : Z), is_fo_term_free_var_in_fo_term_list y (model_fo_term_list_field x3) -> 0%Z ≤ y) ∧ (∀(y : Z), is_fo_term_free_var_in_fo_term_list y (model_fo_term_list_field x1) -> 0%Z ≤ y) ∧ (∀(x4 : Z), x4 ∈ lv -> lp x4 = true ∧ 0%Z ≤ x4) ∧ (∀(x4 : Z), unassigned (current_timestamp rhob) x4 -> lp x4 = true)) ∧ (∀(rhob1 : t sdata) (lv1 : list Z), inv rhob1 = inv rhob -> (∀(rho2 : unification_return), unifier_subst_ok rhob1 (final_unifier rho2) ∧ precede rhob rhob1 ∧ (∀(x4 : Z), x4 ∈ lv1 -> lp x4 = true ∧ 0%Z ≤ x4) ∧ (∀(x4 : Z), unassigned (current_timestamp rhob1) x4 -> lp x4 = true) ∧ subst_compose_fo_term (unifier rho) subst_id_symbol (unifier_factor rho2) = unifier (final_unifier rho2) ∧ (∀(s : Z -> fo_term Z Z), let s' : Z -> fo_term Z Z := subst_compose_fo_term (unifier rho) subst_id_symbol s in subst_fo_term_list (model_fo_term_list_field x3) subst_id_symbol s' = subst_fo_term_list (model_fo_term_list_field x1) subst_id_symbol s' -> s' = subst_compose_fo_term (unifier (final_unifier rho2)) subst_id_symbol s) ∧ (let s0 : Z -> fo_term Z Z := unifier (final_unifier rho2) in subst_fo_term_list (model_fo_term_list_field x3) subst_id_symbol s0 = subst_fo_term_list (model_fo_term_list_field x1) subst_id_symbol s0) ∧ (let s0 : Z -> fo_term Z Z := unifier (final_unifier rho2) in let s1 : Z -> fo_term Z Z := unifier_base_model rho in subst_compose_fo_term s0 subst_id_symbol s1 = s0 ∧ s0 = subst_compose_fo_term s1 subst_id_symbol s0) ∧ (let s0 : Z -> fo_term Z Z := unifier (final_unifier rho2) in let s1 : Z -> fo_term Z Z := unifier rho in subst_compose_fo_term s0 subst_id_symbol s1 = s0 ∧ s0 = subst_compose_fo_term s1 subst_id_symbol s0) -> (let rho2f : unifier_subst := final_unifier rho2 in (nlimpl_fo_term_ok x2 ∧ nlimpl_fo_term_ok x ∧ unifier_subst_ok rhob1 rho2f ∧ (∀(y : Z), is_fo_term_free_var_in_fo_term y (model_fo_term_field x2) -> 0%Z ≤ y) ∧ (∀(y : Z), is_fo_term_free_var_in_fo_term y (model_fo_term_field x) -> 0%Z ≤ y) ∧ (∀(x4 : Z), x4 ∈ lv1 -> lp x4 = true ∧ 0%Z ≤ x4) ∧ (∀(x4 : Z), unassigned (current_timestamp rhob1) x4 -> lp x4 = true)) ∧ (∀(rhob2 : t sdata) (lv2 : list Z), inv rhob2 = inv rhob1 -> (∀(rho3 : unification_return), unifier_subst_ok rhob2 (final_unifier rho3) ∧ precede rhob1 rhob2 ∧ (∀(x4 : Z), x4 ∈ lv2 -> lp x4 = true ∧ 0%Z ≤ x4) ∧ (∀(x4 : Z), unassigned (current_timestamp rhob2) x4 -> lp x4 = true) ∧ subst_compose_fo_term (unifier rho2f) subst_id_symbol (unifier_factor rho3) = unifier (final_unifier rho3) ∧ (∀(s : Z -> fo_term Z Z), let s' : Z -> fo_term Z Z := subst_compose_fo_term (unifier rho2f) subst_id_symbol s in subst_fo_term (model_fo_term_field x2) subst_id_symbol s' = subst_fo_term (model_fo_term_field x) subst_id_symbol s' -> s' = subst_compose_fo_term (unifier (final_unifier rho3)) subst_id_symbol s) ∧ (let s0 : Z -> fo_term Z Z := unifier (final_unifier rho3) in subst_fo_term (model_fo_term_field x2) subst_id_symbol s0 = subst_fo_term (model_fo_term_field x) subst_id_symbol s0) ∧ (let s0 : Z -> fo_term Z Z := unifier (final_unifier rho3) in let s1 : Z -> fo_term Z Z := unifier_base_model rho2f in subst_compose_fo_term s0 subst_id_symbol s1 = s0 ∧ s0 = subst_compose_fo_term s1 subst_id_symbol s0) ∧ (let s0 : Z -> fo_term Z Z := unifier (final_unifier rho3) in let s1 : Z -> fo_term Z Z := unifier rho2f in subst_compose_fo_term s0 subst_id_symbol s1 = s0 ∧ s0 = subst_compose_fo_term s1 subst_id_symbol s0) -> (let o3 : unifier_subst := final_unifier rho3 in unifier_subst_ok rhob2 o3 ∧ precede rhob rhob2 ∧ (∀(x4 : Z), x4 ∈ lv2 -> lp x4 = true ∧ 0%Z ≤ x4) ∧ (∀(x4 : Z), unassigned (current_timestamp rhob2) x4 -> lp x4 = true) ∧ subst_compose_fo_term (unifier rho) subst_id_symbol (subst_compose_fo_term (unifier_factor rho2) subst_id_symbol (unifier_factor rho3)) = unifier o3 ∧ (∀(s : Z -> fo_term Z Z), let s' : Z -> fo_term Z Z := subst_compose_fo_term (unifier rho) subst_id_symbol s in subst_fo_term_list (model_fo_term_list_field t1) subst_id_symbol s' = subst_fo_term_list (model_fo_term_list_field t2) subst_id_symbol s' -> s' = subst_compose_fo_term (unifier o3) subst_id_symbol s) ∧ (let s0 : Z -> fo_term Z Z := unifier o3 in subst_fo_term_list (model_fo_term_list_field t1) subst_id_symbol s0 = subst_fo_term_list (model_fo_term_list_field t2) subst_id_symbol s0) ∧ (let s0 : Z -> fo_term Z Z := unifier o3 in let s1 : Z -> fo_term Z Z := unifier_base_model rho in subst_compose_fo_term s0 subst_id_symbol s1 = s0 ∧ s0 = subst_compose_fo_term s1 subst_id_symbol s0) ∧ (let s0 : Z -> fo_term Z Z := unifier o3 in let s1 : Z -> fo_term Z Z := unifier rho in subst_compose_fo_term s0 subst_id_symbol s1 = s0 ∧ s0 = subst_compose_fo_term s1 subst_id_symbol s0))) ∧ (precede rhob1 rhob2 ∧ correct rhob2 -> precede rhob rhob2 ∧ correct rhob2))))) | NLC_FONil => precede rhob rhob ∧ correct rhob end) end))).
Proof.
Admitted.

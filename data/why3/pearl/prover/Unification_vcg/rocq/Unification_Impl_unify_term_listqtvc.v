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
Axiom unassigned_closure : timestamp sdata -> Z -> bool.
Axiom unassigned_closure_def : forall  (y : timestamp sdata) (y1 : Z), (unassigned_closure y y1 = true) = unassigned y y1.
Theorem unify_term_list'vc (t1 : nlimpl_fo_term_list) (t2 : nlimpl_fo_term_list) (rhob : t sdata) (rho : unifier_subst) (fact0 : nlimpl_fo_term_list_ok t1) (fact1 : ∀(x : Z), is_fo_term_free_var_in_fo_term_list x (model_fo_term_list_field t1) -> 0%Z ≤ x) (fact2 : nlimpl_fo_term_list_ok t2) (fact3 : ∀(x : Z), is_fo_term_free_var_in_fo_term_list x (model_fo_term_list_field t2) -> 0%Z ≤ x) (fact4 : unifier_subst_ok rhob rho) : let lp : Z -> bool := unassigned_closure (current_timestamp rhob) in (nlimpl_fo_term_list_ok t1 ∧ nlimpl_fo_term_list_ok t2 ∧ unifier_subst_ok rhob rho ∧ (∀(y : Z), is_fo_term_free_var_in_fo_term_list y (model_fo_term_list_field t1) -> 0%Z ≤ y) ∧ (∀(y : Z), is_fo_term_free_var_in_fo_term_list y (model_fo_term_list_field t2) -> 0%Z ≤ y) ∧ (∀(x : Z), x ∈ ([] : list Z) -> lp x = true ∧ 0%Z ≤ x) ∧ (∀(x : Z), unassigned (current_timestamp rhob) x -> lp x = true)) ∧ (∀(rhob1 : t sdata) (watch : list Z), inv rhob1 = inv rhob -> (∀(u : unification_return), unifier_subst_ok rhob1 (final_unifier u) ∧ precede rhob rhob1 ∧ (∀(x : Z), x ∈ watch -> lp x = true ∧ 0%Z ≤ x) ∧ (∀(x : Z), unassigned (current_timestamp rhob1) x -> lp x = true) ∧ subst_compose_fo_term (unifier rho) subst_id_symbol (unifier_factor u) = unifier (final_unifier u) ∧ (∀(s : Z -> fo_term Z Z), let s' : Z -> fo_term Z Z := subst_compose_fo_term (unifier rho) subst_id_symbol s in subst_fo_term_list (model_fo_term_list_field t1) subst_id_symbol s' = subst_fo_term_list (model_fo_term_list_field t2) subst_id_symbol s' -> s' = subst_compose_fo_term (unifier (final_unifier u)) subst_id_symbol s) ∧ (let s0 : Z -> fo_term Z Z := unifier (final_unifier u) in subst_fo_term_list (model_fo_term_list_field t1) subst_id_symbol s0 = subst_fo_term_list (model_fo_term_list_field t2) subst_id_symbol s0) ∧ (let s0 : Z -> fo_term Z Z := unifier (final_unifier u) in let s1 : Z -> fo_term Z Z := unifier_base_model rho in subst_compose_fo_term s0 subst_id_symbol s1 = s0 ∧ s0 = subst_compose_fo_term s1 subst_id_symbol s0) ∧ (let s0 : Z -> fo_term Z Z := unifier (final_unifier u) in let s1 : Z -> fo_term Z Z := unifier rho in subst_compose_fo_term s0 subst_id_symbol s1 = s0 ∧ s0 = subst_compose_fo_term s1 subst_id_symbol s0) -> (let o1 : unifier_subst := final_unifier u in ((∀(x : Z), x ∈ watch -> 0%Z ≤ x) ∧ unifier_subst_ok rhob1 o1) ∧ (∀(rhob2 : t sdata), inv rhob2 = inv rhob1 -> (unifier_subst_ok rhob2 o1 ∧ precede rhob1 rhob2 -> unifier_subst_ok rhob2 (final_unifier u) ∧ unifier (final_unifier u) = subst_compose_fo_term (unifier rho) subst_id_symbol (unifier_factor u) ∧ precede rhob rhob2 ∧ (∀(s : Z -> fo_term Z Z), let s' : Z -> fo_term Z Z := subst_compose_fo_term (unifier rho) subst_id_symbol s in subst_fo_term_list (model_fo_term_list_field t1) subst_id_symbol s' = subst_fo_term_list (model_fo_term_list_field t2) subst_id_symbol s' -> s' = subst_compose_fo_term (unifier (final_unifier u)) subst_id_symbol s) ∧ (let s0 : Z -> fo_term Z Z := unifier (final_unifier u) in subst_fo_term_list (model_fo_term_list_field t1) subst_id_symbol s0 = subst_fo_term_list (model_fo_term_list_field t2) subst_id_symbol s0)) ∧ (correct rhob2 ∧ precede rhob1 rhob2 -> correct rhob2 ∧ precede rhob rhob2)))) ∧ (precede rhob rhob1 ∧ correct rhob1 -> correct rhob1 ∧ precede rhob rhob1)).
Proof.
Admitted.

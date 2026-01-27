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
Theorem conflict'vc (t1 : nlimpl_fo_term_list) (t2 : nlimpl_fo_term_list) (rhob : Types.t sdata) (rho : unifier_subst) (fact0 : sdata_inv (PConflict t1 t2) = true) (fact1 : unifier_subst_ok rhob rho) : correct rhob ∧ (let t : timestamp sdata := current_timestamp rhob in let lp : Z -> bool := unassigned_closure (current_timestamp rhob) in (nlimpl_fo_term_list_ok t1 ∧ nlimpl_fo_term_list_ok t2 ∧ unifier_subst_ok rhob rho ∧ (∀(y : Z), is_fo_term_free_var_in_fo_term_list y (model_fo_term_list_field t1) -> 0%Z ≤ y) ∧ (∀(y : Z), is_fo_term_free_var_in_fo_term_list y (model_fo_term_list_field t2) -> 0%Z ≤ y) ∧ (∀(x : Z), x ∈ ([] : list Z) -> lp x = true ∧ 0%Z ≤ x) ∧ (∀(x : Z), unassigned (current_timestamp rhob) x -> lp x = true)) ∧ (∀(l : list Z) (rhob1 : Types.t sdata), inv rhob1 = inv rhob -> (∀(o1 : unification_return), unifier_subst_ok rhob1 (final_unifier o1) ∧ precede rhob rhob1 ∧ (∀(x : Z), x ∈ l -> lp x = true ∧ 0%Z ≤ x) ∧ (∀(x : Z), unassigned (current_timestamp rhob1) x -> lp x = true) ∧ subst_compose_fo_term (unifier rho) subst_id_symbol (unifier_factor o1) = unifier (final_unifier o1) ∧ (∀(s : Z -> fo_term Z Z), let s' : Z -> fo_term Z Z := subst_compose_fo_term (unifier rho) subst_id_symbol s in subst_fo_term_list (model_fo_term_list_field t1) subst_id_symbol s' = subst_fo_term_list (model_fo_term_list_field t2) subst_id_symbol s' -> s' = subst_compose_fo_term (unifier (final_unifier o1)) subst_id_symbol s) ∧ (let s0 : Z -> fo_term Z Z := unifier (final_unifier o1) in subst_fo_term_list (model_fo_term_list_field t1) subst_id_symbol s0 = subst_fo_term_list (model_fo_term_list_field t2) subst_id_symbol s0) ∧ (let s0 : Z -> fo_term Z Z := unifier (final_unifier o1) in let s1 : Z -> fo_term Z Z := unifier_base_model rho in subst_compose_fo_term s0 subst_id_symbol s1 = s0 ∧ s0 = subst_compose_fo_term s1 subst_id_symbol s0) ∧ (let s0 : Z -> fo_term Z Z := unifier (final_unifier o1) in let s1 : Z -> fo_term Z Z := unifier rho in subst_compose_fo_term s0 subst_id_symbol s1 = s0 ∧ s0 = subst_compose_fo_term s1 subst_id_symbol s0) -> (match l with | [] => precede rhob rhob1 ∧ correct rhob1 | cons v _ => (past_time t rhob1 ∧ correct rhob1) ∧ (∀(rhob2 : Types.t sdata), inv rhob2 = inv rhob1 -> correct rhob2 ∧ current_timestamp rhob2 = t ∧ past_time (current_timestamp rhob2) rhob2 ∧ (∀(t21 : timestamp sdata), before t21 t ∧ past_time t21 rhob1 -> past_time t21 rhob2) ∧ precede rhob2 rhob1 -> (let o2 : sdata := PConflict t1 t2 in (correct rhob2 ∧ 0%Z ≤ v ∧ inv rhob2 o2 = true) ∧ (∀(rhob3 : Types.t sdata), inv rhob3 = inv rhob2 -> past_time (current_timestamp rhob3) rhob3 ∧ correct rhob3 ∧ precede rhob2 rhob3 ∧ (let tb0 : Z -> list sdata := table (current_timestamp rhob2) in table (current_timestamp rhob3) = update tb0 v (cons o2 (tb0 v))) -> unifier_subst_ok rhob3 rho ∧ precede rhob rhob3))) end)) ∧ (precede rhob rhob1 ∧ correct rhob1 -> (past_time t rhob1 ∧ correct rhob1) ∧ (∀(rhob2 : Types.t sdata), inv rhob2 = inv rhob1 -> correct rhob2 ∧ current_timestamp rhob2 = t ∧ past_time (current_timestamp rhob2) rhob2 ∧ (∀(t21 : timestamp sdata), before t21 t ∧ past_time t21 rhob1 -> past_time t21 rhob2) ∧ precede rhob2 rhob1 -> unifier_subst_ok rhob2 rho ∧ precede rhob rhob2)))).
Admitted.

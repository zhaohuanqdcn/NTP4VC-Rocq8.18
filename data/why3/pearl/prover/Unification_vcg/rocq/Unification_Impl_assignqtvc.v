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
Theorem assign'vc (z : Z) (t : nlimpl_fo_term) (rhob : Types.t sdata) (rho : unifier_subst) (lv : list Z) (lp : Z -> bool) (fact0 : 0%Z ≤ z) (fact1 : nlimpl_fo_term_ok t) (fact2 : unifier_subst_ok rhob rho) (fact3 : unassigned (current_timestamp rhob) z) (fact4 : ¬ subst_fo_term (model_fo_term_field t) subst_id_symbol (unifier rho) = Var_fo_term z) (fact5 : ∀(y : Z), is_fo_term_free_var_in_fo_term y (model_fo_term_field t) -> 0%Z ≤ y) (fact6 : ∀(x : Z), x ∈ lv -> lp x = true ∧ 0%Z ≤ x) (fact7 : ∀(x : Z), unassigned (current_timestamp rhob) x -> lp x = true) : let tm : fo_term Z Z := model_fo_term_field t in let rhoi : Z -> fo_term Z Z := unifier rho in (unifier_subst_ok rhob rho ∧ unassigned (current_timestamp rhob) z) ∧ ((let tm1 : fo_term Z Z := Var_fo_term z in tm1 = subst_fo_term tm1 subst_id_symbol (unifier_base_model rho) ∧ tm1 = subst_fo_term tm1 subst_id_symbol (unifier rho)) -> (unifier_subst_ok rhob rho ∧ nlimpl_fo_term_ok t ∧ (∀(y : Z), is_fo_term_free_var_in_fo_term y (model_fo_term_field t) -> 0%Z ≤ y)) ∧ (¬ is_fo_term_free_var_in_fo_term z (subst_fo_term (model_fo_term_field t) subst_id_symbol (unifier rho)) -> (let uf : Z -> fo_term Z Z := update (subst_id_fo_term : Z -> fo_term Z Z) z (subst_fo_term tm subst_id_symbol rhoi) in let rhoi' : Z -> fo_term Z Z := subst_compose_fo_term rhoi subst_id_symbol uf in let o1 : sdata := Assign t in (correct rhob ∧ 0%Z ≤ z ∧ inv rhob o1 = true) ∧ (∀(rhob1 : Types.t sdata), inv rhob1 = inv rhob -> past_time (current_timestamp rhob1) rhob1 ∧ correct rhob1 ∧ precede rhob rhob1 ∧ (let tb0 : Z -> list sdata := table (current_timestamp rhob) in table (current_timestamp rhob1) = update tb0 z (cons o1 (tb0 z))) -> (∀(x : Z), x ∈ cons z lv -> lp x = true ∧ 0%Z ≤ x) ∧ (∀(x : Z), unassigned (current_timestamp rhob1) x -> lp x = true) ∧ unifier_subst_ok rhob1 (unifier_subst'mk (update (unifier_base_model rho) z tm) rhoi') ∧ precede rhob rhob1 ∧ subst_compose_fo_term (unifier rho) subst_id_symbol uf = rhoi' ∧ (∀(s : Z -> fo_term Z Z), let s' : Z -> fo_term Z Z := subst_compose_fo_term (unifier rho) subst_id_symbol s in s' z = subst_fo_term (model_fo_term_field t) subst_id_symbol s' -> s' = subst_compose_fo_term rhoi' subst_id_symbol s) ∧ rhoi' z = subst_fo_term (model_fo_term_field t) subst_id_symbol rhoi' ∧ (let s1 : Z -> fo_term Z Z := unifier_base_model rho in subst_compose_fo_term rhoi' subst_id_symbol s1 = rhoi' ∧ rhoi' = subst_compose_fo_term s1 subst_id_symbol rhoi') ∧ (let s1 : Z -> fo_term Z Z := unifier rho in subst_compose_fo_term rhoi' subst_id_symbol s1 = rhoi' ∧ rhoi' = subst_compose_fo_term s1 subst_id_symbol rhoi')))) ∧ precede rhob rhob ∧ correct rhob).
Proof.
Admitted.

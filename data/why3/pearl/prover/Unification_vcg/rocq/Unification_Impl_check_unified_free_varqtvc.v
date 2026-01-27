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
Theorem check_unified_free_var'vc (rhob : Types.t sdata) (rho : unifier_subst) (t : nlimpl_fo_term) (x : Z) (fact0 : unifier_subst_ok rhob rho) (fact1 : nlimpl_fo_term_ok t) (fact2 : ∀(y : Z), is_fo_term_free_var_in_fo_term y (model_fo_term_field t) -> 0%Z ≤ y) : nlimpl_fo_term_ok t ∧ (∀(o1 : cons_fo_term), cons_ok_fo_term o1 ∧ cons_rel_fo_term o1 t ∧ cons_open_rel_fo_term o1 t -> (match o1 with | NLCVar_fo_term y => (correct rhob ∧ 0%Z ≤ y) ∧ (let by' : list sdata := table (current_timestamp rhob) y in list_forall (inv rhob) by' -> (match by' with | [] => (unifier_subst_ok rhob rho ∧ unassigned (current_timestamp rhob) y) ∧ ((let tm : fo_term Z Z := Var_fo_term y in tm = subst_fo_term tm subst_id_symbol (unifier_base_model rho) ∧ tm = subst_fo_term tm subst_id_symbol (unifier rho)) -> ¬ x = y -> ¬ is_fo_term_free_var_in_fo_term x (subst_fo_term (model_fo_term_field t) subst_id_symbol (unifier rho))) | cons (PConflict _ _) _ => (unifier_subst_ok rhob rho ∧ unassigned (current_timestamp rhob) y) ∧ ((let tm : fo_term Z Z := Var_fo_term y in tm = subst_fo_term tm subst_id_symbol (unifier_base_model rho) ∧ tm = subst_fo_term tm subst_id_symbol (unifier rho)) -> ¬ x = y -> ¬ is_fo_term_free_var_in_fo_term x (subst_fo_term (model_fo_term_field t) subst_id_symbol (unifier rho))) | cons (Assign t2) _ => (unifier_subst_ok rhob rho ∧ nlimpl_fo_term_ok t2 ∧ (∀(y1 : Z), is_fo_term_free_var_in_fo_term y1 (model_fo_term_field t2) -> 0%Z ≤ y1)) ∧ (¬ is_fo_term_free_var_in_fo_term x (subst_fo_term (model_fo_term_field t2) subst_id_symbol (unifier rho)) -> ¬ is_fo_term_free_var_in_fo_term x (subst_fo_term (model_fo_term_field t) subst_id_symbol (unifier rho))) end)) | NLC_App f l => (nlimpl_fo_term_list_ok l ∧ unifier_subst_ok rhob rho ∧ (∀(y : Z), is_fo_term_free_var_in_fo_term_list y (model_fo_term_list_field l) -> 0%Z ≤ y)) ∧ (¬ is_fo_term_free_var_in_fo_term_list x (subst_fo_term_list (model_fo_term_list_field l) subst_id_symbol (unifier rho)) -> ¬ is_fo_term_free_var_in_fo_term x (subst_fo_term (model_fo_term_field t) subst_id_symbol (unifier rho))) end)).
Admitted.

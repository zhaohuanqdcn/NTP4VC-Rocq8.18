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
Theorem conflicts'vc (lv : list sdata) (rhob : t sdata) (rho : unifier_subst) (fact0 : list_forall sdata_inv lv) (fact1 : unifier_subst_ok rhob rho) : match lv with | [] => unifier_subst_ok rhob rho ∧ precede rhob rhob | cons (Assign _) q => list_forall sdata_inv q ∧ unifier_subst_ok rhob rho | cons (PConflict t1 t2) q => (sdata_inv (PConflict t1 t2) = true ∧ unifier_subst_ok rhob rho) ∧ (∀(rhob1 : t sdata), inv rhob1 = inv rhob -> (unifier_subst_ok rhob1 rho ∧ precede rhob rhob1 -> (list_forall sdata_inv q ∧ unifier_subst_ok rhob1 rho) ∧ (∀(rhob2 : t sdata), inv rhob2 = inv rhob1 -> (unifier_subst_ok rhob2 rho ∧ precede rhob1 rhob2 -> unifier_subst_ok rhob2 rho ∧ precede rhob rhob2) ∧ (correct rhob2 ∧ precede rhob1 rhob2 -> correct rhob2 ∧ precede rhob rhob2))) ∧ (precede rhob rhob1 ∧ correct rhob1 -> correct rhob1 ∧ precede rhob rhob1)) end.
Admitted.

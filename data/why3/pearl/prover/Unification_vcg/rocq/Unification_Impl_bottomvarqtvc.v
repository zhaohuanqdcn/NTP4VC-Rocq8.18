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
Theorem bottomvar'vc (rhob : t sdata) (rho : unifier_subst) (x : Z) (fact0 : unifier_subst_ok rhob rho) (fact1 : unassigned (current_timestamp rhob) x) : let tm : fo_term Z Z := Var_fo_term x in tm = subst_fo_term tm subst_id_symbol (unifier_base_model rho) ∧ tm = subst_fo_term tm subst_id_symbol (unifier rho).
Proof.
Admitted.

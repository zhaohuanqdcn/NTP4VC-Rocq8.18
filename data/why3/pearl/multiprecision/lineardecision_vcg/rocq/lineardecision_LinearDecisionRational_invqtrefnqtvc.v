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
Require Import multiprecision.lineardecision.RationalCoeffs.
Open Scope Z_scope.
Axiom sub_def : forall  (a1 : R) (a2 : R), Rminus a1 a2 = Rplus a1 (Ropp a2).
Axiom vars : Type.
Axiom vars_inhabited : Inhabited vars.
Global Existing Instance vars_inhabited.
Axiom vars_countable : Countable vars.
Global Existing Instance vars_countable.
Axiom zero_def : forall  (y : Z -> R), rinterp (0%Z, 1%Z) y = 0%R.
Axiom one_def : forall  (y : Z -> R), rinterp (1%Z, 1%Z) y = 1%R.
Theorem inv'refn'vc (a : Z) (a1 : Z) : let a2 : Z * Z := (a, a1) in ¬ req a2 (0%Z, 1%Z) -> ¬ req a2 (0%Z, 1%Z) ∧ (∀(result : Z) (result1 : Z), let result2 : Z * Z := (result, result1) in ¬ req result2 (0%Z, 1%Z) ∧ (∀(y : Z -> R), Rmult (rinterp result2 y) (rinterp a2 y) = 1%R) -> ¬ req result2 (0%Z, 1%Z)).
Admitted.

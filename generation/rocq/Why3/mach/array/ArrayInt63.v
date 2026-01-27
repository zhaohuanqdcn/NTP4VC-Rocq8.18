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
Open Scope Z_scope.
Axiom array63 : Type.
Axiom array63_inhabited : Inhabited array63.
Global Existing Instance array63_inhabited.
Axiom array63_countable : Countable array63.
Global Existing Instance array63_countable.
Axiom elts : array63 -> list Z.
Axiom size : array63 -> Z.
Axiom array63'invariant : forall  (self : array63), 0%Z ≤ size self ∧ size self = Z.of_nat (length (elts self)) ∧ Z.of_nat (length (elts self)) ≤ bv_signed int'63_max ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length (elts self)) -> int'63_in_bounds (nth (Z.to_nat i) (elts self) inhabitant)).

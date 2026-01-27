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
Require Import Why3.map.MapEq.
Require Import Why3.map.MapExchange.
Require Import Why3.map.MapPermut.
Open Scope Z_scope.
Axiom elt : Type.
Axiom elt_inhabited : Inhabited elt.
Global Existing Instance elt_inhabited.
Axiom elt_countable : Countable elt.
Global Existing Instance elt_countable.
Axiom le : elt -> elt -> Prop.
Axiom Refl : forall  (x : elt), le x x.
Axiom Trans : forall  (x : elt) (y : elt) (z : elt) (fact0 : le x y) (fact1 : le y z), le x z.
Axiom Total : forall  (x : elt) (y : elt), le x y ∨ le y x.
Definition sorted_sub (a : list elt) (l : Z) (u : Z) := ∀(i1 : Z) (i2 : Z), l ≤ i1 ∧ i1 < i2 ∧ i2 < u -> le (nth (Z.to_nat i1) a inhabitant) (nth (Z.to_nat i2) a inhabitant).
Definition sorted (a : list elt) := ∀(i1 : Z) (i2 : Z), 0%Z ≤ i1 ∧ i1 < i2 ∧ i2 < Z.of_nat (length a) -> le (nth (Z.to_nat i1) a inhabitant) (nth (Z.to_nat i2) a inhabitant).
Theorem natural_mergesort2'vc (tmp : list elt) (a : list elt) (fact0 : length tmp = length a) (fact1 : ∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length tmp) -> nth (Z.to_nat i) tmp inhabitant = nth (Z.to_nat i) a inhabitant) : let o1 : Z := Z.of_nat (length a) in ((0%Z ≤ 0%Z ∧ 0%Z ≤ Z.of_nat (length a) ∧ length a = length tmp) ∧ 0%Z ≤ o1) ∧ (∀(a1 : list elt), length a1 = length a -> (∀(x : Z), (x = Z.of_nat (length a1) ∨ 0%Z + o1 < x ∧ x < Z.of_nat (length a1)) ∧ sorted_sub a1 0%Z x ∧ permut_sub' a a1 0%nat (length a1) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < 0%Z -> nth (Z.to_nat j) a1 inhabitant = nth (Z.to_nat j) a inhabitant) -> sorted a1 ∧ a ≡ₚ a1)).
Admitted.

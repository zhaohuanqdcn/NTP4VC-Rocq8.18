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
Theorem find_run'vc (lo : Z) (a : list elt) (fact0 : 0%Z ≤ lo) (fact1 : lo < Z.of_nat (length a)) : let o1 : Z := lo + 1%Z in ((lo < o1 ∧ o1 ≤ Z.of_nat (length a)) ∧ sorted_sub a lo o1) ∧ (∀(i : Z), (lo < i ∧ i ≤ Z.of_nat (length a)) ∧ sorted_sub a lo i -> (let o2 : Z := Z.of_nat (length a) in (i < o2 -> (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ (let o3 : Z := i - 1%Z in 0%Z ≤ o3 ∧ o3 < Z.of_nat (length a))) ∧ (∀(o3 : bool), (if decide (i < o2) then o3 = (if decide (le (nth (Z.to_nat (i - 1%Z)) a inhabitant) (nth (Z.to_nat i) a inhabitant)) then true else false) else o3 = false) -> (if decide (o3 = true) then (0%Z ≤ Z.of_nat (length a) - i ∧ Z.of_nat (length a) - (i + 1%Z) < Z.of_nat (length a) - i) ∧ (lo < i + 1%Z ∧ i + 1%Z ≤ Z.of_nat (length a)) ∧ sorted_sub a lo (i + 1%Z) else (lo < i ∧ i ≤ Z.of_nat (length a)) ∧ sorted_sub a lo i ∧ (i < Z.of_nat (length a) -> ¬ le (nth (Z.to_nat (i - 1%Z)) a inhabitant) (nth (Z.to_nat i) a inhabitant)))))).
Admitted.

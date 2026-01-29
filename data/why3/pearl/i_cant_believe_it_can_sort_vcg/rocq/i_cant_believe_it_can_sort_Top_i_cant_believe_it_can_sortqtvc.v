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
Definition max_array (a : list elt) (lo : Z) (hi : Z) (i : Z) := ∀(j : Z), lo ≤ j ∧ j < hi -> le (nth (Z.to_nat j) a inhabitant) (nth (Z.to_nat i) a inhabitant).
Theorem i_cant_believe_it_can_sort'vc (a : list elt) : let n : Z := Z.of_nat (length a) in let o1 : Z := n - 1%Z in (0%Z ≤ o1 + 1%Z -> (a ≡ₚ a ∧ sorted_sub a 0%Z (0%Z - 1%Z)) ∧ (∀(a1 : list elt), length a1 = length a -> (∀(i : Z), (0%Z ≤ i ∧ i ≤ o1) ∧ a ≡ₚ a1 ∧ sorted_sub a1 0%Z (i - 1%Z) ∧ (i = 0%Z ∨ max_array a1 0%Z n (i - 1%Z)) -> (let o2 : Z := n - 1%Z in (0%Z ≤ o2 + 1%Z -> (a ≡ₚ a1 ∧ max_array a1 0%Z 0%Z i ∧ (i = 0%Z ∨ (if decide (0%Z < i) then max_array a1 0%Z n (i - 1%Z) else max_array a1 0%Z n i)) ∧ (if decide (0%Z < i) then sorted_sub a1 0%Z (i - 1%Z) else sorted_sub a1 0%Z i)) ∧ (∀(a2 : list elt), length a2 = length a1 -> (∀(j : Z), (0%Z ≤ j ∧ j ≤ o2) ∧ a ≡ₚ a2 ∧ max_array a2 0%Z j i ∧ (i = 0%Z ∨ (if decide (j < i) then max_array a2 0%Z n (i - 1%Z) else max_array a2 0%Z n i)) ∧ (if decide (j < i) then sorted_sub a2 0%Z (i - 1%Z) else sorted_sub a2 0%Z i) -> (0%Z ≤ j ∧ j < Z.of_nat (length a2)) ∧ (let o3 : elt := nth (Z.to_nat j) a2 inhabitant in (0%Z ≤ i ∧ i < Z.of_nat (length a2)) ∧ (let o4 : elt := nth (Z.to_nat i) a2 inhabitant in if decide (le o4 o3 ∧ ¬ o4 = o3) then ((0%Z ≤ i ∧ i < Z.of_nat (length a2)) ∧ 0%Z ≤ j ∧ j < Z.of_nat (length a2)) ∧ (∀(a3 : list elt), length a3 = length a2 -> array_exchange a2 a3 i j -> a ≡ₚ a3 ∧ max_array a3 0%Z (j + 1%Z) i ∧ (i = 0%Z ∨ (if decide (j + 1%Z < i) then max_array a3 0%Z n (i - 1%Z) else max_array a3 0%Z n i)) ∧ (if decide (j + 1%Z < i) then sorted_sub a3 0%Z (i - 1%Z) else sorted_sub a3 0%Z i)) else a ≡ₚ a2 ∧ max_array a2 0%Z (j + 1%Z) i ∧ (i = 0%Z ∨ (if decide (j + 1%Z < i) then max_array a2 0%Z n (i - 1%Z) else max_array a2 0%Z n i)) ∧ (if decide (j + 1%Z < i) then sorted_sub a2 0%Z (i - 1%Z) else sorted_sub a2 0%Z i)))) ∧ (a ≡ₚ a2 ∧ max_array a2 0%Z (o2 + 1%Z) i ∧ (i = 0%Z ∨ (if decide (o2 + 1%Z < i) then max_array a2 0%Z n (i - 1%Z) else max_array a2 0%Z n i)) ∧ (if decide (o2 + 1%Z < i) then sorted_sub a2 0%Z (i - 1%Z) else sorted_sub a2 0%Z i) -> a ≡ₚ a2 ∧ sorted_sub a2 0%Z (i + 1%Z - 1%Z) ∧ (i + 1%Z = 0%Z ∨ max_array a2 0%Z n (i + 1%Z - 1%Z))))) ∧ (o2 + 1%Z < 0%Z -> a ≡ₚ a1 ∧ sorted_sub a1 0%Z (i + 1%Z - 1%Z) ∧ (i + 1%Z = 0%Z ∨ max_array a1 0%Z n (i + 1%Z - 1%Z))))) ∧ (a ≡ₚ a1 ∧ sorted_sub a1 0%Z (o1 + 1%Z - 1%Z) ∧ (o1 + 1%Z = 0%Z ∨ max_array a1 0%Z n (o1 + 1%Z - 1%Z)) -> a ≡ₚ a1 ∧ sorted a1))) ∧ (o1 + 1%Z < 0%Z -> a ≡ₚ a ∧ sorted a).
Proof.
Admitted.

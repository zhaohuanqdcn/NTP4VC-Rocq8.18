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
Require Import Why3.map.MapEq.
Require Import Why3.map.MapExchange.
Require Import Why3.map.MapPermut.
Require Import Why3.array.IntArraySorted.
Open Scope Z_scope.
Theorem bubble_sort'vc (a : list Z) : let n : Z := Z.of_nat (length a) in (n ≤ n ∧ a ≡ₚ a ∧ (∀(i1 : Z) (i2 : Z), 0%Z ≤ i1 ∧ i1 < n ∧ n ≤ i2 ∧ i2 < n -> nth (Z.to_nat i1) a inhabitant ≤ nth (Z.to_nat i2) a inhabitant) ∧ sorted_sub1 a n n) ∧ (∀(bound : Z) (a1 : list Z), length a1 = length a -> bound ≤ n ∧ a ≡ₚ a1 ∧ (∀(i1 : Z) (i2 : Z), 0%Z ≤ i1 ∧ i1 < bound ∧ bound ≤ i2 ∧ i2 < n -> nth (Z.to_nat i1) a1 inhabitant ≤ nth (Z.to_nat i2) a1 inhabitant) ∧ sorted_sub1 a1 bound n -> (if decide (2%Z ≤ bound) then let o1 : Z := bound - 2%Z in (0%Z ≤ o1 + 1%Z -> (0%Z ≤ 0%Z ∧ a ≡ₚ a1 ∧ (∀(i1 : Z) (i2 : Z), 0%Z ≤ i1 ∧ i1 < bound ∧ bound ≤ i2 ∧ i2 < n -> nth (Z.to_nat i1) a1 inhabitant ≤ nth (Z.to_nat i2) a1 inhabitant) ∧ (∀(i : Z), 0%Z ≤ i ∧ i ≤ 0%Z -> nth (Z.to_nat i) a1 inhabitant ≤ nth 0%nat a1 inhabitant) ∧ sorted_sub1 a1 0%Z (0%Z + 1%Z) ∧ sorted_sub1 a1 bound n) ∧ (∀(t : Z) (a2 : list Z), length a2 = length a1 -> (∀(j : Z), (0%Z ≤ j ∧ j ≤ o1) ∧ (0%Z ≤ t ∧ t ≤ j) ∧ a ≡ₚ a2 ∧ (∀(i1 : Z) (i2 : Z), 0%Z ≤ i1 ∧ i1 < bound ∧ bound ≤ i2 ∧ i2 < n -> nth (Z.to_nat i1) a2 inhabitant ≤ nth (Z.to_nat i2) a2 inhabitant) ∧ (∀(i : Z), 0%Z ≤ i ∧ i ≤ t -> nth (Z.to_nat i) a2 inhabitant ≤ nth (Z.to_nat t) a2 inhabitant) ∧ sorted_sub1 a2 t (j + 1%Z) ∧ sorted_sub1 a2 bound n -> (let o2 : Z := j + 1%Z in (0%Z ≤ o2 ∧ o2 < Z.of_nat (length a2)) ∧ (0%Z ≤ j ∧ j < Z.of_nat (length a2)) ∧ (if decide (nth (Z.to_nat o2) a2 inhabitant < nth (Z.to_nat j) a2 inhabitant) then let o3 : Z := j + 1%Z in ((0%Z ≤ j ∧ j < Z.of_nat (length a2)) ∧ 0%Z ≤ o3 ∧ o3 < Z.of_nat (length a2)) ∧ (∀(a3 : list Z), length a3 = length a2 -> array_exchange a2 a3 j o3 -> (0%Z ≤ j + 1%Z ∧ j + 1%Z ≤ j + 1%Z) ∧ a ≡ₚ a3 ∧ (∀(i1 : Z) (i2 : Z), 0%Z ≤ i1 ∧ i1 < bound ∧ bound ≤ i2 ∧ i2 < n -> nth (Z.to_nat i1) a3 inhabitant ≤ nth (Z.to_nat i2) a3 inhabitant) ∧ (∀(i : Z), 0%Z ≤ i ∧ i ≤ j + 1%Z -> nth (Z.to_nat i) a3 inhabitant ≤ nth (Z.to_nat (j + 1%Z)) a3 inhabitant) ∧ sorted_sub1 a3 (j + 1%Z) (j + 1%Z + 1%Z) ∧ sorted_sub1 a3 bound n) else (0%Z ≤ t ∧ t ≤ j + 1%Z) ∧ a ≡ₚ a2 ∧ (∀(i1 : Z) (i2 : Z), 0%Z ≤ i1 ∧ i1 < bound ∧ bound ≤ i2 ∧ i2 < n -> nth (Z.to_nat i1) a2 inhabitant ≤ nth (Z.to_nat i2) a2 inhabitant) ∧ (∀(i : Z), 0%Z ≤ i ∧ i ≤ t -> nth (Z.to_nat i) a2 inhabitant ≤ nth (Z.to_nat t) a2 inhabitant) ∧ sorted_sub1 a2 t (j + 1%Z + 1%Z) ∧ sorted_sub1 a2 bound n))) ∧ ((0%Z ≤ t ∧ t ≤ o1 + 1%Z) ∧ a ≡ₚ a2 ∧ (∀(i1 : Z) (i2 : Z), 0%Z ≤ i1 ∧ i1 < bound ∧ bound ≤ i2 ∧ i2 < n -> nth (Z.to_nat i1) a2 inhabitant ≤ nth (Z.to_nat i2) a2 inhabitant) ∧ (∀(i : Z), 0%Z ≤ i ∧ i ≤ t -> nth (Z.to_nat i) a2 inhabitant ≤ nth (Z.to_nat t) a2 inhabitant) ∧ sorted_sub1 a2 t (o1 + 1%Z + 1%Z) ∧ sorted_sub1 a2 bound n -> (0%Z ≤ bound ∧ t < bound) ∧ t ≤ n ∧ a ≡ₚ a2 ∧ (∀(i1 : Z) (i2 : Z), 0%Z ≤ i1 ∧ i1 < t ∧ t ≤ i2 ∧ i2 < n -> nth (Z.to_nat i1) a2 inhabitant ≤ nth (Z.to_nat i2) a2 inhabitant) ∧ sorted_sub1 a2 t n))) ∧ (o1 + 1%Z < 0%Z -> (0%Z ≤ bound ∧ 0%Z < bound) ∧ 0%Z ≤ n ∧ a ≡ₚ a1 ∧ (∀(i1 : Z) (i2 : Z), 0%Z ≤ i1 ∧ i1 < 0%Z ∧ 0%Z ≤ i2 ∧ i2 < n -> nth (Z.to_nat i1) a1 inhabitant ≤ nth (Z.to_nat i2) a1 inhabitant) ∧ sorted_sub1 a1 0%Z n) else a ≡ₚ a1 ∧ sorted a1)).
Proof.
Admitted.

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
Require Import Why3.int.NumOf.
Require Import Why3.int.Sum.
Require Import Why3.map.MapEq.
Require Import Why3.map.MapExchange.
Require Import Why3.map.MapPermut.
Require Import Why3.array.IntArraySorted.
Require Import Why3.array.Inversions.
Open Scope Z_scope.
Theorem gnome_sort'vc (a : list Z) : 0%Z ≤ 0%Z ∧ 0%Z ≤ Z.of_nat (length a) ∧ sorted_sub1 a 0%Z 0%Z ∧ a ≡ₚ a ∧ (∀(pos : Z) (a1 : list Z), length a1 = length a -> (0%Z ≤ pos ∧ pos ≤ Z.of_nat (length a1)) ∧ sorted_sub1 a1 0%Z pos ∧ a ≡ₚ a1 -> (if decide (pos < Z.of_nat (length a1)) then (¬ pos = 0%Z -> (let o1 : Z := pos - 1%Z in (0%Z ≤ o1 ∧ o1 < Z.of_nat (length a1)) ∧ 0%Z ≤ pos ∧ pos < Z.of_nat (length a1))) ∧ (∀(o1 : bool), (if decide (pos = 0%Z) then o1 = true else o1 = (if decide (nth (Z.to_nat (pos - 1%Z)) a1 inhabitant ≤ nth (Z.to_nat pos) a1 inhabitant) then true else false)) -> (if decide (o1 = true) then (0%Z ≤ inversions a1 ∧ inversions a1 < inversions a1 ∨ 0%Z ≤ Z.of_nat (length a1) - pos ∧ Z.of_nat (length a1) - (pos + 1%Z) < Z.of_nat (length a1) - pos) ∧ (0%Z ≤ pos + 1%Z ∧ pos + 1%Z ≤ Z.of_nat (length a1)) ∧ sorted_sub1 a1 0%Z (pos + 1%Z) ∧ a ≡ₚ a1 else let o2 : Z := pos - 1%Z in ((0%Z ≤ pos ∧ pos < Z.of_nat (length a1)) ∧ 0%Z ≤ o2 ∧ o2 < Z.of_nat (length a1)) ∧ (∀(a2 : list Z), length a2 = length a1 -> array_exchange a1 a2 pos o2 -> (0%Z ≤ inversions a1 ∧ inversions a2 < inversions a1 ∨ inversions a1 = inversions a2 ∧ 0%Z ≤ Z.of_nat (length a1) - pos ∧ Z.of_nat (length a2) - (pos - 1%Z) < Z.of_nat (length a1) - pos) ∧ (0%Z ≤ pos - 1%Z ∧ pos - 1%Z ≤ Z.of_nat (length a2)) ∧ sorted_sub1 a2 0%Z (pos - 1%Z) ∧ a ≡ₚ a2))) else sorted a1 ∧ a ≡ₚ a1)).
Admitted.

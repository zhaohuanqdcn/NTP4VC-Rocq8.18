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
Require Import Why3.map.MapEq.
Open Scope Z_scope.
Theorem to_list_from'vc (i : Z) (a : list Z) (fact0 : 0%Z ≤ i) (fact1 : i ≤ Z.of_nat (length a)) : let o1 : Z := Z.of_nat (length a) in (¬ i = o1 -> (let o2 : Z := i + 1%Z in ((0%Z ≤ Z.of_nat (length a) - i ∧ Z.of_nat (length a) - o2 < Z.of_nat (length a) - i) ∧ 0%Z ≤ o2 ∧ o2 ≤ Z.of_nat (length a)) ∧ (∀(o3 : list Z), Z.of_nat (length o3) = Z.of_nat (length a) - o2 ∧ (∀(k : Z), 0%Z ≤ k ∧ k < Z.of_nat (length a) - o2 -> nth_error_i o3 k = Some (nth (Z.to_nat (k + o2)) a inhabitant)) -> 0%Z ≤ i ∧ i < Z.of_nat (length a)))) ∧ (∀(result : list Z), (if decide (i = o1) then result = ([] : list Z) else let o2 : Z := i + 1%Z in ∃(o3 : list Z), (Z.of_nat (length o3) = Z.of_nat (length a) - o2 ∧ (∀(k : Z), 0%Z ≤ k ∧ k < Z.of_nat (length a) - o2 -> nth_error_i o3 k = Some (nth (Z.to_nat (k + o2)) a inhabitant))) ∧ result = cons (nth (Z.to_nat i) a inhabitant) o3) -> Z.of_nat (length result) = Z.of_nat (length a) - i ∧ (∀(k : Z), 0%Z ≤ k ∧ k < Z.of_nat (length a) - i -> nth_error_i result k = Some (nth (Z.to_nat (k + i)) a inhabitant))).
Admitted.

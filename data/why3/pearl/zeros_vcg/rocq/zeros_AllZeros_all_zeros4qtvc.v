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
Open Scope Z_scope.
Definition all_zeros (a : list Z) (hi : Z) := ∀(i : Z), 0%Z ≤ i ∧ i < hi -> nth (Z.to_nat i) a inhabitant = 0%Z.
Theorem all_zeros4'vc (a : list Z) : (∀(i : Z), (0%Z ≤ i ∧ i ≤ Z.of_nat (length a)) ∧ all_zeros a i -> (let o1 : Z := Z.of_nat (length a) in (¬ i = o1 -> (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ (nth (Z.to_nat i) a inhabitant = 0%Z -> (let o2 : Z := i + 1%Z in (0%Z ≤ Z.of_nat (length a) - i ∧ Z.of_nat (length a) - o2 < Z.of_nat (length a) - i) ∧ (0%Z ≤ o2 ∧ o2 ≤ Z.of_nat (length a)) ∧ all_zeros a o2))) ∧ (∀(result : bool), (if decide (i = o1) then result = true else if decide (nth (Z.to_nat i) a inhabitant = 0%Z) then result = (if decide (all_zeros a (Z.of_nat (length a))) then true else false) else result = false) -> (result = true) = all_zeros a (Z.of_nat (length a))))) ∧ 0%Z ≤ 0%Z ∧ 0%Z ≤ Z.of_nat (length a) ∧ all_zeros a 0%Z.
Proof.
Admitted.

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
Require Import Why3.why3.WellFounded.WellFounded.
Open Scope Z_scope.
Theorem add'vc (a : list (bv 32%N)) (b : list (bv 32%N)) (fact0 : length a = length b) (fact1 : ∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length a) -> bv_ult (nth (Z.to_nat i) a inhabitant) (2147483648%bv : bv 32%N)) (fact2 : ∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length b) -> bv_ult (nth (Z.to_nat i) b inhabitant) (2147483648%bv : bv 32%N)) : let o1 : Z := Z.of_nat (length a) in 0%Z ≤ o1 ∧ (∀(sum : list (bv 32%N)), (∀(i : Z), 0%Z ≤ i ∧ i < o1 -> nth (Z.to_nat i) sum inhabitant = (0%bv : bv 32%N)) ∧ Z.of_nat (length sum) = o1 -> (let o2 : Z := Z.of_nat (length a) - 1%Z in (0%Z ≤ o2 + 1%Z -> ((∀(j : Z), 0%Z ≤ j ∧ j < 0%Z -> nth (Z.to_nat j) sum inhabitant = bv_add (nth (Z.to_nat j) a inhabitant) (nth (Z.to_nat j) b inhabitant)) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < 0%Z -> bv_unsigned (nth (Z.to_nat j) sum inhabitant) = bv_unsigned (nth (Z.to_nat j) a inhabitant) + bv_unsigned (nth (Z.to_nat j) b inhabitant))) ∧ (∀(sum1 : list (bv 32%N)), length sum1 = length sum -> (∀(i : Z), (0%Z ≤ i ∧ i ≤ o2) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < i -> nth (Z.to_nat j) sum1 inhabitant = bv_add (nth (Z.to_nat j) a inhabitant) (nth (Z.to_nat j) b inhabitant)) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < i -> bv_unsigned (nth (Z.to_nat j) sum1 inhabitant) = bv_unsigned (nth (Z.to_nat j) a inhabitant) + bv_unsigned (nth (Z.to_nat j) b inhabitant)) -> (0%Z ≤ i ∧ i < Z.of_nat (length b)) ∧ (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ (let o3 : bv 32%N := bv_add (nth (Z.to_nat i) a inhabitant) (nth (Z.to_nat i) b inhabitant) in (0%Z ≤ i ∧ i < Z.of_nat (length sum1)) ∧ (length (set_list sum1 (Z.to_nat i) o3) = length sum1 -> nth_i (set_list sum1 (Z.to_nat i) o3) = fun_updt (nth_i sum1) i o3 -> (∀(j : Z), 0%Z ≤ j ∧ j < i + 1%Z -> nth (Z.to_nat j) (set_list sum1 (Z.to_nat i) o3) inhabitant = bv_add (nth (Z.to_nat j) a inhabitant) (nth (Z.to_nat j) b inhabitant)) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < i + 1%Z -> bv_unsigned (nth (Z.to_nat j) (set_list sum1 (Z.to_nat i) o3) inhabitant) = bv_unsigned (nth (Z.to_nat j) a inhabitant) + bv_unsigned (nth (Z.to_nat j) b inhabitant))))) ∧ ((∀(j : Z), 0%Z ≤ j ∧ j < o2 + 1%Z -> nth (Z.to_nat j) sum1 inhabitant = bv_add (nth (Z.to_nat j) a inhabitant) (nth (Z.to_nat j) b inhabitant)) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < o2 + 1%Z -> bv_unsigned (nth (Z.to_nat j) sum1 inhabitant) = bv_unsigned (nth (Z.to_nat j) a inhabitant) + bv_unsigned (nth (Z.to_nat j) b inhabitant)) -> (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length sum1) -> bv_unsigned (nth (Z.to_nat i) sum1 inhabitant) = bv_unsigned (nth (Z.to_nat i) a inhabitant) + bv_unsigned (nth (Z.to_nat i) b inhabitant))))) ∧ (o2 + 1%Z < 0%Z -> (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length sum) -> bv_unsigned (nth (Z.to_nat i) sum inhabitant) = bv_unsigned (nth (Z.to_nat i) a inhabitant) + bv_unsigned (nth (Z.to_nat i) b inhabitant))))).
Proof.
Admitted.

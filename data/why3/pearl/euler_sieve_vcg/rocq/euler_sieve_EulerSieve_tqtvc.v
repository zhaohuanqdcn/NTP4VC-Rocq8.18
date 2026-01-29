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
Require Import euler_sieve_vcg.euler_sieve.ArithmeticResults.
Require Import euler_sieve_vcg.euler_sieve.DivisibilityResults.
Require Import euler_sieve_vcg.euler_sieve.EulerSieveSpec.
Open Scope Z_scope.
Axiom o1 : Z -> bool.
Axiom o2 : Z -> Z.
Axiom o'def : forall  (i : Z), (o1 i = true) = (i < 2%Z).
Axiom o'def1 : forall  (i : Z), o2 i = i + 1%Z.
Theorem t'vc : let o3 : Z -> bool := o1 in 0%Z ≤ 4%Z ∧ (let o4 : list bool := create_list 4%nat (o3 ∘ Z.of_nat) in Z.of_nat (length o4) = 4%Z ∧ (∀(i : Z), 0%Z ≤ i ∧ i < 4%Z -> nth (Z.to_nat i) o4 inhabitant = o3 i) -> (let o5 : Z -> Z := o2 in 0%Z ≤ 4%Z ∧ (let o6 : list Z := create_list 4%nat (o5 ∘ Z.of_nat) in Z.of_nat (length o6) = 4%Z ∧ (∀(i : Z), 0%Z ≤ i ∧ i < 4%Z -> nth (Z.to_nat i) o6 inhabitant = o5 i) -> (3%Z < bv_signed int'63_max ∧ 3%Z ≤ 3%Z) ∧ (3%Z < bv_signed int'63_max ∧ 3%Z ≤ 3%Z -> (length o6 = length o4 ∧ Z.of_nat (length o4) = 3%Z + 1%Z) ∧ (length o6 = length o4 ∧ Z.of_nat (length o4) = 3%Z + 1%Z -> inv_nexts o6 (Z.of_nat (length o6)) ∧ (inv_nexts o6 (Z.of_nat (length o6)) -> all_eliminated_marked o4 o6 ∧ (all_eliminated_marked o4 o6 -> (∀(i : Z), 3%Z ≤ i ∧ i ≤ 3%Z -> ZEuclid.modulo i 2%Z = 0%Z -> nth (Z.to_nat i) o4 inhabitant = true) ∧ ((∀(i : Z), 3%Z ≤ i ∧ i ≤ 3%Z -> ZEuclid.modulo i 2%Z = 0%Z -> nth (Z.to_nat i) o4 inhabitant = true) -> (∀(i : Z), 3%Z ≤ i ∧ i < 3%Z - 1%Z -> ZEuclid.modulo i 2%Z = 1%Z -> ZEuclid.modulo (nth (Z.to_nat i) o6 inhabitant) 2%Z = 1%Z ∨ nth (Z.to_nat i) o6 inhabitant = 3%Z + 1%Z) ∧ ((∀(i : Z), 3%Z ≤ i ∧ i < 3%Z - 1%Z -> ZEuclid.modulo i 2%Z = 1%Z -> ZEuclid.modulo (nth (Z.to_nat i) o6 inhabitant) 2%Z = 1%Z ∨ nth (Z.to_nat i) o6 inhabitant = 3%Z + 1%Z) -> nth 3%nat o6 inhabitant = 3%Z + 1%Z ∧ (ZEuclid.modulo (3%Z - 1%Z) 2%Z = 0%Z -> nth (Z.to_nat (3%Z - 1%Z)) o6 inhabitant = 3%Z) ∧ (ZEuclid.modulo (3%Z - 1%Z) 2%Z = 1%Z -> nth (Z.to_nat (3%Z - 1%Z)) o6 inhabitant = 3%Z + 1%Z)))))))))).
Proof.
Admitted.

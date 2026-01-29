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
Require Import Why3.mach.array.ArrayInt63.
Open Scope Z_scope.
Axiom o1 : Z -> bool.
Axiom o2 : Z -> Z.
Axiom o'def : forall  (i : Z), (o1 i = true) = (i < 2%Z).
Axiom o'def1 : forall  (i : Z), o2 i = i + 1%Z.
Theorem t'vc : 0%Z ≤ 2%Z ∧ (∀(o3 : ArrayInt63.array63), (∀(i : Z), 0%Z ≤ i ∧ i < 2%Z -> nth (Z.to_nat i) (elts o3) inhabitant = bv_signed ((-2)%bv : bv 63%N)) ∧ Z.of_nat (length (elts o3)) = 2%Z -> (0%Z ≤ 1%Z ∧ 1%Z < Z.of_nat (length (elts o3))) ∧ (∀(o4 : ArrayInt63.array63), length (elts o4) = length (elts o3) ∧ elts o4 = set_list (elts o3) 1%nat (bv_signed (4%bv : bv 63%N)) -> (let o5 : Z -> bool := o1 in 0%Z ≤ 4%Z ∧ (let o6 : list bool := create_list 4%nat (o5 ∘ Z.of_nat) in Z.of_nat (length o6) = 4%Z ∧ (∀(i : Z), 0%Z ≤ i ∧ i < 4%Z -> nth (Z.to_nat i) o6 inhabitant = o5 i) -> (let o7 : Z -> Z := o2 in 0%Z ≤ 4%Z ∧ (let o8 : list Z := create_list 4%nat (o7 ∘ Z.of_nat) in Z.of_nat (length o8) = 4%Z ∧ (∀(i : Z), 0%Z ≤ i ∧ i < 4%Z -> nth (Z.to_nat i) o8 inhabitant = o7 i) -> (3%Z < bv_signed int'63_max ∧ 3%Z ≤ 3%Z) ∧ (3%Z < bv_signed int'63_max ∧ 3%Z ≤ 3%Z -> (length o8 = length o6 ∧ Z.of_nat (length o6) = 3%Z + 1%Z) ∧ (length o8 = length o6 ∧ Z.of_nat (length o6) = 3%Z + 1%Z -> ZEuclid.div (3%Z - 1%Z) 2%Z = 1%Z ∧ (ZEuclid.div (3%Z - 1%Z) 2%Z = 1%Z -> Z.of_nat (length (elts o4)) = 1%Z + 1%Z ∧ (Z.of_nat (length (elts o4)) = 1%Z + 1%Z -> inv_nexts o8 (Z.of_nat (length o8)) ∧ (inv_nexts o8 (Z.of_nat (length o8)) -> all_eliminated_marked o6 o8 ∧ (all_eliminated_marked o6 o8 -> (∀(i : Z), 3%Z ≤ i ∧ i ≤ 3%Z -> ZEuclid.modulo i 2%Z = 0%Z -> nth (Z.to_nat i) o6 inhabitant = true) ∧ ((∀(i : Z), 3%Z ≤ i ∧ i ≤ 3%Z -> ZEuclid.modulo i 2%Z = 0%Z -> nth (Z.to_nat i) o6 inhabitant = true) -> (∀(i : Z), 3%Z ≤ i ∧ i < 3%Z - 1%Z -> ZEuclid.modulo i 2%Z = 1%Z -> ZEuclid.modulo (nth (Z.to_nat i) o8 inhabitant) 2%Z = 1%Z ∨ nth (Z.to_nat i) o8 inhabitant = 3%Z + 1%Z) ∧ ((∀(i : Z), 3%Z ≤ i ∧ i < 3%Z - 1%Z -> ZEuclid.modulo i 2%Z = 1%Z -> ZEuclid.modulo (nth (Z.to_nat i) o8 inhabitant) 2%Z = 1%Z ∨ nth (Z.to_nat i) o8 inhabitant = 3%Z + 1%Z) -> (nth 3%nat o8 inhabitant = 3%Z + 1%Z ∧ (ZEuclid.modulo (3%Z - 1%Z) 2%Z = 0%Z -> nth (Z.to_nat (3%Z - 1%Z)) o8 inhabitant = 3%Z) ∧ (ZEuclid.modulo (3%Z - 1%Z) 2%Z = 1%Z -> nth (Z.to_nat (3%Z - 1%Z)) o8 inhabitant = 3%Z + 1%Z)) ∧ (nth 3%nat o8 inhabitant = 3%Z + 1%Z ∧ (ZEuclid.modulo (3%Z - 1%Z) 2%Z = 0%Z -> nth (Z.to_nat (3%Z - 1%Z)) o8 inhabitant = 3%Z) ∧ (ZEuclid.modulo (3%Z - 1%Z) 2%Z = 1%Z -> nth (Z.to_nat (3%Z - 1%Z)) o8 inhabitant = 3%Z + 1%Z) -> (∀(i : Z), 0%Z ≤ i ∧ i ≤ 1%Z -> - (3%Z + 1%Z) ≤ nth (Z.to_nat i) (elts o4) inhabitant ∧ nth (Z.to_nat i) (elts o4) inhabitant ≤ 3%Z + 1%Z) ∧ ((∀(i : Z), 0%Z ≤ i ∧ i ≤ 1%Z -> - (3%Z + 1%Z) ≤ nth (Z.to_nat i) (elts o4) inhabitant ∧ nth (Z.to_nat i) (elts o4) inhabitant ≤ 3%Z + 1%Z) -> (∀(i : Z), 0%Z ≤ i ∧ i ≤ 1%Z -> (nth (Z.to_nat (2%Z * i + 1%Z)) o6 inhabitant = true) = (nth (Z.to_nat i) (elts o4) inhabitant < 0%Z)) ∧ ((∀(i : Z), 0%Z ≤ i ∧ i ≤ 1%Z -> (nth (Z.to_nat (2%Z * i + 1%Z)) o6 inhabitant = true) = (nth (Z.to_nat i) (elts o4) inhabitant < 0%Z)) -> (∀(i : Z), 0%Z ≤ i ∧ i ≤ 1%Z -> ¬ nth (Z.to_nat (2%Z * i + 1%Z)) o6 inhabitant = true -> nth (Z.to_nat i) (elts o4) inhabitant = nth (Z.to_nat (2%Z * i + 1%Z)) o8 inhabitant) ∧ ((∀(i : Z), 0%Z ≤ i ∧ i ≤ 1%Z -> ¬ nth (Z.to_nat (2%Z * i + 1%Z)) o6 inhabitant = true -> nth (Z.to_nat i) (elts o4) inhabitant = nth (Z.to_nat (2%Z * i + 1%Z)) o8 inhabitant) -> (∀(i : Z), 0%Z ≤ i ∧ i ≤ 1%Z -> nth (Z.to_nat (2%Z * i + 1%Z)) o6 inhabitant = true -> nth (Z.to_nat i) (elts o4) inhabitant = - nth (Z.to_nat (2%Z * i + 1%Z)) o8 inhabitant) ∧ ((∀(i : Z), 0%Z ≤ i ∧ i ≤ 1%Z -> nth (Z.to_nat (2%Z * i + 1%Z)) o6 inhabitant = true -> nth (Z.to_nat i) (elts o4) inhabitant = - nth (Z.to_nat (2%Z * i + 1%Z)) o8 inhabitant) -> (∀(i : Z), 0%Z ≤ i ∧ i ≤ 1%Z -> (i < ZEuclid.div (Z.abs (nth (Z.to_nat i) (elts o4) inhabitant)) 2%Z ∧ ZEuclid.div (Z.abs (nth (Z.to_nat i) (elts o4) inhabitant)) 2%Z ≤ 1%Z + 1%Z) ∧ Z.abs (nth (Z.to_nat i) (elts o4) inhabitant) ≤ 3%Z + 1%Z) ∧ ((∀(i : Z), 0%Z ≤ i ∧ i ≤ 1%Z -> (i < ZEuclid.div (Z.abs (nth (Z.to_nat i) (elts o4) inhabitant)) 2%Z ∧ ZEuclid.div (Z.abs (nth (Z.to_nat i) (elts o4) inhabitant)) 2%Z ≤ 1%Z + 1%Z) ∧ Z.abs (nth (Z.to_nat i) (elts o4) inhabitant) ≤ 3%Z + 1%Z) -> (∀(i : Z) (j : Z), 0%Z ≤ i ∧ i ≤ 1%Z -> i < j ∧ j < ZEuclid.div (Z.abs (nth (Z.to_nat i) (elts o4) inhabitant)) 2%Z -> nth (Z.to_nat j) (elts o4) inhabitant < 0%Z))))))))))))))))))))).
Proof.
Admitted.

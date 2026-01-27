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
Require Import euler_sieve_vcg.euler_sieve.ArithmeticResults.
Require Import euler_sieve_vcg.euler_sieve.DivisibilityResults.
Require Import euler_sieve_vcg.euler_sieve.EulerSieveSpec.
Require Import Why3.mach.array.ArrayInt63.
Open Scope Z_scope.
Axiom t : Type.
Axiom t_inhabited : Inhabited t.
Global Existing Instance t_inhabited.
Axiom t_countable : Countable t.
Global Existing Instance t_countable.
Axiom nexts : t -> list Z.
Axiom marked : t -> list bool.
Axiom arr : t -> ArrayInt63.array63.
Axiom max : t -> bv 63%N.
Axiom max_arr : t -> bv 63%N.
Axiom t'invariant : forall  (self : t), bv_signed (max self) < bv_signed int'63_max ∧ 3%Z ≤ bv_signed (max self) ∧ length (nexts self) = length (marked self) ∧ Z.of_nat (length (marked self)) = bv_signed (max self) + 1%Z ∧ ZEuclid.div (bv_signed (max self) - 1%Z) 2%Z = bv_signed (max_arr self) ∧ Z.of_nat (length (elts (arr self))) = bv_signed (max_arr self) + 1%Z ∧ inv_nexts (nexts self) (Z.of_nat (length (nexts self))) ∧ all_eliminated_marked (marked self) (nexts self) ∧ (∀(i : Z), 3%Z ≤ i ∧ i ≤ bv_signed (max self) -> ZEuclid.modulo i 2%Z = 0%Z -> nth (Z.to_nat i) (marked self) inhabitant = true) ∧ (∀(i : Z), 3%Z ≤ i ∧ i < bv_signed (max self) - 1%Z -> ZEuclid.modulo i 2%Z = 1%Z -> ZEuclid.modulo (nth (Z.to_nat i) (nexts self) inhabitant) 2%Z = 1%Z ∨ nth (Z.to_nat i) (nexts self) inhabitant = bv_signed (max self) + 1%Z) ∧ nth (Z.to_nat (bv_signed (max self))) (nexts self) inhabitant = bv_signed (max self) + 1%Z ∧ (ZEuclid.modulo (bv_signed (max self) - 1%Z) 2%Z = 0%Z -> nth (Z.to_nat (bv_signed (max self) - 1%Z)) (nexts self) inhabitant = bv_signed (max self)) ∧ (ZEuclid.modulo (bv_signed (max self) - 1%Z) 2%Z = 1%Z -> nth (Z.to_nat (bv_signed (max self) - 1%Z)) (nexts self) inhabitant = bv_signed (max self) + 1%Z) ∧ (∀(i : Z), 0%Z ≤ i ∧ i ≤ bv_signed (max_arr self) -> - (bv_signed (max self) + 1%Z) ≤ nth (Z.to_nat i) (elts (arr self)) inhabitant ∧ nth (Z.to_nat i) (elts (arr self)) inhabitant ≤ bv_signed (max self) + 1%Z) ∧ (∀(i : Z), 0%Z ≤ i ∧ i ≤ bv_signed (max_arr self) -> (nth (Z.to_nat (2%Z * i + 1%Z)) (marked self) inhabitant = true) = (nth (Z.to_nat i) (elts (arr self)) inhabitant < 0%Z)) ∧ (∀(i : Z), 0%Z ≤ i ∧ i ≤ bv_signed (max_arr self) -> ¬ nth (Z.to_nat (2%Z * i + 1%Z)) (marked self) inhabitant = true -> nth (Z.to_nat i) (elts (arr self)) inhabitant = nth (Z.to_nat (2%Z * i + 1%Z)) (nexts self) inhabitant) ∧ (∀(i : Z), 0%Z ≤ i ∧ i ≤ bv_signed (max_arr self) -> nth (Z.to_nat (2%Z * i + 1%Z)) (marked self) inhabitant = true -> nth (Z.to_nat i) (elts (arr self)) inhabitant = - nth (Z.to_nat (2%Z * i + 1%Z)) (nexts self) inhabitant) ∧ (∀(i : Z), 0%Z ≤ i ∧ i ≤ bv_signed (max_arr self) -> (i < ZEuclid.div (Z.abs (nth (Z.to_nat i) (elts (arr self)) inhabitant)) 2%Z ∧ ZEuclid.div (Z.abs (nth (Z.to_nat i) (elts (arr self)) inhabitant)) 2%Z ≤ bv_signed (max_arr self) + 1%Z) ∧ Z.abs (nth (Z.to_nat i) (elts (arr self)) inhabitant) ≤ bv_signed (max self) + 1%Z) ∧ (∀(i : Z) (j : Z), 0%Z ≤ i ∧ i ≤ bv_signed (max_arr self) -> i < j ∧ j < ZEuclid.div (Z.abs (nth (Z.to_nat i) (elts (arr self)) inhabitant)) 2%Z -> nth (Z.to_nat j) (elts (arr self)) inhabitant < 0%Z).
Definition t'eq (a : t) (b : t) := nexts a = nexts b ∧ marked a = marked b ∧ arr a = arr b ∧ max a = max b ∧ max_arr a = max_arr b.
Axiom t'inj : forall  (a : t) (b : t) (fact0 : t'eq a b), a = b.
Theorem t'refn'vc (self : t) : bv_signed (max self) < bv_signed int'63_max ∧ 3%Z ≤ bv_signed (max self) ∧ length (nexts self) = length (marked self) ∧ Z.of_nat (length (marked self)) = bv_signed (max self) + 1%Z ∧ inv_nexts (nexts self) (Z.of_nat (length (nexts self))) ∧ all_eliminated_marked (marked self) (nexts self) ∧ (∀(i : Z), 3%Z ≤ i ∧ i ≤ bv_signed (max self) -> ZEuclid.modulo i 2%Z = 0%Z -> nth (Z.to_nat i) (marked self) inhabitant = true) ∧ (∀(i : Z), 3%Z ≤ i ∧ i < bv_signed (max self) - 1%Z -> ZEuclid.modulo i 2%Z = 1%Z -> ZEuclid.modulo (nth (Z.to_nat i) (nexts self) inhabitant) 2%Z = 1%Z ∨ nth (Z.to_nat i) (nexts self) inhabitant = bv_signed (max self) + 1%Z) ∧ nth (Z.to_nat (bv_signed (max self))) (nexts self) inhabitant = bv_signed (max self) + 1%Z ∧ (ZEuclid.modulo (bv_signed (max self) - 1%Z) 2%Z = 0%Z -> nth (Z.to_nat (bv_signed (max self) - 1%Z)) (nexts self) inhabitant = bv_signed (max self)) ∧ (ZEuclid.modulo (bv_signed (max self) - 1%Z) 2%Z = 1%Z -> nth (Z.to_nat (bv_signed (max self) - 1%Z)) (nexts self) inhabitant = bv_signed (max self) + 1%Z).
Admitted.

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
Axiom t : Type.
Axiom t_inhabited : Inhabited t.
Global Existing Instance t_inhabited.
Axiom t_countable : Countable t.
Global Existing Instance t_countable.
Axiom nexts : t -> list Z.
Axiom marked : t -> list bool.
Axiom max : t -> bv 63%N.
Axiom t'invariant : forall  (self : t), bv_signed (max self) < bv_signed int'63_max ∧ 3%Z ≤ bv_signed (max self) ∧ length (nexts self) = length (marked self) ∧ Z.of_nat (length (marked self)) = bv_signed (max self) + 1%Z ∧ inv_nexts (nexts self) (Z.of_nat (length (nexts self))) ∧ all_eliminated_marked (marked self) (nexts self) ∧ (∀(i : Z), 3%Z ≤ i ∧ i ≤ bv_signed (max self) -> ZEuclid.modulo i 2%Z = 0%Z -> nth (Z.to_nat i) (marked self) inhabitant = true) ∧ (∀(i : Z), 3%Z ≤ i ∧ i < bv_signed (max self) - 1%Z -> ZEuclid.modulo i 2%Z = 1%Z -> ZEuclid.modulo (nth (Z.to_nat i) (nexts self) inhabitant) 2%Z = 1%Z ∨ nth (Z.to_nat i) (nexts self) inhabitant = bv_signed (max self) + 1%Z) ∧ nth (Z.to_nat (bv_signed (max self))) (nexts self) inhabitant = bv_signed (max self) + 1%Z ∧ (ZEuclid.modulo (bv_signed (max self) - 1%Z) 2%Z = 0%Z -> nth (Z.to_nat (bv_signed (max self) - 1%Z)) (nexts self) inhabitant = bv_signed (max self)) ∧ (ZEuclid.modulo (bv_signed (max self) - 1%Z) 2%Z = 1%Z -> nth (Z.to_nat (bv_signed (max self) - 1%Z)) (nexts self) inhabitant = bv_signed (max self) + 1%Z).
Theorem only_multiples_marked_impl_not_marked'vc (n : Z) (marked1 : list bool) (nexts1 : list Z) (fact0 : 2%Z ≤ n) (fact1 : n < Z.of_nat (length marked1)) (fact2 : only_multiples_marked marked1 (nth (Z.to_nat n) nexts1 inhabitant)) (fact3 : prime n) : ¬ nth (Z.to_nat n) marked1 inhabitant = true.
Proof.
Admitted.

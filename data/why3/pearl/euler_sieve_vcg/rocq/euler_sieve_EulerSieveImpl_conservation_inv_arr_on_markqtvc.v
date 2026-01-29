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
Theorem conservation_inv_arr_on_mark'vc (arr : list Z) (i : Z) (j : Z) (k : Z) (fact0 : ∀(j : Z) (k : Z), 0%Z ≤ j ∧ j < Z.of_nat (length arr) -> j < k ∧ k < ZEuclid.div (Z.abs (nth (Z.to_nat j) arr inhabitant)) 2%Z -> nth (Z.to_nat k) arr inhabitant < 0%Z) (fact1 : ∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length arr) -> i < ZEuclid.div (Z.abs (nth (Z.to_nat i) arr inhabitant)) 2%Z ∧ ZEuclid.div (Z.abs (nth (Z.to_nat i) arr inhabitant)) 2%Z ≤ Z.of_nat (length arr)) (fact2 : 0%Z ≤ i) (fact3 : i < Z.of_nat (length arr)) (fact4 : 0%Z ≤ nth (Z.to_nat i) arr inhabitant) (fact5 : 0%Z ≤ j) (fact6 : j < Z.of_nat (length arr)) (fact7 : j < k) (fact8 : k < ZEuclid.div (Z.abs (nth (Z.to_nat j) (set_list arr (Z.to_nat i) (- nth (Z.to_nat i) arr inhabitant)) inhabitant)) 2%Z) : nth (Z.to_nat k) (set_list arr (Z.to_nat i) (- nth (Z.to_nat i) arr inhabitant)) inhabitant < 0%Z.
Proof.
Admitted.

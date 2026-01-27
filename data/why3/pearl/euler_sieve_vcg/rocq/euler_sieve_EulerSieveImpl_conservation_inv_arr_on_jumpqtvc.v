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
Theorem conservation_inv_arr_on_jump'vc (min : Z) (arr : list Z) (i : Z) (j : Z) (k : Z) (fact0 : 0%Z ≤ min) (fact1 : ∀(j : Z) (k : Z), min ≤ j ∧ j < Z.of_nat (length arr) -> j < k ∧ k < ZEuclid.div (Z.abs (nth (Z.to_nat j) arr inhabitant)) 2%Z -> nth (Z.to_nat k) arr inhabitant < 0%Z) (fact2 : ∀(i : Z), min ≤ i ∧ i < Z.of_nat (length arr) -> i < ZEuclid.div (Z.abs (nth (Z.to_nat i) arr inhabitant)) 2%Z ∧ ZEuclid.div (Z.abs (nth (Z.to_nat i) arr inhabitant)) 2%Z ≤ Z.of_nat (length arr)) (fact3 : min ≤ i) (fact4 : i < Z.of_nat (length arr)) (fact5 : 0%Z ≤ ZEuclid.div (nth (Z.to_nat i) arr inhabitant) 2%Z) (fact6 : ZEuclid.div (nth (Z.to_nat i) arr inhabitant) 2%Z < Z.of_nat (length arr)) (fact7 : nth (Z.to_nat (ZEuclid.div (nth (Z.to_nat i) arr inhabitant) 2%Z)) arr inhabitant < 0%Z) (fact8 : min ≤ j) (fact9 : j < Z.of_nat (length arr)) (fact10 : j < k) (fact11 : k < ZEuclid.div (Z.abs (nth (Z.to_nat j) (set_list arr (Z.to_nat i) (- nth (Z.to_nat (ZEuclid.div (nth (Z.to_nat i) arr inhabitant) 2%Z)) arr inhabitant)) inhabitant)) 2%Z) : nth (Z.to_nat k) (set_list arr (Z.to_nat i) (- nth (Z.to_nat (ZEuclid.div (nth (Z.to_nat i) arr inhabitant) 2%Z)) arr inhabitant)) inhabitant < 0%Z.
Admitted.

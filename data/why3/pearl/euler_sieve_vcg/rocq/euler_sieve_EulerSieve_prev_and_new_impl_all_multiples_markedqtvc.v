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
Open Scope Z_scope.
Theorem prev_and_new_impl_all_multiples_marked'vc (n : Z) (marked : list bool) (max : Z) (marked_old : list bool) (fact0 : 2%Z ≤ n) (fact1 : n < Z.of_nat (length marked)) (fact2 : 2%Z ≤ max) (fact3 : max < Z.of_nat (length marked)) (fact4 : length marked_old = length marked) (fact5 : is_copy marked marked_old) (fact6 : previously_marked_multiples marked_old n) (fact7 : previously_marked_multiples marked n) (fact8 : only_multiples_marked marked_old n) (fact9 : prime_multiples_marked marked_old marked n (Z.of_nat (length marked))) : all_multiples_marked marked n (Z.of_nat (length marked)).
Admitted.

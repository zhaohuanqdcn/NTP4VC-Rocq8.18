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
Theorem conservation_previously_marked_multiples'vc (n : Z) (marked : list bool) (nexts : list Z) (fact0 : 2%Z ≤ n) (fact1 : n < Z.of_nat (length marked)) (fact2 : length marked = length nexts) (fact3 : nth (Z.to_nat n) nexts inhabitant ≤ Z.of_nat (length marked)) (fact4 : previously_marked_multiples marked n) (fact5 : only_multiples_marked marked (n + 1%Z)) (fact6 : all_eliminated_marked marked nexts) (fact7 : not_marked_impl_next_not_marked marked nexts (nth (Z.to_nat n) nexts inhabitant)) (fact8 : all_multiples_marked marked n (Z.of_nat (length marked))) : previously_marked_multiples marked (nth (Z.to_nat n) nexts inhabitant).
Proof.
Admitted.

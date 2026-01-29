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
Theorem multiples_of_marked_are_marked'vc (n : Z) (marked : list bool) (k : Z) (i : Z) (j : Z) (fact0 : 2%Z ≤ n) (fact1 : n ≤ Z.of_nat (length marked)) (fact2 : previously_marked_multiples marked n) (fact3 : 2%Z ≤ k) (fact4 : k < n) (fact5 : 2%Z ≤ i) (fact6 : i < Z.of_nat (length marked)) (fact7 : k * i < Z.of_nat (length marked)) (fact8 : 1%Z ≤ j) (fact9 : j < Z.of_nat (length marked)) (fact10 : k * i * j < Z.of_nat (length marked)) : nth (Z.to_nat (k * i * j)) marked inhabitant = true.
Proof.
Admitted.

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
Theorem unchanged_other_elements'vc {α : Type} `{Inhabited α} (i : Z) (s2 : list α) (v : α) (j : Z) (fact0 : 0%Z ≤ i) (fact1 : i < Z.of_nat (length (set_list s2 (Z.to_nat i) v))) (fact2 : length (set_list s2 (Z.to_nat i) v) = length s2) (fact3 : 0%Z ≤ j) (fact4 : j < Z.of_nat (length (set_list s2 (Z.to_nat i) v))) (fact5 : ¬ i = j) : nth (Z.to_nat j) (set_list s2 (Z.to_nat i) v) inhabitant = nth (Z.to_nat j) s2 inhabitant.
Proof.
Admitted.

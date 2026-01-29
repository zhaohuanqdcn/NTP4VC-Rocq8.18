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
Require Import Why3.why3.Ref.Ref.
Require Import Why3.int.NumOf.
Require Import counting_sort_vcg.counting_sort.Spec.
Require Import Why3.array.IntArraySorted.
Require Import counting_sort_vcg.counting_sort.InPlaceCountingSort.
Open Scope Z_scope.
Theorem harness'vc (fact0 : k = 2%Z) : 0%Z ≤ 3%Z ∧ (∀(a : list Z), (∀(i : Z), 0%Z ≤ i ∧ i < 3%Z -> nth (Z.to_nat i) a inhabitant = 0%Z) ∧ Z.of_nat (length a) = 3%Z -> (0%Z ≤ 1%Z ∧ 1%Z < Z.of_nat (length a)) ∧ (length (set_list a 1%nat 1%Z) = length a -> nth_i (set_list a 1%nat 1%Z) = fun_updt (nth_i a) 1%Z 1%Z -> k_values (set_list a 1%nat 1%Z))).
Proof.
Admitted.

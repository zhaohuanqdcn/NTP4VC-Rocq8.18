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
Require Import Why3.int.Sum.
Require Import maximum_subarray_vcg.maximum_subarray.Spec.
Open Scope Z_scope.
Theorem maximum_subarray'vc (a : list Z) : let o1 : Z := Z.of_nat (length a) in (0%Z ≤ 0%Z ∧ 0%Z ≤ o1 ∧ o1 ≤ Z.of_nat (length a)) ∧ (∀(hi : Z) (lo : Z), (0%Z ≤ lo ∧ lo ≤ hi ∧ hi ≤ o1) ∧ (∀(l' : Z) (h' : Z), 0%Z ≤ l' ∧ l' ≤ h' ∧ h' ≤ o1 -> list_sum (drop (Z.to_nat l') (take (Z.to_nat h' - Z.to_nat l') a)) ≤ list_sum (drop (Z.to_nat lo) (take (Z.to_nat hi - Z.to_nat lo) a))) -> (0%Z ≤ lo ∧ lo ≤ hi ∧ hi ≤ Z.of_nat (length a)) ∧ maxsub a (list_sum (drop (Z.to_nat lo) (take (Z.to_nat hi - Z.to_nat lo) a)))).
Proof.
Admitted.

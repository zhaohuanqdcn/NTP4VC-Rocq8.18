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
Require Import Why3.why3.Ref.Ref.
Require Import Why3.int.Sum.
Open Scope Z_scope.
Theorem sum'vc (n : Z) (a : list Z) (fact0 : 0%Z ≤ n) (fact1 : n < Z.of_nat (length a)) : 1%Z ≤ 1%Z ∧ 1%Z ≤ n + 1%Z ∧ 0%Z = list_sum (drop 1%nat (take (1%nat - 1%nat) a)) ∧ (∀(i : Z), 1%Z ≤ i ∧ i ≤ n + 1%Z -> (if decide (i ≤ n) then (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ (0%Z ≤ n - i ∧ n - (i + 1%Z) < n - i) ∧ (1%Z ≤ i + 1%Z ∧ i + 1%Z ≤ n + 1%Z) ∧ list_sum (drop 1%nat (take (Z.to_nat i - 1%nat) a)) + nth (Z.to_nat i) a inhabitant = list_sum (drop 1%nat (take (Z.to_nat (i + 1%Z) - 1%nat) a)) else list_sum (drop 1%nat (take (Z.to_nat i - 1%nat) a)) = list_sum (drop 1%nat (take (Z.to_nat (n + 1%Z) - 1%nat) a)))).
Admitted.

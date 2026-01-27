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
Open Scope Z_scope.
Theorem test0'vc : 0%Z ≤ 10%Z ∧ (∀(a : list Z), (∀(i : Z), 0%Z ≤ i ∧ i < 10%Z -> nth (Z.to_nat i) a inhabitant = 0%Z) ∧ Z.of_nat (length a) = 10%Z -> (0%Z ≤ 0%Z ∧ 0%Z < Z.of_nat (length a)) ∧ (length (set_list a 0%nat 10%Z) = length a -> nth_i (set_list a 0%nat 10%Z) = fun_updt (nth_i a) 0%Z 10%Z -> (0%Z ≤ 1%Z ∧ 1%Z < Z.of_nat (length (set_list a 0%nat 10%Z))) ∧ 0%Z ≤ 0%Z ∧ 0%Z < Z.of_nat (length (set_list a 0%nat 10%Z)))).
Admitted.

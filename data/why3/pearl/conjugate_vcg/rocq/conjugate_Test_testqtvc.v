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
Require Import conjugate_vcg.conjugate.Conjugate.
Open Scope Z_scope.
Theorem test'vc : 0%Z ≤ 5%Z ∧ (∀(a : list Z), (∀(i : Z), 0%Z ≤ i ∧ i < 5%Z -> nth (Z.to_nat i) a inhabitant = 0%Z) ∧ Z.of_nat (length a) = 5%Z -> (0%Z ≤ 0%Z ∧ 0%Z < Z.of_nat (length a)) ∧ (length (set_list a 0%nat 3%Z) = length a -> nth_i (set_list a 0%nat 3%Z) = fun_updt (nth_i a) 0%Z 3%Z -> (0%Z ≤ 1%Z ∧ 1%Z < Z.of_nat (length (set_list a 0%nat 3%Z))) ∧ (length (set_list (set_list a 0%nat 3%Z) 1%nat 2%Z) = length (set_list a 0%nat 3%Z) -> nth_i (set_list (set_list a 0%nat 3%Z) 1%nat 2%Z) = fun_updt (nth_i (set_list a 0%nat 3%Z)) 1%Z 2%Z -> (0%Z ≤ 2%Z ∧ 2%Z < Z.of_nat (length (set_list (set_list a 0%nat 3%Z) 1%nat 2%Z))) ∧ (length (set_list (set_list (set_list a 0%nat 3%Z) 1%nat 2%Z) 2%nat 2%Z) = length (set_list (set_list a 0%nat 3%Z) 1%nat 2%Z) -> nth_i (set_list (set_list (set_list a 0%nat 3%Z) 1%nat 2%Z) 2%nat 2%Z) = fun_updt (nth_i (set_list (set_list a 0%nat 3%Z) 1%nat 2%Z)) 2%Z 2%Z -> (0%Z ≤ 3%Z ∧ 3%Z < Z.of_nat (length (set_list (set_list (set_list a 0%nat 3%Z) 1%nat 2%Z) 2%nat 2%Z))) ∧ (length (set_list (set_list (set_list (set_list a 0%nat 3%Z) 1%nat 2%Z) 2%nat 2%Z) 3%nat 1%Z) = length (set_list (set_list (set_list a 0%nat 3%Z) 1%nat 2%Z) 2%nat 2%Z) -> nth_i (set_list (set_list (set_list (set_list a 0%nat 3%Z) 1%nat 2%Z) 2%nat 2%Z) 3%nat 1%Z) = fun_updt (nth_i (set_list (set_list (set_list a 0%nat 3%Z) 1%nat 2%Z) 2%nat 2%Z)) 3%Z 1%Z -> is_partition (set_list (set_list (set_list (set_list a 0%nat 3%Z) 1%nat 2%Z) 2%nat 2%Z) 3%nat 1%Z) ∧ (∀(result : list Z), is_conjugate (set_list (set_list (set_list (set_list a 0%nat 3%Z) 1%nat 2%Z) 2%nat 2%Z) 3%nat 1%Z) result -> 4%Z ≤ Z.of_nat (length result))))))).
Admitted.

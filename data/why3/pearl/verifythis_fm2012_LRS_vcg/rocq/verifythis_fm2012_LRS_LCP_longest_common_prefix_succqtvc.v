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
Definition is_common_prefix (a : list Z) (x : Z) (y : Z) (l : Z) := 0%Z ≤ l ∧ x + l ≤ Z.of_nat (length a) ∧ y + l ≤ Z.of_nat (length a) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < l -> nth (Z.to_nat (x + i)) a inhabitant = nth (Z.to_nat (y + i)) a inhabitant).
Definition is_longest_common_prefix (a : list Z) (x : Z) (y : Z) (l : Z) := is_common_prefix a x y l ∧ (∀(m : Z), l < m -> ¬ is_common_prefix a x y m).
Theorem longest_common_prefix_succ'vc (a : list Z) (x : Z) (y : Z) (l : Z) (fact0 : is_common_prefix a x y l) (fact1 : ¬ is_common_prefix a x y (l + 1%Z)) : is_longest_common_prefix a x y l.
Admitted.

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
Require Import Why3.map.MapEq.
Require Import Why3.map.MapExchange.
Require Import Why3.map.MapPermut.
Require Import Why3.array.IntArraySorted.
Open Scope Z_scope.
Theorem bench'vc (a : list Z) (fact0 : Z.of_nat (length a) = 8%Z) : 0%Z ≤ 0%Z ∧ 0%Z < Z.of_nat (length a) ∧ (nth 0%nat a inhabitant = - 5%Z -> (0%Z ≤ 1%Z ∧ 1%Z < Z.of_nat (length a)) ∧ (nth 1%nat a inhabitant = 6%Z -> (0%Z ≤ 2%Z ∧ 2%Z < Z.of_nat (length a)) ∧ (nth 2%nat a inhabitant = 17%Z -> (0%Z ≤ 3%Z ∧ 3%Z < Z.of_nat (length a)) ∧ (nth 3%nat a inhabitant = 42%Z -> (0%Z ≤ 4%Z ∧ 4%Z < Z.of_nat (length a)) ∧ (nth 4%nat a inhabitant = 53%Z -> (0%Z ≤ 5%Z ∧ 5%Z < Z.of_nat (length a)) ∧ (nth 5%nat a inhabitant = 69%Z -> (0%Z ≤ 6%Z ∧ 6%Z < Z.of_nat (length a)) ∧ (nth 6%nat a inhabitant = 91%Z -> 0%Z ≤ 7%Z ∧ 7%Z < Z.of_nat (length a)))))))).
Admitted.

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
Theorem fast_exp'vc (n : Z) (x : Z) (fact0 : 0%Z ≤ n) : (¬ n = 0%Z -> ¬ 2%Z = 0%Z ∧ (let o1 : Z := Z.rem n 2%Z in ((0%Z ≤ n ∧ o1 < n) ∧ 0%Z ≤ o1) ∧ ¬ 2%Z = 0%Z)) ∧ (∀(result : Z), (if decide (n = 0%Z) then result = 1%Z else let r : Z := Z.pow x (Z.rem n 2%Z) in if decide (Z.quot n 2%Z = 0%Z) then result = r * r else result = r * r * x) -> result = Z.pow x n).
Admitted.

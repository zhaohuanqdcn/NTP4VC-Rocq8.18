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
Theorem f'vc (n : Z) (fact0 : 0%Z ≤ n) : (¬ n = 0%Z -> (let o1 : Z := n - 1%Z in ((0%Z ≤ n ∧ o1 < n) ∧ 0%Z ≤ o1) ∧ (∀(o2 : Z), (if decide (o1 = 0%Z) then o2 = 1%Z else 1%Z ≤ o2 ∧ o2 ≤ o1) -> (0%Z ≤ n ∧ o2 < n ∨ n = o2 ∧ 0%Z ≤ 1%Z ∧ 0%Z < 1%Z) ∧ 0%Z ≤ o2))) ∧ (∀(result : Z), (if decide (n = 0%Z) then result = 1%Z else let o1 : Z := n - 1%Z in ∃(o2 : Z), (if decide (o1 = 0%Z) then o2 = 1%Z else 1%Z ≤ o2 ∧ o2 ≤ o1) ∧ (∃(o3 : Z), (if decide (o2 = 0%Z) then o3 = 0%Z else 0%Z ≤ o3 ∧ o3 < o2) ∧ result = n - o3)) -> (if decide (n = 0%Z) then result = 1%Z else 1%Z ≤ result ∧ result ≤ n)).
Admitted.

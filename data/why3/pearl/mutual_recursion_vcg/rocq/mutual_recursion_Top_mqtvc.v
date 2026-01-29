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
Open Scope Z_scope.
Theorem m'vc (n : Z) (fact0 : 0%Z ≤ n) : (¬ n = 0%Z -> (let o1 : Z := n - 1%Z in ((0%Z ≤ n ∧ o1 < n) ∧ 0%Z ≤ o1) ∧ (∀(o2 : Z), (if decide (o1 = 0%Z) then o2 = 0%Z else 0%Z ≤ o2 ∧ o2 < o1) -> (0%Z ≤ n ∧ o2 < n ∨ n = o2 ∧ 0%Z ≤ 0%Z ∧ 1%Z < 0%Z) ∧ 0%Z ≤ o2))) ∧ (∀(result : Z), (if decide (n = 0%Z) then result = 0%Z else let o1 : Z := n - 1%Z in ∃(o2 : Z), (if decide (o1 = 0%Z) then o2 = 0%Z else 0%Z ≤ o2 ∧ o2 < o1) ∧ (∃(o3 : Z), (if decide (o2 = 0%Z) then o3 = 1%Z else 1%Z ≤ o3 ∧ o3 ≤ o2) ∧ result = n - o3)) -> (if decide (n = 0%Z) then result = 0%Z else 0%Z ≤ result ∧ result < n)).
Proof.
Admitted.

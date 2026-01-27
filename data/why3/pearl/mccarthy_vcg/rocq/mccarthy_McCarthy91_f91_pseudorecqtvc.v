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
Require Import Why3.int.Iter.
Open Scope Z_scope.
Definition spec (x : Z) : Z := if decide (x ≤ 100%Z) then 91%Z else x - 10%Z.
Theorem f91_pseudorec'vc (n0 : Z) : (∀(n : Z) (e : Z), 0%Z ≤ e -> (if decide (¬ 0%Z < e) then e = 0%Z else if decide (100%Z < n) then 0%Z < e ∧ (if decide (100%Z < n) then True else n - 10%Z = n + 11%Z ∧ e - 1%Z = e + 1%Z) else 0%Z < e ∧ (if decide (100%Z < n) then n + 11%Z = n - 10%Z ∧ e + 1%Z = e - 1%Z else True))) ∧ (∀(n : Z) (e : Z), 0%Z < e -> 0%Z ≤ e ∧ (∀(n1 : Z) (e1 : Z), (0%Z < e ∧ (if decide (100%Z < n) then n1 = n - 10%Z ∧ e1 = e - 1%Z else n1 = n + 11%Z ∧ e1 = e + 1%Z) -> (if decide (n ≤ 100%Z) then ((0%Z ≤ 101%Z - n ∧ 101%Z - n1 < 101%Z - n) ∧ 0%Z < e1) ∧ ((0%Z ≤ 101%Z - n ∧ 101%Z - spec n1 < 101%Z - n) ∧ 0%Z < e1 - 1%Z) ∧ e1 - 1%Z - 1%Z = e - 1%Z ∧ spec (spec n1) = spec n else e1 = e - 1%Z ∧ n1 = spec n)) ∧ ¬ ((e1 = e ∧ e = 0%Z) ∧ n1 = n))) ∧ 0%Z < 1%Z ∧ 0%Z ≤ 1%Z - 1%Z ∧ (∀(n : Z) (e : Z), ¬ (0%Z < 1%Z - 1%Z ∧ (if decide (100%Z < spec n0) then n = spec n0 - 10%Z ∧ e = 1%Z - 1%Z - 1%Z else n = spec n0 + 11%Z ∧ e = 1%Z - 1%Z + 1%Z)) ∧ ((e = 1%Z - 1%Z ∧ 1%Z - 1%Z = 0%Z) ∧ n = spec n0 -> n = spec n0)).
Admitted.

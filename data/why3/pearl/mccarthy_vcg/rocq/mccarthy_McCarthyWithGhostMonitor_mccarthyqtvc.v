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
Open Scope Z_scope.
Definition spec (x : Z) : Z := if decide (x ≤ 100%Z) then 91%Z else x - 10%Z.
Theorem mccarthy'vc (n : Z) (e : Z) (r : Z) (fact0 : 0%Z ≤ n) : 0%Z ≤ 0%Z ∧ 0%Z < 8%Z ∧ ((0%Z = 1%Z -> 1%Z = 2%Z ∧ 1%Z = e ∧ r = n) ∧ (0%Z = 2%Z ∧ 100%Z < r -> 1%Z = 3%Z ∧ 1%Z = e) ∧ (0%Z = 2%Z ∧ r ≤ 100%Z -> 1%Z = 6%Z ∧ 1%Z = e) ∧ (0%Z = 3%Z -> 1%Z = 4%Z ∧ 1%Z = e ∧ r = r - 10%Z) ∧ (0%Z = 4%Z -> 1%Z = 5%Z ∧ 1%Z = e - 1%Z) ∧ (0%Z = 5%Z ∧ e = 0%Z -> 1%Z = 8%Z ∧ 1%Z = e) ∧ (0%Z = 5%Z ∧ ¬ e = 0%Z -> 1%Z = 2%Z ∧ 1%Z = e) ∧ (0%Z = 6%Z -> 1%Z = 7%Z ∧ 1%Z = e ∧ r = r + 11%Z) ∧ (0%Z = 7%Z -> 1%Z = 2%Z ∧ 1%Z = e + 1%Z) -> (0%Z ≤ 1%Z ∧ 1%Z < 8%Z) ∧ ((1%Z = 0%Z -> 2%Z = 1%Z ∧ n = r) ∧ (1%Z = 2%Z ∧ 100%Z < r -> 2%Z = 3%Z ∧ n = r) ∧ (1%Z = 2%Z ∧ r ≤ 100%Z -> 2%Z = 6%Z ∧ n = r) ∧ (1%Z = 3%Z -> 2%Z = 4%Z ∧ n = r - 10%Z) ∧ (1%Z = 4%Z -> 2%Z = 5%Z ∧ 1%Z = 1%Z - 1%Z ∧ n = r) ∧ (1%Z = 5%Z ∧ 1%Z = 0%Z -> 2%Z = 8%Z ∧ n = r) ∧ (1%Z = 5%Z ∧ ¬ 1%Z = 0%Z -> n = r) ∧ (1%Z = 6%Z -> 2%Z = 7%Z ∧ n = r + 11%Z) ∧ (1%Z = 7%Z -> 1%Z = 1%Z + 1%Z ∧ n = r) -> 0%Z < 1%Z ∧ (0%Z ≤ 5%Z ∧ 5%Z < 8%Z) ∧ (∀(r1 : Z) (e1 : Z) (pc : Z), (5%Z = 0%Z -> pc = 1%Z ∧ e1 = 1%Z ∧ r1 = spec n) ∧ (5%Z = 1%Z -> pc = 2%Z ∧ e1 = 1%Z - 1%Z ∧ r1 = n) ∧ (5%Z = 2%Z ∧ 100%Z < spec n -> pc = 3%Z ∧ e1 = 1%Z - 1%Z ∧ r1 = spec n) ∧ (5%Z = 2%Z ∧ spec n ≤ 100%Z -> pc = 6%Z ∧ e1 = 1%Z - 1%Z ∧ r1 = spec n) ∧ (5%Z = 3%Z -> pc = 4%Z ∧ e1 = 1%Z - 1%Z ∧ r1 = spec n - 10%Z) ∧ (5%Z = 4%Z -> pc = 5%Z ∧ e1 = 1%Z - 1%Z - 1%Z ∧ r1 = spec n) ∧ (1%Z - 1%Z = 0%Z -> pc = 8%Z ∧ e1 = 1%Z - 1%Z ∧ r1 = spec n) ∧ (¬ 1%Z - 1%Z = 0%Z -> pc = 2%Z ∧ e1 = 1%Z - 1%Z ∧ r1 = spec n) ∧ (5%Z = 6%Z -> pc = 7%Z ∧ e1 = 1%Z - 1%Z ∧ r1 = spec n + 11%Z) ∧ (5%Z = 7%Z -> pc = 2%Z ∧ e1 = 1%Z - 1%Z + 1%Z ∧ r1 = spec n) -> pc = 8%Z ∧ r1 = spec n))).
Admitted.

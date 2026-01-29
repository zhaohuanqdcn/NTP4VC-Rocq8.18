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
Require Import Why3.why3.Ref.Ref.
Open Scope Z_scope.
Definition spec (x : Z) : Z := if decide (x ≤ 100%Z) then 91%Z else x - 10%Z.
Theorem monitor'vc (e : Z) (r1 : Z) (n : Z) (fact0 : 0%Z < e) : 0%Z ≤ 2%Z ∧ 2%Z < 8%Z ∧ (∀(r : Z) (e1 : Z) (pc : Z), (2%Z = 0%Z -> pc = 1%Z ∧ e1 = 1%Z ∧ r = r1) ∧ (2%Z = 1%Z -> pc = 2%Z ∧ e1 = e ∧ r = n) ∧ (100%Z < r1 -> pc = 3%Z ∧ e1 = e ∧ r = r1) ∧ (r1 ≤ 100%Z -> pc = 6%Z ∧ e1 = e ∧ r = r1) ∧ (2%Z = 3%Z -> pc = 4%Z ∧ e1 = e ∧ r = r1 - 10%Z) ∧ (2%Z = 4%Z -> pc = 5%Z ∧ e1 = e - 1%Z ∧ r = r1) ∧ (2%Z = 5%Z ∧ e = 0%Z -> pc = 8%Z ∧ e1 = e ∧ r = r1) ∧ (2%Z = 5%Z ∧ ¬ e = 0%Z -> pc = 2%Z ∧ e1 = e ∧ r = r1) ∧ (2%Z = 6%Z -> pc = 7%Z ∧ e1 = e ∧ r = r1 + 11%Z) ∧ (2%Z = 7%Z -> pc = 2%Z ∧ e1 = e + 1%Z ∧ r = r1) -> (if decide (pc = 3%Z) then (0%Z ≤ pc ∧ pc < 8%Z) ∧ (∀(r2 : Z) (e2 : Z) (pc1 : Z), (pc = 0%Z -> pc1 = 1%Z ∧ e2 = 1%Z ∧ r2 = r) ∧ (pc = 1%Z -> pc1 = 2%Z ∧ e2 = e1 ∧ r2 = n) ∧ (pc = 2%Z ∧ 100%Z < r -> pc1 = 3%Z ∧ e2 = e1 ∧ r2 = r) ∧ (pc = 2%Z ∧ r ≤ 100%Z -> pc1 = 6%Z ∧ e2 = e1 ∧ r2 = r) ∧ (pc = 3%Z -> pc1 = 4%Z ∧ e2 = e1 ∧ r2 = r - 10%Z) ∧ (pc = 4%Z -> pc1 = 5%Z ∧ e2 = e1 - 1%Z ∧ r2 = r) ∧ (pc = 5%Z ∧ e1 = 0%Z -> pc1 = 8%Z ∧ e2 = e1 ∧ r2 = r) ∧ (pc = 5%Z ∧ ¬ e1 = 0%Z -> pc1 = 2%Z ∧ e2 = e1 ∧ r2 = r) ∧ (pc = 6%Z -> pc1 = 7%Z ∧ e2 = e1 ∧ r2 = r + 11%Z) ∧ (pc = 7%Z -> pc1 = 2%Z ∧ e2 = e1 + 1%Z ∧ r2 = r) -> (0%Z ≤ pc1 ∧ pc1 < 8%Z) ∧ (∀(r3 : Z) (e3 : Z) (pc2 : Z), (pc1 = 0%Z -> pc2 = 1%Z ∧ e3 = 1%Z ∧ r3 = r2) ∧ (pc1 = 1%Z -> pc2 = 2%Z ∧ e3 = e2 ∧ r3 = n) ∧ (pc1 = 2%Z ∧ 100%Z < r2 -> pc2 = 3%Z ∧ e3 = e2 ∧ r3 = r2) ∧ (pc1 = 2%Z ∧ r2 ≤ 100%Z -> pc2 = 6%Z ∧ e3 = e2 ∧ r3 = r2) ∧ (pc1 = 3%Z -> pc2 = 4%Z ∧ e3 = e2 ∧ r3 = r2 - 10%Z) ∧ (pc1 = 4%Z -> pc2 = 5%Z ∧ e3 = e2 - 1%Z ∧ r3 = r2) ∧ (pc1 = 5%Z ∧ e2 = 0%Z -> pc2 = 8%Z ∧ e3 = e2 ∧ r3 = r2) ∧ (pc1 = 5%Z ∧ ¬ e2 = 0%Z -> pc2 = 2%Z ∧ e3 = e2 ∧ r3 = r2) ∧ (pc1 = 6%Z -> pc2 = 7%Z ∧ e3 = e2 ∧ r3 = r2 + 11%Z) ∧ (pc1 = 7%Z -> pc2 = 2%Z ∧ e3 = e2 + 1%Z ∧ r3 = r2) -> pc2 = 5%Z ∧ r3 = spec r1 ∧ e3 = e - 1%Z)) else (0%Z ≤ pc ∧ pc < 8%Z) ∧ (∀(r2 : Z) (e2 : Z) (pc1 : Z), (pc = 0%Z -> pc1 = 1%Z ∧ e2 = 1%Z ∧ r2 = r) ∧ (pc = 1%Z -> pc1 = 2%Z ∧ e2 = e1 ∧ r2 = n) ∧ (pc = 2%Z ∧ 100%Z < r -> pc1 = 3%Z ∧ e2 = e1 ∧ r2 = r) ∧ (pc = 2%Z ∧ r ≤ 100%Z -> pc1 = 6%Z ∧ e2 = e1 ∧ r2 = r) ∧ (pc = 3%Z -> pc1 = 4%Z ∧ e2 = e1 ∧ r2 = r - 10%Z) ∧ (pc = 4%Z -> pc1 = 5%Z ∧ e2 = e1 - 1%Z ∧ r2 = r) ∧ (pc = 5%Z ∧ e1 = 0%Z -> pc1 = 8%Z ∧ e2 = e1 ∧ r2 = r) ∧ (pc = 5%Z ∧ ¬ e1 = 0%Z -> pc1 = 2%Z ∧ e2 = e1 ∧ r2 = r) ∧ (pc = 6%Z -> pc1 = 7%Z ∧ e2 = e1 ∧ r2 = r + 11%Z) ∧ (pc = 7%Z -> pc1 = 2%Z ∧ e2 = e1 + 1%Z ∧ r2 = r) -> (0%Z ≤ pc1 ∧ pc1 < 8%Z) ∧ (∀(r3 : Z) (e3 : Z) (pc2 : Z), (pc1 = 0%Z -> pc2 = 1%Z ∧ e3 = 1%Z ∧ r3 = r2) ∧ (pc1 = 1%Z -> pc2 = 2%Z ∧ e3 = e2 ∧ r3 = n) ∧ (pc1 = 2%Z ∧ 100%Z < r2 -> pc2 = 3%Z ∧ e3 = e2 ∧ r3 = r2) ∧ (pc1 = 2%Z ∧ r2 ≤ 100%Z -> pc2 = 6%Z ∧ e3 = e2 ∧ r3 = r2) ∧ (pc1 = 3%Z -> pc2 = 4%Z ∧ e3 = e2 ∧ r3 = r2 - 10%Z) ∧ (pc1 = 4%Z -> pc2 = 5%Z ∧ e3 = e2 - 1%Z ∧ r3 = r2) ∧ (pc1 = 5%Z ∧ e2 = 0%Z -> pc2 = 8%Z ∧ e3 = e2 ∧ r3 = r2) ∧ (pc1 = 5%Z ∧ ¬ e2 = 0%Z -> pc2 = 2%Z ∧ e3 = e2 ∧ r3 = r2) ∧ (pc1 = 6%Z -> pc2 = 7%Z ∧ e3 = e2 ∧ r3 = r2 + 11%Z) ∧ (pc1 = 7%Z -> pc2 = 2%Z ∧ e3 = e2 + 1%Z ∧ r3 = r2) -> ((0%Z ≤ 101%Z - r1 ∧ 101%Z - r3 < 101%Z - r1) ∧ pc2 = 2%Z ∧ 0%Z < e3) ∧ (0%Z ≤ 5%Z ∧ 5%Z < 8%Z) ∧ (∀(r4 : Z) (e4 : Z) (pc3 : Z), (5%Z = 0%Z -> pc3 = 1%Z ∧ e4 = 1%Z ∧ r4 = spec r3) ∧ (5%Z = 1%Z -> pc3 = 2%Z ∧ e4 = e3 - 1%Z ∧ r4 = n) ∧ (5%Z = 2%Z ∧ 100%Z < spec r3 -> pc3 = 3%Z ∧ e4 = e3 - 1%Z ∧ r4 = spec r3) ∧ (5%Z = 2%Z ∧ spec r3 ≤ 100%Z -> pc3 = 6%Z ∧ e4 = e3 - 1%Z ∧ r4 = spec r3) ∧ (5%Z = 3%Z -> pc3 = 4%Z ∧ e4 = e3 - 1%Z ∧ r4 = spec r3 - 10%Z) ∧ (5%Z = 4%Z -> pc3 = 5%Z ∧ e4 = e3 - 1%Z - 1%Z ∧ r4 = spec r3) ∧ (e3 - 1%Z = 0%Z -> pc3 = 8%Z ∧ e4 = e3 - 1%Z ∧ r4 = spec r3) ∧ (¬ e3 - 1%Z = 0%Z -> pc3 = 2%Z ∧ e4 = e3 - 1%Z ∧ r4 = spec r3) ∧ (5%Z = 6%Z -> pc3 = 7%Z ∧ e4 = e3 - 1%Z ∧ r4 = spec r3 + 11%Z) ∧ (5%Z = 7%Z -> pc3 = 2%Z ∧ e4 = e3 - 1%Z + 1%Z ∧ r4 = spec r3) -> ((0%Z ≤ 101%Z - r1 ∧ 101%Z - r4 < 101%Z - r1) ∧ pc3 = 2%Z ∧ 0%Z < e4) ∧ spec r4 = spec r1 ∧ e4 - 1%Z = e - 1%Z))))).
Proof.
Admitted.

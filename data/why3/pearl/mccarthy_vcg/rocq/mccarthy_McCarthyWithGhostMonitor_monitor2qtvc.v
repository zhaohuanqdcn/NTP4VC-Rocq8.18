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
Theorem monitor2'vc (e : Z) (n : Z) (r1 : Z) (fact0 : 0%Z < e) : 0%Z ≤ 1%Z ∧ 1%Z < 3%Z ∧ (∀(r : Z) (e1 : Z) (pc : Z), (1%Z = 0%Z -> pc = 1%Z ∧ e1 = 1%Z ∧ r = n) ∧ (100%Z < r1 -> pc = 2%Z ∧ r = r1 - 10%Z ∧ e1 = e - 1%Z) ∧ (r1 ≤ 100%Z -> pc = 1%Z ∧ r = r1 + 11%Z ∧ e1 = e + 1%Z) ∧ (1%Z = 2%Z ∧ e = 0%Z -> pc = 3%Z ∧ r = r1 ∧ e1 = e) ∧ (1%Z = 2%Z ∧ ¬ e = 0%Z -> pc = 1%Z ∧ r = r1 ∧ e1 = e) -> (if decide (¬ pc = 2%Z) then ((0%Z ≤ 101%Z - r1 ∧ 101%Z - r < 101%Z - r1) ∧ pc = 1%Z ∧ 0%Z < e1) ∧ (0%Z ≤ 2%Z ∧ 2%Z < 3%Z) ∧ (∀(r2 : Z) (e2 : Z) (pc1 : Z), (2%Z = 0%Z -> pc1 = 1%Z ∧ e2 = 1%Z ∧ r2 = n) ∧ (2%Z = 1%Z ∧ 100%Z < spec r -> pc1 = 2%Z ∧ r2 = spec r - 10%Z ∧ e2 = e1 - 1%Z - 1%Z) ∧ (2%Z = 1%Z ∧ spec r ≤ 100%Z -> pc1 = 1%Z ∧ r2 = spec r + 11%Z ∧ e2 = e1 - 1%Z + 1%Z) ∧ (e1 - 1%Z = 0%Z -> pc1 = 3%Z ∧ r2 = spec r ∧ e2 = e1 - 1%Z) ∧ (¬ e1 - 1%Z = 0%Z -> pc1 = 1%Z ∧ r2 = spec r ∧ e2 = e1 - 1%Z) -> ((0%Z ≤ 101%Z - r1 ∧ 101%Z - r2 < 101%Z - r1) ∧ pc1 = 1%Z ∧ 0%Z < e2) ∧ spec r2 = spec r1 ∧ e2 - 1%Z = e - 1%Z) else pc = 2%Z ∧ r = spec r1 ∧ e1 = e - 1%Z)).
Proof.
Admitted.

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
Definition spec (x : Z) : Z := if decide (x ≤ 100%Z) then 91%Z else x - 10%Z.
Theorem f91'vc (n : bv 63%N) : (if decide (bv_signed n ≤ 100%Z) then int'63_in_bounds (bv_signed n + 11%Z) ∧ (∀(o1 : bv 63%N), bv_signed o1 = bv_signed n + 11%Z -> (0%Z ≤ 101%Z - bv_signed n ∧ 101%Z - bv_signed o1 < 101%Z - bv_signed n) ∧ (∀(o2 : bv 63%N), bv_signed o2 = spec (bv_signed o1) -> 0%Z ≤ 101%Z - bv_signed n ∧ 101%Z - bv_signed o2 < 101%Z - bv_signed n)) else int'63_in_bounds (bv_signed n - 10%Z)) ∧ (∀(result : bv 63%N), (if decide (bv_signed n ≤ 100%Z) then ∃(o1 : bv 63%N), bv_signed o1 = bv_signed n + 11%Z ∧ (∃(o2 : bv 63%N), bv_signed o2 = spec (bv_signed o1) ∧ bv_signed result = spec (bv_signed o2)) else bv_signed result = bv_signed n - 10%Z) -> bv_signed result = spec (bv_signed n)).
Proof.
Admitted.

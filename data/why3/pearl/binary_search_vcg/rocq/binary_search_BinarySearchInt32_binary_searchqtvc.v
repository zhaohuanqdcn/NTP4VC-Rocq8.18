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
Theorem binary_search'vc (a : array32 (bv 32%N)) (v : bv 32%N) (fact0 : ∀(i1 : Z) (i2 : Z), 0%Z ≤ i1 ∧ i1 ≤ i2 ∧ i2 < bv_signed (array32_length a) -> bv_signed (array32_elts a i1) ≤ bv_signed (array32_elts a i2)) : let o1 : bv 32%N := array32_length a in int'32_in_bounds (bv_signed o1 - 1%Z) ∧ (∀(o2 : bv 32%N), bv_signed o2 = bv_signed o1 - 1%Z -> ((0%Z ≤ 0%Z ∧ bv_signed o2 < bv_signed (array32_length a)) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < bv_signed (array32_length a) -> array32_elts a i = v -> 0%Z ≤ i ∧ i ≤ bv_signed o2)) ∧ (∀(u : bv 32%N) (l : bv 32%N), (0%Z ≤ bv_signed l ∧ bv_signed u < bv_signed (array32_length a)) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < bv_signed (array32_length a) -> array32_elts a i = v -> bv_signed l ≤ i ∧ i ≤ bv_signed u) -> (if decide (bv_signed l ≤ bv_signed u) then int'32_in_bounds (bv_signed u - bv_signed l) ∧ (∀(o3 : bv 32%N), bv_signed o3 = bv_signed u - bv_signed l -> (¬ 2%Z = 0%Z ∧ int'32_in_bounds (Z.rem (bv_signed o3) 2%Z)) ∧ (∀(o4 : bv 32%N), bv_signed o4 = Z.rem (bv_signed o3) 2%Z -> int'32_in_bounds (bv_signed l + bv_signed o4) ∧ (∀(m : bv 32%N), bv_signed m = bv_signed l + bv_signed o4 -> (0%Z ≤ bv_signed m ∧ bv_signed m < bv_signed (array32_length a)) ∧ (if decide (bv_signed (array32_elts a (bv_signed m)) < bv_signed v) then int'32_in_bounds (bv_signed m + 1%Z) ∧ (∀(o5 : bv 32%N), bv_signed o5 = bv_signed m + 1%Z -> (0%Z ≤ bv_signed u - bv_signed l ∧ bv_signed u - bv_signed o5 < bv_signed u - bv_signed l) ∧ (0%Z ≤ bv_signed o5 ∧ bv_signed u < bv_signed (array32_length a)) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < bv_signed (array32_length a) -> array32_elts a i = v -> bv_signed o5 ≤ i ∧ i ≤ bv_signed u)) else (0%Z ≤ bv_signed m ∧ bv_signed m < bv_signed (array32_length a)) ∧ (if decide (bv_signed v < bv_signed (array32_elts a (bv_signed m))) then int'32_in_bounds (bv_signed m - 1%Z) ∧ (∀(o5 : bv 32%N), bv_signed o5 = bv_signed m - 1%Z -> (0%Z ≤ bv_signed u - bv_signed l ∧ bv_signed o5 - bv_signed l < bv_signed u - bv_signed l) ∧ (0%Z ≤ bv_signed l ∧ bv_signed o5 < bv_signed (array32_length a)) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < bv_signed (array32_length a) -> array32_elts a i = v -> bv_signed l ≤ i ∧ i ≤ bv_signed o5)) else (0%Z ≤ bv_signed m ∧ bv_signed m < bv_signed (array32_length a)) ∧ array32_elts a (bv_signed m) = v))))) else ∀(i : Z), 0%Z ≤ i ∧ i < bv_signed (array32_length a) -> ¬ array32_elts a i = v))).
Proof.
Admitted.

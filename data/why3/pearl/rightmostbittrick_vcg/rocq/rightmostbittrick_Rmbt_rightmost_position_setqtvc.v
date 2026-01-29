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
Require Import Why3.why3.WellFounded.WellFounded.
Require Import Why3.why3.Ref.Ref.
Open Scope Z_scope.
Theorem rightmost_position_set'vc (a : bv 64%N) (fact0 : ¬ a = (0%bv : bv 64%N)) : eq_sub_bv a (0%bv : bv 64%N) (Z.to_N (bv_unsigned (0%bv : bv 64%N))) (Z.to_N (bv_unsigned (0%bv : bv 64%N))) ∧ (∀(i : bv 64%N), eq_sub_bv a (0%bv : bv 64%N) (Z.to_N (bv_unsigned (0%bv : bv 64%N))) (Z.to_N (bv_unsigned i)) -> (∀(o1 : bool), (if decide (bv_ult i (64%bv : bv 64%N)) then o1 = (if decide (Z.testbit (bv_unsigned a) (bv_unsigned i) = true) then false else true) else o1 = false) -> (if decide (o1 = true) then (0%Z ≤ 64%Z - bv_unsigned i ∧ 64%Z - bv_unsigned (bv_add i (1%bv : bv 64%N)) < 64%Z - bv_unsigned i) ∧ eq_sub_bv a (0%bv : bv 64%N) (Z.to_N (bv_unsigned (0%bv : bv 64%N))) (Z.to_N (bv_unsigned (bv_add i (1%bv : bv 64%N)))) else bv_ult i (64%bv : bv 64%N) ∧ eq_sub_bv a (0%bv : bv 64%N) (Z.to_N (bv_unsigned (0%bv : bv 64%N))) (Z.to_N (bv_unsigned i)) ∧ Z.testbit (bv_unsigned a) (bv_unsigned i) = true))).
Proof.
Admitted.

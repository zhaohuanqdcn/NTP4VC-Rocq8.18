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
Theorem rightmost_bit_trick'vc (x : bv 64%N) (fact0 : ¬ x = (0%bv : bv 64%N)) : ¬ x = (0%bv : bv 64%N) ∧ (∀(p_bv : bv 64%N), bv_ult p_bv (64%bv : bv 64%N) ∧ eq_sub_bv x (0%bv : bv 64%N) (Z.to_N (bv_unsigned (0%bv : bv 64%N))) (Z.to_N (bv_unsigned p_bv)) ∧ Z.testbit (bv_unsigned x) (bv_unsigned p_bv) = true -> (let r : bv 64%N := bv_and x (bv_opp x) in (0%Z ≤ bv_unsigned p_bv ∧ bv_unsigned p_bv < 64%Z) ∧ eq_sub_bv x (0%bv : bv 64%N) (Z.to_N 0%Z) (Z.to_N (bv_unsigned p_bv)) ∧ Z.testbit (bv_unsigned x) (bv_unsigned p_bv) = true ∧ eq_sub_bv r (0%bv : bv 64%N) (Z.to_N 0%Z) (Z.to_N (bv_unsigned p_bv)) ∧ eq_sub_bv r (0%bv : bv 64%N) (Z.to_N (bv_unsigned p_bv + 1%Z)) (Z.to_N (63%Z - bv_unsigned p_bv)) ∧ Z.testbit (bv_unsigned r) (bv_unsigned p_bv) = true)).
Proof.
Admitted.

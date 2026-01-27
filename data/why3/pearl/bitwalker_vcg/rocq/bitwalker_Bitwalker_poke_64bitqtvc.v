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
Require Import Why3.why3.WellFounded.WellFounded.
Require Import Why3.why3.Ref.Ref.
Require Import Why3.mach.bv.BVCheck8.
Require Import Why3.mach.bv.BVCheck32.
Require Import Why3.mach.bv.BVCheck64.
Open Scope Z_scope.
Definition nth8_stream (stream : list (bv 8%N)) (pos : Z) : bool := Z.testbit (bv_unsigned (nth (Z.to_nat (ZEuclid.div pos 8%Z)) stream inhabitant)) (7%Z - ZEuclid.modulo pos 8%Z).
Definition maxvalue (len : bv 32%N) : bv 64%N := bv_shiftl (1%bv : bv 64%N) (bv_zero_extend 64 len).
Theorem poke_64bit'vc (left1 : Z) (flag : bool) (value : bv 64%N) (fact0 : 0%Z ≤ left1) (fact1 : left1 < 64%Z) : let left_bv : bv 64%N := Z_to_bv 64%N left1 in (let mask : bv 64%N := bv_shiftl (1%bv : bv 64%N) (Z_to_bv 64%N (63%Z - left1)) in (match flag with | true => True | false => True end) ∧ (∀(result : bv 64%N), (match flag with | true => result = bv_or value mask | false => result = bv_and value (bv_not mask) end) -> (∀(i : bv 64%N), bv_ule i (63%bv : bv 64%N) -> ¬ i = bv_sub (63%bv : bv 64%N) left_bv -> Z.testbit (bv_unsigned result) (bv_unsigned i) = Z.testbit (bv_unsigned value) (bv_unsigned i)) ∧ flag = Z.testbit (bv_unsigned result) (bv_unsigned (bv_sub (63%bv : bv 64%N) left_bv)))) ∧ (∀(result : bv 64%N), (∀(i : bv 64%N), bv_ule i (63%bv : bv 64%N) -> ¬ i = bv_sub (63%bv : bv 64%N) left_bv -> Z.testbit (bv_unsigned result) (bv_unsigned i) = Z.testbit (bv_unsigned value) (bv_unsigned i)) ∧ flag = Z.testbit (bv_unsigned result) (bv_unsigned (bv_sub (63%bv : bv 64%N) left_bv)) -> (∀(i : Z), (0%Z ≤ i ∧ i < 64%Z) ∧ ¬ i = 63%Z - left1 -> Z.testbit (bv_unsigned result) i = Z.testbit (bv_unsigned value) i) ∧ flag = Z.testbit (bv_unsigned result) (63%Z - left1)).
Admitted.

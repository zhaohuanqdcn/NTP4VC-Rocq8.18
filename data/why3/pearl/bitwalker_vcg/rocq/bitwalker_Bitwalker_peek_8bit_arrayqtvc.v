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
Require Import Why3.mach.bv.BVCheck8.
Require Import Why3.mach.bv.BVCheck32.
Require Import Why3.mach.bv.BVCheck64.
Open Scope Z_scope.
Definition nth8_stream (stream : list (bv 8%N)) (pos : Z) : bool := Z.testbit (bv_unsigned (nth (Z.to_nat (ZEuclid.div pos 8%Z)) stream inhabitant)) (7%Z - ZEuclid.modulo pos 8%Z).
Definition maxvalue (len : bv 32%N) : bv 64%N := bv_shiftl (1%bv : bv 64%N) (bv_zero_extend 64 len).
Theorem peek_8bit_array'vc (addr : list (bv 8%N)) (left1 : bv 32%N) (fact0 : 8%Z * Z.of_nat (length addr) < 4294967296%Z) (fact1 : bv_unsigned left1 < 8%Z * Z.of_nat (length addr)) : (¬ (8%bv : bv 32%N) = (0%bv : bv 32%N) ∨ ¬ 8%Z = 0%Z) ∧ (bv_unsigned (bv_modu left1 (8%bv : bv 32%N)) = ZEuclid.modulo (bv_unsigned left1) 8%Z -> (¬ (8%bv : bv 32%N) = (0%bv : bv 32%N) ∨ ¬ 8%Z = 0%Z) ∧ (bv_unsigned (bv_divu left1 (8%bv : bv 32%N)) = ZEuclid.div (bv_unsigned left1) 8%Z -> (let o1 : Z := bv_unsigned (bv_divu left1 (8%bv : bv 32%N)) in (0%Z ≤ o1 ∧ o1 < Z.of_nat (length addr)) ∧ (0%Z ≤ bv_unsigned (bv_modu left1 (8%bv : bv 32%N)) ∧ bv_unsigned (bv_modu left1 (8%bv : bv 32%N)) < 8%Z) ∧ Z.testbit (bv_unsigned (nth (Z.to_nat o1) addr inhabitant)) (7%Z - bv_unsigned (bv_modu left1 (8%bv : bv 32%N))) = nth8_stream addr (bv_unsigned left1)))).
Proof.
Admitted.

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
Theorem poke_8bit_array'vc (addr : list (bv 8%N)) (left1 : bv 32%N) (flag : bool) (fact0 : 8%Z * Z.of_nat (length addr) < 4294967296%Z) (fact1 : bv_unsigned left1 < 8%Z * Z.of_nat (length addr)) : (¬ (8%bv : bv 32%N) = (0%bv : bv 32%N) ∨ ¬ 8%Z = 0%Z) ∧ (bv_unsigned (bv_divu left1 (8%bv : bv 32%N)) = ZEuclid.div (bv_unsigned left1) 8%Z -> (¬ (8%bv : bv 32%N) = (0%bv : bv 32%N) ∨ ¬ 8%Z = 0%Z) ∧ (bv_unsigned (bv_modu left1 (8%bv : bv 32%N)) = ZEuclid.modulo (bv_unsigned left1) 8%Z -> (let o1 : Z := bv_unsigned (bv_divu left1 (8%bv : bv 32%N)) in (0%Z ≤ o1 ∧ o1 < Z.of_nat (length addr)) ∧ bv_unsigned (bv_modu left1 (8%bv : bv 32%N)) < 8%Z ∧ (∀(o2 : bv 8%N), (∀(i : Z), 0%Z ≤ i ∧ i < 8%Z -> ¬ i = 7%Z - bv_unsigned (bv_modu left1 (8%bv : bv 32%N)) -> Z.testbit (bv_unsigned o2) i = Z.testbit (bv_unsigned (nth (Z.to_nat o1) addr inhabitant)) i) ∧ Z.testbit (bv_unsigned o2) (7%Z - bv_unsigned (bv_modu left1 (8%bv : bv 32%N))) = flag -> (let o3 : Z := bv_unsigned (bv_divu left1 (8%bv : bv 32%N)) in (0%Z ≤ o3 ∧ o3 < Z.of_nat (length addr)) ∧ (length (set_list addr (Z.to_nat o3) o2) = length addr -> nth_i (set_list addr (Z.to_nat o3) o2) = fun_updt (nth_i addr) o3 o2 -> (∀(i : Z), 0%Z ≤ i ∧ i < 8%Z * Z.of_nat (length (set_list addr (Z.to_nat o3) o2)) -> ¬ i = bv_unsigned left1 -> nth8_stream (set_list addr (Z.to_nat o3) o2) i = nth8_stream addr i) ∧ nth8_stream (set_list addr (Z.to_nat o3) o2) (bv_unsigned left1) = flag)))))).
Admitted.

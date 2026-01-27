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
Require Import Why3.map.Const.
Require Import Why3.map.MapEq.
Require Import multiprecision.lemmas.Lemmas.
Require Import Why3.mach.int.Unsigned.
Require Import Why3.mach.c.C.
Require Import multiprecision.types.Config.
Require Import multiprecision.types.Types.
Require Import multiprecision.types.Int32Eq.
Require Import multiprecision.types.UInt64Eq.
Require Import multiprecision.mpz.Z.
Require Import multiprecision.mpz.Zutil.
Open Scope Z_scope.
Theorem abs_cast'vc (x : bv 64%N) : (if decide (0%Z ≤ bv_signed x) then 0%Z ≤ bv_signed x else int'64_in_bounds (bv_signed x + 1%Z) ∧ (∀(o1 : bv 64%N), bv_signed o1 = bv_signed x + 1%Z -> int'64_in_bounds (- bv_signed o1) ∧ (∀(o2 : bv 64%N), bv_signed o2 = - bv_signed o1 -> 0%Z ≤ bv_signed o2 ∧ (∀(o3 : bv 64%N), bv_unsigned o3 = bv_signed o2 -> uint'64_in_bounds (bv_unsigned o3 + 1%Z))))) ∧ (∀(result : bv 64%N), (if decide (0%Z ≤ bv_signed x) then bv_unsigned result = bv_signed x else ∃(o1 : bv 64%N), bv_signed o1 = bv_signed x + 1%Z ∧ (∃(o2 : bv 64%N), bv_signed o2 = - bv_signed o1 ∧ (∃(o3 : bv 64%N), bv_unsigned o3 = bv_signed o2 ∧ bv_unsigned result = bv_unsigned o3 + 1%Z))) -> bv_unsigned result = Z.abs (bv_signed x)).
Admitted.

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
Require Import Why3.map.Const.
Require Import Why3.map.MapEq.
Require Import Why3.mach.int.Unsigned.
Require Import Why3.mach.c.C.
Require Import multiprecision.lemmas.Lemmas.
Require Import multiprecision.types.Config.
Require Import multiprecision.types.Types.
Require Import multiprecision.types.Int32Eq.
Require Import multiprecision.types.UInt64Eq.
Require Import multiprecision.util.Util.
Require Import multiprecision.ptralias.Alias.
Require Import multiprecision.util.UtilOld.
Require Import multiprecision.compare.Compare.
Require Import multiprecision.add.Add.
Require Import multiprecision.add.AddOld.
Require Import multiprecision.sub.Sub.
Require Import multiprecision.sub.SubOld.
Require Import multiprecision.mul.Mul.
Require Import multiprecision.mul.Mul_basecase.
Require Import multiprecision.toom.Toom.
Require Import multiprecision.valuation.Valuation.
Require Import multiprecision.add_1.Add_1.
Require Import multiprecision.sub_1.Sub_1.
Require Import multiprecision.logical.LogicalUtil.
Require Import multiprecision.logical.Logical.
Require Import multiprecision.mpz.Z.
Require Import multiprecision.mpz.Zutil.
Require Import multiprecision.mpz_getset.Set.
Open Scope Z_scope.
Theorem wmpz_mul_ui'vc (mpz : mpz_memo) (prod : mpz_ptr) (mult : mpz_ptr) (small_mult : bv 64%N) (fact0 : 1%Z ≤ alloc mpz prod) (fact1 : 1%Z ≤ alloc mpz mult) (fact2 : readers mpz prod = 0%Z) (fact3 : readers mpz mult = 0%Z) (fact4 : abs_size mpz mult + 1%Z ≤ 2147483647%Z) : - 2%Z < readers mpz mult ∧ (∀(sign_product : bv 32%N), bv_signed sign_product = sgn mpz mult * abs_size mpz mult -> (∀(o1 : bool), (bv_signed sign_product = bv_signed (0%bv : bv 32%N) -> o1 = true) ∧ (o1 = true -> sign_product = (0%bv : bv 32%N)) -> (∀(o2 : bool), (if decide (o1 = true) then o2 = true else (bv_unsigned small_mult = bv_unsigned (0%bv : bv 64%N) -> o2 = true) ∧ (o2 = true -> small_mult = (0%bv : bv 64%N))) -> (if decide (o2 = true) then (- 1%Z ≤ readers mpz prod ∧ readers mpz prod ≤ 0%Z) ∧ (∀(mpz1 : mpz_memo), alloc mpz1 = alloc mpz ∧ sgn mpz1 = sgn mpz ∧ readers mpz1 = readers mpz ∧ zones mpz1 = zones mpz -> (∀(y : mpz_ptr), ¬ y = prod -> mpz_unchanged y mpz1 mpz) ∧ abs_size mpz1 prod = 0%Z ∧ abs_value_of mpz1 prod = 0%Z -> value_of prod mpz1 = value_of mult mpz * bv_unsigned small_mult ∧ (∀(x : mpz_ptr), ¬ x = prod -> mpz_unchanged x mpz1 mpz) ∧ readers mpz1 prod = 0%Z ∧ readers mpz1 mult = 0%Z) else - 2147483648%Z < bv_signed sign_product ∧ (∀(o3 : bv 32%N), bv_signed o3 = Z.abs (bv_signed sign_product) -> int'32_in_bounds (bv_signed o3 + 1%Z) ∧ (∀(o4 : bv 32%N), bv_signed o4 = bv_signed o3 + 1%Z -> (readers mpz prod = 0%Z ∧ 1%Z ≤ alloc mpz prod) ∧ (∀(mpz1 : mpz_memo), sgn mpz1 = sgn mpz -> (∀(pp : C.ptr (bv 64%N)), (∀(y : mpz_ptr), ¬ y = prod -> mpz_unchanged y mpz1 mpz) ∧ readers mpz1 prod = - 1%Z ∧ abs_value_of mpz1 prod = value pp (abs_size mpz1 prod) ∧ zones mpz1 prod = zone1 pp ∧ offset pp = 0%Z ∧ plength pp = alloc mpz1 prod ∧ min pp = 0%Z ∧ C.max pp = plength pp ∧ writable pp = true ∧ abs_size mpz1 prod = abs_size mpz prod ∧ value pp (abs_size mpz prod) = abs_value_of mpz prod ∧ (if decide (alloc mpz prod < bv_signed o4) then alloc mpz1 prod = bv_signed o4 else alloc mpz1 prod = alloc mpz prod) -> mpz_eq prod mult = (prod = mult) -> (if decide (mpz_eq prod mult) then (valid pp (bv_signed o3) ∧ writable pp = true) ∧ (∀(pp1 : C.ptr (bv 64%N)), length (data pp1) = length (data pp) ∧ offset pp1 = offset pp ∧ min pp1 = min pp ∧ C.max pp1 = C.max pp ∧ writable pp1 = writable pp ∧ zone1 pp1 = zone1 pp -> (∀(cy : bv 64%N), value pp1 (bv_signed o3) + Z.pow (18446744073709551615%Z + 1%Z) (bv_signed o3) * bv_unsigned cy = value pp (bv_signed o3) * bv_unsigned small_mult ∧ (∀(j : Z), j < offset pp1 ∨ offset pp1 + bv_signed o3 ≤ j -> pelts pp1 j = pelts pp j) -> ((min pp1 ≤ offset pp1 + bv_signed o3 ∧ offset pp1 + bv_signed o3 < C.max pp1) ∧ writable pp1 = true) ∧ (∀(pp2 : C.ptr (bv 64%N)), length (data pp2) = length (data pp1) ∧ offset pp2 = offset pp1 ∧ min pp2 = min pp1 ∧ C.max pp2 = C.max pp1 ∧ writable pp2 = writable pp1 ∧ zone1 pp2 = zone1 pp1 -> pelts pp2 = fun_updt (pelts pp1) (offset pp2 + bv_signed o3) cy ∧ pelts pp2 (offset pp2 + bv_signed o3) = cy -> (∀(o5 : bool), (bv_unsigned cy = bv_unsigned (0%bv : bv 64%N) -> o5 = true) ∧ (o5 = true -> cy = (0%bv : bv 64%N)) -> (∀(o6 : bv 32%N), (if decide (¬ o5 = true) then o6 = (1%bv : bv 32%N) else o6 = (0%bv : bv 32%N)) -> int'32_in_bounds (bv_signed o3 + bv_signed o6) ∧ (∀(o7 : bv 32%N), bv_signed o7 = bv_signed o3 + bv_signed o6 -> (bv_signed sign_product < 0%Z -> int'32_in_bounds (- bv_signed o7)) ∧ (∀(o8 : bv 32%N), (if decide (bv_signed sign_product < 0%Z) then bv_signed o8 = - bv_signed o7 else o8 = o7) -> (zones mpz1 prod = zone1 pp2 ∧ readers mpz1 prod = - 1%Z ∧ offset pp2 = 0%Z ∧ min pp2 = 0%Z ∧ C.max pp2 = plength pp2 ∧ Z.abs (bv_signed o8) ≤ plength pp2 ∧ plength pp2 = alloc mpz1 prod ∧ (¬ bv_signed o8 = 0%Z -> Z.pow (18446744073709551615%Z + 1%Z) (Z.abs (bv_signed o8) - 1%Z) ≤ value pp2 (Z.abs (bv_signed o8)))) ∧ (∀(mpz2 : mpz_memo), alloc mpz2 = alloc mpz1 ∧ readers mpz2 = readers mpz1 ∧ zones mpz2 = zones mpz1 -> (∀(y : mpz_ptr), ¬ y = prod -> mpz_unchanged y mpz2 mpz1) ∧ (sgn mpz2 prod = 1%Z) = (0%Z ≤ bv_signed o8) ∧ (sgn mpz2 prod = - 1%Z) = (bv_signed o8 < 0%Z) ∧ abs_size mpz2 prod = Z.abs (bv_signed o8) ∧ abs_value_of mpz2 prod = value pp2 (Z.abs (bv_signed o8)) -> (zones mpz2 prod = zone1 pp2 ∧ readers mpz2 prod = - 1%Z ∧ min pp2 = 0%Z ∧ C.max pp2 = plength pp2 ∧ abs_value_of mpz2 prod = value pp2 (abs_size mpz2 prod)) ∧ (∀(mpz3 : mpz_memo), abs_value_of mpz3 = abs_value_of mpz2 ∧ alloc mpz3 = alloc mpz2 ∧ abs_size mpz3 = abs_size mpz2 ∧ sgn mpz3 = sgn mpz2 ∧ zones mpz3 = zones mpz2 -> readers mpz3 prod = 0%Z ∧ (∀(y : mpz_ptr), ¬ y = prod -> readers mpz3 y = readers mpz2 y) -> value_of prod mpz3 = value_of mult mpz * bv_unsigned small_mult ∧ (∀(x : mpz_ptr), ¬ x = prod -> mpz_unchanged x mpz3 mpz) ∧ readers mpz3 prod = 0%Z ∧ readers mpz3 mult = 0%Z))))))))) else mpz_unchanged mult mpz1 mpz ∧ (readers mpz1 mult = readers mpz mult ∧ (- 2%Z < readers mpz1 mult -> abs_value_of mpz1 mult = abs_value_of mpz mult ∧ alloc mpz1 mult = alloc mpz mult ∧ abs_size mpz1 mult = abs_size mpz mult ∧ sgn mpz1 mult = sgn mpz mult ∧ readers mpz1 mult = readers mpz mult ∧ zones mpz1 mult = zones mpz mult) -> 0%Z ≤ readers mpz1 mult ∧ (∀(mpz2 : mpz_memo), abs_value_of mpz2 = abs_value_of mpz1 ∧ alloc mpz2 = alloc mpz1 ∧ abs_size mpz2 = abs_size mpz1 ∧ sgn mpz2 = sgn mpz1 ∧ zones mpz2 = zones mpz1 -> (∀(mp : C.ptr (bv 64%N)), readers mpz2 mult = readers mpz1 mult + 1%Z ∧ (∀(y : mpz_ptr), ¬ mult = y -> readers mpz2 y = readers mpz1 y) ∧ value mp (abs_size mpz2 mult) = abs_value_of mpz2 mult ∧ plength mp = alloc mpz2 mult ∧ offset mp = 0%Z ∧ min mp = 0%Z ∧ C.max mp = plength mp ∧ zone1 mp = zones mpz2 mult -> (valid mp (bv_signed o3) ∧ valid pp (bv_signed o3) ∧ writable pp = true) ∧ (∀(pp1 : C.ptr (bv 64%N)), length (data pp1) = length (data pp) ∧ offset pp1 = offset pp ∧ min pp1 = min pp ∧ C.max pp1 = C.max pp ∧ writable pp1 = writable pp ∧ zone1 pp1 = zone1 pp -> (∀(cy : bv 64%N), value pp1 (bv_signed o3) + Z.pow (18446744073709551615%Z + 1%Z) (bv_signed o3) * bv_unsigned cy = value mp (bv_signed o3) * bv_unsigned small_mult ∧ (∀(j : Z), j < offset pp1 ∨ offset pp1 + bv_signed o3 ≤ j -> pelts pp1 j = pelts pp j) -> (zones mpz2 mult = zone1 mp ∧ 1%Z ≤ readers mpz2 mult ∧ min mp = 0%Z ∧ C.max mp = plength mp) ∧ (∀(mpz3 : mpz_memo), abs_value_of mpz3 = abs_value_of mpz2 ∧ alloc mpz3 = alloc mpz2 ∧ abs_size mpz3 = abs_size mpz2 ∧ sgn mpz3 = sgn mpz2 ∧ zones mpz3 = zones mpz2 -> readers mpz3 mult = readers mpz2 mult - 1%Z ∧ (∀(y : mpz_ptr), ¬ y = mult -> readers mpz3 y = readers mpz2 y) -> ((min pp1 ≤ offset pp1 + bv_signed o3 ∧ offset pp1 + bv_signed o3 < C.max pp1) ∧ writable pp1 = true) ∧ (∀(pp2 : C.ptr (bv 64%N)), length (data pp2) = length (data pp1) ∧ offset pp2 = offset pp1 ∧ min pp2 = min pp1 ∧ C.max pp2 = C.max pp1 ∧ writable pp2 = writable pp1 ∧ zone1 pp2 = zone1 pp1 -> pelts pp2 = fun_updt (pelts pp1) (offset pp2 + bv_signed o3) cy ∧ pelts pp2 (offset pp2 + bv_signed o3) = cy -> (∀(o5 : bool), (bv_unsigned cy = bv_unsigned (0%bv : bv 64%N) -> o5 = true) ∧ (o5 = true -> cy = (0%bv : bv 64%N)) -> (∀(o6 : bv 32%N), (if decide (¬ o5 = true) then o6 = (1%bv : bv 32%N) else o6 = (0%bv : bv 32%N)) -> int'32_in_bounds (bv_signed o3 + bv_signed o6) ∧ (∀(o7 : bv 32%N), bv_signed o7 = bv_signed o3 + bv_signed o6 -> (bv_signed sign_product < 0%Z -> int'32_in_bounds (- bv_signed o7)) ∧ (∀(o8 : bv 32%N), (if decide (bv_signed sign_product < 0%Z) then bv_signed o8 = - bv_signed o7 else o8 = o7) -> (zones mpz3 prod = zone1 pp2 ∧ readers mpz3 prod = - 1%Z ∧ offset pp2 = 0%Z ∧ min pp2 = 0%Z ∧ C.max pp2 = plength pp2 ∧ Z.abs (bv_signed o8) ≤ plength pp2 ∧ plength pp2 = alloc mpz3 prod ∧ (¬ bv_signed o8 = 0%Z -> Z.pow (18446744073709551615%Z + 1%Z) (Z.abs (bv_signed o8) - 1%Z) ≤ value pp2 (Z.abs (bv_signed o8)))) ∧ (∀(mpz4 : mpz_memo), alloc mpz4 = alloc mpz3 ∧ readers mpz4 = readers mpz3 ∧ zones mpz4 = zones mpz3 -> (∀(y : mpz_ptr), ¬ y = prod -> mpz_unchanged y mpz4 mpz3) ∧ (sgn mpz4 prod = 1%Z) = (0%Z ≤ bv_signed o8) ∧ (sgn mpz4 prod = - 1%Z) = (bv_signed o8 < 0%Z) ∧ abs_size mpz4 prod = Z.abs (bv_signed o8) ∧ abs_value_of mpz4 prod = value pp2 (Z.abs (bv_signed o8)) -> (zones mpz4 prod = zone1 pp2 ∧ readers mpz4 prod = - 1%Z ∧ min pp2 = 0%Z ∧ C.max pp2 = plength pp2 ∧ abs_value_of mpz4 prod = value pp2 (abs_size mpz4 prod)) ∧ (∀(mpz5 : mpz_memo), abs_value_of mpz5 = abs_value_of mpz4 ∧ alloc mpz5 = alloc mpz4 ∧ abs_size mpz5 = abs_size mpz4 ∧ sgn mpz5 = sgn mpz4 ∧ zones mpz5 = zones mpz4 -> readers mpz5 prod = 0%Z ∧ (∀(y : mpz_ptr), ¬ y = prod -> readers mpz5 y = readers mpz4 y) -> value_of prod mpz5 = value_of mult mpz * bv_unsigned small_mult ∧ (∀(x : mpz_ptr), ¬ x = prod -> mpz_unchanged x mpz5 mpz) ∧ readers mpz5 prod = 0%Z ∧ readers mpz5 mult = 0%Z)))))))))))))))))))))).
Proof.
Admitted.

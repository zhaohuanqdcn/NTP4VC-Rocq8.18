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
Require Import Why3.mach.int.Unsigned.
Require Import Why3.mach.c.C.
Require Import multiprecision.types.Config.
Require Import multiprecision.types.Types.
Require Import multiprecision.types.Int32Eq.
Require Import multiprecision.types.UInt64Eq.
Require Import multiprecision.lemmas.Lemmas.
Require Import multiprecision.util.Util.
Require Import multiprecision.ptralias.Alias.
Require Import multiprecision.add.Add.
Open Scope Z_scope.
Theorem wmpn_addmul_n'vc (sz : bv 32%N) (x : ptr (bv 64%N)) (y : ptr (bv 64%N)) (r : ptr (bv 64%N)) (fact0 : 0%Z < bv_signed sz) (fact1 : valid x (bv_signed sz)) (fact2 : valid y (bv_signed sz)) (fact3 : valid r (bv_signed sz + bv_signed sz)) (fact4 : writable r = true) : min r ≤ offset r + 0%Z ∧ offset r + 0%Z ≤ C.max r ∧ (∀(o1 : ptr (bv 64%N)), offset o1 = offset r + 0%Z ∧ plength o1 = plength r ∧ pelts o1 = pelts r ∧ data o1 = data r ∧ min o1 = min r ∧ C.max o1 = C.max r ∧ zone1 o1 = zone1 r ∧ writable o1 = writable r -> (min y ≤ offset y + 0%Z ∧ offset y + 0%Z ≤ C.max y) ∧ (∀(o2 : ptr (bv 64%N)), offset o2 = offset y + 0%Z ∧ plength o2 = plength y ∧ pelts o2 = pelts y ∧ data o2 = data y ∧ min o2 = min y ∧ C.max o2 = C.max y ∧ zone1 o2 = zone1 y ∧ writable o2 = writable y -> ((0%Z ≤ 0%Z ∧ 0%Z ≤ bv_signed sz) ∧ 0%Z = bv_signed sz - bv_signed sz ∧ value r (0%Z + bv_signed sz) + Z.pow (18446744073709551615%Z + 1%Z) (0%Z + bv_signed sz) * 0%Z = value r (0%Z + bv_signed sz) + value x (bv_signed sz) * value y 0%Z ∧ offset o1 = offset r + 0%Z ∧ min o1 = min r ∧ C.max o1 = C.max r ∧ writable o1 = true ∧ pelts o1 = pelts r ∧ plength o1 = plength r ∧ offset o2 = offset y + 0%Z ∧ plength o2 = plength y ∧ min o2 = min y ∧ C.max o2 = C.max y ∧ pelts o2 = pelts y ∧ 0%Z ≤ 0%Z ∧ 0%Z ≤ 1%Z) ∧ (∀(i : bv 32%N) (vn : bv 32%N) (c : bv 64%N) (vp : ptr (bv 64%N)) (rp : ptr (bv 64%N)) (r1 : ptr (bv 64%N)), length (data r1) = length (data r) ∧ offset r1 = offset r ∧ min r1 = min r ∧ C.max r1 = C.max r ∧ writable r1 = writable r ∧ zone1 r1 = zone1 r -> (0%Z ≤ bv_signed i ∧ bv_signed i ≤ bv_signed sz) ∧ bv_signed i = bv_signed sz - bv_signed vn ∧ value r1 (bv_signed i + bv_signed sz) + Z.pow (18446744073709551615%Z + 1%Z) (bv_signed i + bv_signed sz) * bv_unsigned c = value r (bv_signed i + bv_signed sz) + value x (bv_signed sz) * value y (bv_signed i) ∧ offset rp = offset r1 + bv_signed i ∧ min rp = min r1 ∧ C.max rp = C.max r1 ∧ writable rp = true ∧ pelts rp = pelts r1 ∧ plength rp = plength r1 ∧ offset vp = offset y + bv_signed i ∧ plength vp = plength y ∧ min vp = min y ∧ C.max vp = C.max y ∧ pelts vp = pelts y ∧ (0%Z ≤ bv_unsigned c ∧ bv_unsigned c ≤ 1%Z) ∧ (∀(j : Z), offset rp + bv_signed sz ≤ j -> pelts r j = pelts r1 j) -> (∀(o3 : bool), (bv_signed vn = bv_signed (0%bv : bv 32%N) -> o3 = true) ∧ (o3 = true -> vn = (0%bv : bv 32%N)) -> (if decide (¬ o3 = true) then (min vp ≤ offset vp ∧ offset vp < C.max vp) ∧ (valid x (bv_signed sz) ∧ valid rp (bv_signed sz) ∧ writable rp = true) ∧ (∀(rp1 : ptr (bv 64%N)) (r2 : ptr (bv 64%N)), data rp1 = data r2 ∧ length (data r2) = length (data rp) ∧ offset rp1 = offset rp ∧ min rp1 = min rp ∧ C.max rp1 = C.max rp ∧ writable rp1 = writable rp ∧ zone1 rp1 = zone1 rp -> data rp1 = data r2 ∧ length (data r2) = length (data rp) ∧ offset rp1 = offset rp ∧ min rp1 = min rp ∧ C.max rp1 = C.max rp ∧ writable rp1 = writable rp ∧ zone1 rp1 = zone1 rp -> length (data r2) = length (data r1) ∧ offset r2 = offset r1 ∧ min r2 = min r1 ∧ C.max r2 = C.max r1 ∧ writable r2 = writable r1 ∧ zone1 r2 = zone1 r1 -> (∀(c' : bv 64%N), value rp1 (bv_signed sz) + Z.pow (18446744073709551615%Z + 1%Z) (bv_signed sz) * bv_unsigned c' = value rp (bv_signed sz) + value x (bv_signed sz) * bv_unsigned (pelts vp (offset vp)) ∧ (∀(j : Z), j < offset rp1 ∨ offset rp1 + bv_signed sz ≤ j -> pelts rp1 j = pelts rp j) -> (min rp1 ≤ offset rp1 + bv_signed sz ∧ offset rp1 + bv_signed sz < C.max rp1) ∧ (0%Z ≤ bv_unsigned c ∧ bv_unsigned c ≤ 1%Z) ∧ (∀(res : bv 64%N) (carry : bv 64%N), bv_unsigned res + (18446744073709551615%Z + 1%Z) * bv_unsigned carry = bv_unsigned c' + bv_unsigned (pelts rp1 (offset rp1 + bv_signed sz)) + bv_unsigned c ∧ 0%Z ≤ bv_unsigned carry ∧ bv_unsigned carry ≤ 1%Z -> ((min rp1 ≤ offset rp1 + bv_signed sz ∧ offset rp1 + bv_signed sz < C.max rp1) ∧ writable rp1 = true) ∧ (∀(rp2 : ptr (bv 64%N)) (r3 : ptr (bv 64%N)), data rp2 = data r3 ∧ length (data r3) = length (data rp1) ∧ offset rp2 = offset rp1 ∧ min rp2 = min rp1 ∧ C.max rp2 = C.max rp1 ∧ writable rp2 = writable rp1 ∧ zone1 rp2 = zone1 rp1 -> data rp2 = data r3 ∧ length (data r3) = length (data rp1) ∧ offset rp2 = offset rp1 ∧ min rp2 = min rp1 ∧ C.max rp2 = C.max rp1 ∧ writable rp2 = writable rp1 ∧ zone1 rp2 = zone1 rp1 -> length (data r3) = length (data r2) ∧ offset r3 = offset r2 ∧ min r3 = min r2 ∧ C.max r3 = C.max r2 ∧ writable r3 = writable r2 ∧ zone1 r3 = zone1 r2 -> pelts rp2 = fun_updt (pelts rp1) (offset rp2 + bv_signed sz) res ∧ pelts rp2 (offset rp2 + bv_signed sz) = res -> int'32_in_bounds (bv_signed i + 1%Z) ∧ (∀(o4 : bv 32%N), bv_signed o4 = bv_signed i + 1%Z -> (min rp2 ≤ offset rp2 + 1%Z ∧ offset rp2 + 1%Z ≤ C.max rp2) ∧ (∀(o5 : ptr (bv 64%N)), offset o5 = offset rp2 + 1%Z ∧ plength o5 = plength rp2 ∧ pelts o5 = pelts rp2 ∧ data o5 = data rp2 ∧ min o5 = min rp2 ∧ C.max o5 = C.max rp2 ∧ zone1 o5 = zone1 rp2 ∧ writable o5 = writable rp2 -> (min vp ≤ offset vp + 1%Z ∧ offset vp + 1%Z ≤ C.max vp) ∧ (∀(o6 : ptr (bv 64%N)), offset o6 = offset vp + 1%Z ∧ plength o6 = plength vp ∧ pelts o6 = pelts vp ∧ data o6 = data vp ∧ min o6 = min vp ∧ C.max o6 = C.max vp ∧ zone1 o6 = zone1 vp ∧ writable o6 = writable vp -> int'32_in_bounds (bv_signed vn - 1%Z) ∧ (∀(o7 : bv 32%N), bv_signed o7 = bv_signed vn - 1%Z -> (0%Z ≤ bv_signed sz - bv_signed i ∧ bv_signed sz - bv_signed o4 < bv_signed sz - bv_signed i) ∧ (0%Z ≤ bv_signed o4 ∧ bv_signed o4 ≤ bv_signed sz) ∧ bv_signed o4 = bv_signed sz - bv_signed o7 ∧ value r3 (bv_signed o4 + bv_signed sz) + Z.pow (18446744073709551615%Z + 1%Z) (bv_signed o4 + bv_signed sz) * bv_unsigned carry = value r (bv_signed o4 + bv_signed sz) + value x (bv_signed sz) * value y (bv_signed o4) ∧ offset o5 = offset r3 + bv_signed o4 ∧ min o5 = min r3 ∧ C.max o5 = C.max r3 ∧ writable o5 = true ∧ pelts o5 = pelts r3 ∧ plength o5 = plength r3 ∧ offset o6 = offset y + bv_signed o4 ∧ plength o6 = plength y ∧ min o6 = min y ∧ C.max o6 = C.max y ∧ pelts o6 = pelts y ∧ (0%Z ≤ bv_unsigned carry ∧ bv_unsigned carry ≤ 1%Z) ∧ (∀(j : Z), offset o5 + bv_signed sz ≤ j -> pelts r j = pelts r3 j))))))))) else value r1 (bv_signed sz + bv_signed sz) + Z.pow (18446744073709551615%Z + 1%Z) (bv_signed sz + bv_signed sz) * bv_unsigned c = value r (bv_signed sz + bv_signed sz) + value x (bv_signed sz) * value y (bv_signed sz)))))).
Admitted.

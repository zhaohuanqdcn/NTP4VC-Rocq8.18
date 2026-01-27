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
Require Import Why3.mach.c.C.
Require Import Why3.mach.int.Unsigned.
Require Import multiprecision.valuation.Valuation.
Require Import multiprecision.types.Config.
Require Import multiprecision.types.Types.
Require Import multiprecision.types.Int32Eq.
Require Import multiprecision.types.UInt64Eq.
Require Import multiprecision.lemmas.Lemmas.
Require Import multiprecision.compare.Compare.
Require Import multiprecision.util.Util.
Require Import multiprecision.ptralias.Alias.
Require Import multiprecision.util.UtilOld.
Require Import multiprecision.add_1.Add_1.
Require Import multiprecision.add.Add.
Require Import multiprecision.add.AddOld.
Require Import multiprecision.sub_1.Sub_1.
Require Import multiprecision.sub.SubOld.
Require Import multiprecision.mul.Mul.
Require Import multiprecision.mul.Mul_basecase.
Require Import multiprecision.logical.LogicalUtil.
Require Import multiprecision.logical.Logical.
Open Scope Z_scope.
Theorem wmpn_mul_n'vc (sz : bv 32%N) (x : ptr (bv 64%N)) (y : ptr (bv 64%N)) (r : ptr (bv 64%N)) (k : Z) (fact0 : 0%Z < bv_signed sz) (fact1 : valid x (bv_signed sz)) (fact2 : valid y (bv_signed sz)) (fact3 : valid r (bv_signed sz + bv_signed sz)) (fact4 : writable r = true) (fact5 : 8%Z * bv_signed sz < 2147483647%Z) (fact6 : bv_signed sz ≤ bv_signed (29%bv : bv 32%N) * Z.pow 2%Z k) (fact7 : 0%Z ≤ k) (fact8 : k ≤ 64%Z) : if decide (bv_signed sz ≤ bv_signed (29%bv : bv 32%N)) then ((0%Z < bv_signed sz ∧ bv_signed sz ≤ bv_signed sz) ∧ valid x (bv_signed sz) ∧ valid y (bv_signed sz) ∧ valid r (bv_signed sz + bv_signed sz) ∧ writable r = true) ∧ (∀(r1 : ptr (bv 64%N)), length (data r1) = length (data r) ∧ offset r1 = offset r ∧ min r1 = min r ∧ C.max r1 = C.max r ∧ writable r1 = writable r ∧ zone1 r1 = zone1 r -> value r1 (bv_signed sz + bv_signed sz) = value x (bv_signed sz) * value y (bv_signed sz) ∧ (∀(j : Z), j < offset r1 ∨ offset r1 + (bv_signed sz + bv_signed sz) ≤ j -> pelts r1 j = pelts r j) -> value r1 (bv_signed sz + bv_signed sz) = value x (bv_signed sz) * value y (bv_signed sz) ∧ min r1 = min r ∧ C.max r1 = C.max r ∧ plength r1 = plength r ∧ (∀(j : Z), min r1 ≤ j ∧ j < offset r1 ∨ offset r1 + bv_signed sz + bv_signed sz ≤ j ∧ j < C.max r1 -> pelts r1 j = pelts r j)) else int'32_in_bounds (bv_signed sz + 64%Z) ∧ (∀(o1 : bv 32%N), bv_signed o1 = bv_signed sz + 64%Z -> int'32_in_bounds (2%Z * bv_signed o1) ∧ (∀(o2 : bv 32%N), bv_signed o2 = 2%Z * bv_signed o1 -> 0%Z ≤ bv_signed o2 ∧ (∀(o3 : bv 32%N), bv_unsigned o3 = bv_signed o2 -> 0%Z ≤ bv_unsigned o3 ∧ (∀(ws : ptr (bv 64%N)), plength ws = bv_unsigned o3 ∧ offset ws = 0%Z ∧ min ws = 0%Z ∧ C.max ws = bv_unsigned o3 ∧ writable ws = true -> (valid x (bv_signed sz) ∧ valid y (bv_signed sz) ∧ valid r (bv_signed sz + bv_signed sz) ∧ bv_signed (29%bv : bv 32%N) < bv_signed sz ∧ (0%Z < 64%Z ∧ 64%Z ≤ 64%Z) ∧ bv_signed sz ≤ bv_signed (29%bv : bv 32%N) * Z.pow 2%Z 64%Z ∧ valid ws (2%Z * (bv_signed sz + 64%Z)) ∧ (writable r = true ∧ writable ws = true) ∧ 8%Z * bv_signed sz < 2147483647%Z ∧ (2%Z < bv_signed sz ∧ bv_signed sz ≤ bv_signed sz ∧ bv_signed sz < bv_signed sz + bv_signed sz - 1%Z) ∧ 4%Z * bv_signed sz < 5%Z * bv_signed sz) ∧ (∀(ws1 : ptr (bv 64%N)) (r1 : ptr (bv 64%N)), offset ws1 = offset ws ∧ writable ws1 = writable ws ∧ zone1 ws1 = zone1 ws -> offset r1 = offset r ∧ writable r1 = writable r ∧ zone1 r1 = zone1 r -> min r1 = min r ∧ C.max r1 = C.max r ∧ plength r1 = plength r ∧ min ws1 = min ws ∧ C.max ws1 = C.max ws ∧ plength ws1 = plength ws ∧ value r1 (bv_signed sz + bv_signed sz) = value x (bv_signed sz) * value y (bv_signed sz) ∧ (∀(j : Z), min r1 ≤ j ∧ j < offset r1 ∨ offset r1 + bv_signed sz + bv_signed sz ≤ j ∧ j < C.max r1 -> pelts r1 j = pelts r j) ∧ (∀(j : Z), min ws1 ≤ j ∧ j < offset ws1 -> pelts ws1 j = pelts ws j) -> value r1 (bv_signed sz + bv_signed sz) = value x (bv_signed sz) * value y (bv_signed sz) ∧ min r1 = min r ∧ C.max r1 = C.max r ∧ plength r1 = plength r ∧ (∀(j : Z), min r1 ≤ j ∧ j < offset r1 ∨ offset r1 + bv_signed sz + bv_signed sz ≤ j ∧ j < C.max r1 -> pelts r1 j = pelts r j)))))).
Admitted.

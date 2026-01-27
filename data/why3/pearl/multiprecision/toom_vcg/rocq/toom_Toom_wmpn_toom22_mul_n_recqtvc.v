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
Theorem wmpn_toom22_mul_n_rec'vc (x : ptr (bv 64%N)) (sz : bv 32%N) (y : ptr (bv 64%N)) (r : ptr (bv 64%N)) (scratch : ptr (bv 64%N)) (k : Z) (fact0 : valid x (bv_signed sz)) (fact1 : valid y (bv_signed sz)) (fact2 : valid r (bv_signed sz + bv_signed sz)) (fact3 : writable r = true) (fact4 : writable scratch = true) (fact5 : 0%Z < bv_signed sz) (fact6 : 8%Z * bv_signed sz < 2147483647%Z) (fact7 : 0%Z ≤ k) (fact8 : k ≤ 64%Z) (fact9 : bv_signed sz ≤ bv_signed (29%bv : bv 32%N) * Z.pow 2%Z k) (fact10 : valid scratch (2%Z * (bv_signed sz + k))) : if decide (bv_signed sz ≤ bv_signed (29%bv : bv 32%N)) then ((0%Z < bv_signed sz ∧ bv_signed sz ≤ bv_signed sz) ∧ valid x (bv_signed sz) ∧ valid y (bv_signed sz) ∧ valid r (bv_signed sz + bv_signed sz) ∧ writable r = true) ∧ (∀(r1 : ptr (bv 64%N)), length (data r1) = length (data r) ∧ offset r1 = offset r ∧ min r1 = min r ∧ C.max r1 = C.max r ∧ writable r1 = writable r ∧ zone1 r1 = zone1 r -> value r1 (bv_signed sz + bv_signed sz) = value x (bv_signed sz) * value y (bv_signed sz) ∧ (∀(j : Z), j < offset r1 ∨ offset r1 + (bv_signed sz + bv_signed sz) ≤ j -> pelts r1 j = pelts r j) -> value r1 (bv_signed sz + bv_signed sz) = value x (bv_signed sz) * value y (bv_signed sz) ∧ (∀(j : Z), min r1 ≤ j ∧ j < offset r1 ∨ offset r1 + bv_signed sz + bv_signed sz ≤ j ∧ j < C.max r1 -> pelts r1 j = pelts r j) ∧ min r1 = min r ∧ C.max r1 = C.max r ∧ plength r1 = plength r) else ((0%Z ≤ k + k + 1%Z ∧ k + k < k + k + 1%Z) ∧ valid x (bv_signed sz) ∧ valid y (bv_signed sz) ∧ valid r (bv_signed sz + bv_signed sz) ∧ bv_signed (29%bv : bv 32%N) < bv_signed sz ∧ (0%Z < k ∧ k ≤ 64%Z) ∧ bv_signed sz ≤ bv_signed (29%bv : bv 32%N) * Z.pow 2%Z k ∧ valid scratch (2%Z * (bv_signed sz + k)) ∧ (writable r = true ∧ writable scratch = true) ∧ 8%Z * bv_signed sz < 2147483647%Z ∧ (2%Z < bv_signed sz ∧ bv_signed sz ≤ bv_signed sz ∧ bv_signed sz < bv_signed sz + bv_signed sz - 1%Z) ∧ 4%Z * bv_signed sz < 5%Z * bv_signed sz) ∧ (∀(scratch1 : ptr (bv 64%N)) (r1 : ptr (bv 64%N)), offset scratch1 = offset scratch ∧ writable scratch1 = writable scratch ∧ zone1 scratch1 = zone1 scratch -> offset r1 = offset r ∧ writable r1 = writable r ∧ zone1 r1 = zone1 r -> min r1 = min r ∧ C.max r1 = C.max r ∧ plength r1 = plength r ∧ min scratch1 = min scratch ∧ C.max scratch1 = C.max scratch ∧ plength scratch1 = plength scratch ∧ value r1 (bv_signed sz + bv_signed sz) = value x (bv_signed sz) * value y (bv_signed sz) ∧ (∀(j : Z), min r1 ≤ j ∧ j < offset r1 ∨ offset r1 + bv_signed sz + bv_signed sz ≤ j ∧ j < C.max r1 -> pelts r1 j = pelts r j) ∧ (∀(j : Z), min scratch1 ≤ j ∧ j < offset scratch1 -> pelts scratch1 j = pelts scratch j) -> value r1 (bv_signed sz + bv_signed sz) = value x (bv_signed sz) * value y (bv_signed sz) ∧ (∀(j : Z), min r1 ≤ j ∧ j < offset r1 ∨ offset r1 + bv_signed sz + bv_signed sz ≤ j ∧ j < C.max r1 -> pelts r1 j = pelts r j) ∧ (∀(j : Z), min scratch1 ≤ j ∧ j < offset scratch1 -> pelts scratch1 j = pelts scratch j) ∧ min r1 = min r ∧ C.max r1 = C.max r ∧ plength r1 = plength r ∧ min scratch1 = min scratch ∧ C.max scratch1 = C.max scratch ∧ plength scratch1 = plength scratch).
Admitted.

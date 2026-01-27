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
Theorem wmpn_addmul_2'vc (sz : bv 32%N) (x : ptr (bv 64%N)) (y : ptr (bv 64%N)) (r : ptr (bv 64%N)) (fact0 : 0%Z < bv_signed sz) (fact1 : valid x (bv_signed sz)) (fact2 : valid y 2%Z) (fact3 : valid r (bv_signed sz + 2%Z)) (fact4 : writable r = true) : min y ≤ offset y ∧ offset y < C.max y ∧ valid x (bv_signed sz) ∧ valid r (bv_signed sz) ∧ writable r = true ∧ (∀(r1 : ptr (bv 64%N)), length (data r1) = length (data r) ∧ offset r1 = offset r ∧ min r1 = min r ∧ C.max r1 = C.max r ∧ writable r1 = writable r ∧ zone1 r1 = zone1 r -> (∀(rn : bv 64%N), value r1 (bv_signed sz) + Z.pow (18446744073709551615%Z + 1%Z) (bv_signed sz) * bv_unsigned rn = value r (bv_signed sz) + value x (bv_signed sz) * bv_unsigned (pelts y (offset y)) ∧ (∀(j : Z), j < offset r1 ∨ offset r1 + bv_signed sz ≤ j -> pelts r1 j = pelts r j) -> ((min r1 ≤ offset r1 + bv_signed sz ∧ offset r1 + bv_signed sz < C.max r1) ∧ writable r1 = true) ∧ (∀(r2 : ptr (bv 64%N)), length (data r2) = length (data r1) ∧ offset r2 = offset r1 ∧ min r2 = min r1 ∧ C.max r2 = C.max r1 ∧ writable r2 = writable r1 ∧ zone1 r2 = zone1 r1 -> pelts r2 = fun_updt (pelts r1) (offset r2 + bv_signed sz) rn ∧ pelts r2 (offset r2 + bv_signed sz) = rn -> (min r2 ≤ offset r2 + 1%Z ∧ offset r2 + 1%Z ≤ C.max r2) ∧ (∀(r11 : ptr (bv 64%N)), offset r11 = offset r2 + 1%Z ∧ plength r11 = plength r2 ∧ pelts r11 = pelts r2 ∧ data r11 = data r2 ∧ min r11 = min r2 ∧ C.max r11 = C.max r2 ∧ zone1 r11 = zone1 r2 ∧ writable r11 = writable r2 -> (min y ≤ offset y + 1%Z ∧ offset y + 1%Z < C.max y) ∧ (valid x (bv_signed sz) ∧ valid r11 (bv_signed sz) ∧ writable r11 = true) ∧ (∀(r12 : ptr (bv 64%N)) (r3 : ptr (bv 64%N)), data r12 = data r3 ∧ length (data r3) = length (data r11) ∧ offset r12 = offset r11 ∧ min r12 = min r11 ∧ C.max r12 = C.max r11 ∧ writable r12 = writable r11 ∧ zone1 r12 = zone1 r11 -> length (data r3) = length (data r2) ∧ offset r3 = offset r2 ∧ min r3 = min r2 ∧ C.max r3 = C.max r2 ∧ writable r3 = writable r2 ∧ zone1 r3 = zone1 r2 -> (∀(c : bv 64%N), value r12 (bv_signed sz) + Z.pow (18446744073709551615%Z + 1%Z) (bv_signed sz) * bv_unsigned c = value r11 (bv_signed sz) + value x (bv_signed sz) * bv_unsigned (pelts y (offset y + 1%Z)) ∧ (∀(j : Z), j < offset r12 ∨ offset r12 + bv_signed sz ≤ j -> pelts r12 j = pelts r11 j) -> value r3 (bv_signed sz + 1%Z) + Z.pow (18446744073709551615%Z + 1%Z) (bv_signed sz + 1%Z) * bv_unsigned c = value r (bv_signed sz) + value x (bv_signed sz) * value y 2%Z ∧ (∀(j : Z), j < offset r3 ∨ offset r3 + bv_signed sz + 1%Z ≤ j -> pelts r3 j = pelts r j))))))).
Admitted.

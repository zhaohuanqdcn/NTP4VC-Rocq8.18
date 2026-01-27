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
Theorem wmpn_mul_1_in_place'vc (x : ptr (bv 64%N)) (sz : bv 32%N) (y : bv 64%N) (fact0 : valid x (bv_signed sz)) (fact1 : writable x = true) : min x ≤ offset x + 0%Z ∧ offset x + 0%Z ≤ C.max x ∧ (∀(o1 : ptr (bv 64%N)), offset o1 = offset x + 0%Z ∧ plength o1 = plength x ∧ pelts o1 = pelts x ∧ data o1 = data x ∧ min o1 = min x ∧ C.max o1 = C.max x ∧ zone1 o1 = zone1 x ∧ writable o1 = writable x -> ((0%Z ≤ bv_signed sz ∧ bv_signed sz ≤ bv_signed sz) ∧ 0%Z = bv_signed sz - bv_signed sz ∧ value x 0%Z + Z.pow (18446744073709551615%Z + 1%Z) 0%Z * 0%Z = value x 0%Z * bv_unsigned y ∧ offset o1 = offset x + 0%Z ∧ plength o1 = plength x ∧ min o1 = min x ∧ C.max o1 = C.max x ∧ pelts o1 = pelts x ∧ writable o1 = true) ∧ (∀(i : bv 32%N) (up : ptr (bv 64%N)) (n : bv 32%N) (cl : bv 64%N) (x1 : ptr (bv 64%N)), length (data x1) = length (data x) ∧ offset x1 = offset x ∧ min x1 = min x ∧ C.max x1 = C.max x ∧ writable x1 = writable x ∧ zone1 x1 = zone1 x -> (0%Z ≤ bv_signed n ∧ bv_signed n ≤ bv_signed sz) ∧ bv_signed i = bv_signed sz - bv_signed n ∧ value x1 (bv_signed i) + Z.pow (18446744073709551615%Z + 1%Z) (bv_signed i) * bv_unsigned cl = value x (bv_signed i) * bv_unsigned y ∧ offset up = offset x1 + bv_signed i ∧ plength up = plength x1 ∧ min up = min x1 ∧ C.max up = C.max x1 ∧ pelts up = pelts x1 ∧ writable up = true ∧ (∀(j : Z), j < offset x1 ∨ offset x1 + bv_signed i ≤ j -> pelts x1 j = pelts x j) -> (∀(o2 : bool), (bv_signed n = bv_signed (0%bv : bv 32%N) -> o2 = true) ∧ (o2 = true -> n = (0%bv : bv 32%N)) -> (if decide (¬ o2 = true) then (min up ≤ offset up ∧ offset up < C.max up) ∧ (∀(l : bv 64%N) (h : bv 64%N), bv_unsigned l + (18446744073709551615%Z + 1%Z) * bv_unsigned h = bv_unsigned (pelts up (offset up)) * bv_unsigned y -> (∀(lpl : bv 64%N), bv_unsigned lpl = ZEuclid.modulo (bv_unsigned l + bv_unsigned cl) (18446744073709551615%Z + 1%Z) -> (∀(o3 : bv 64%N), (if decide (bv_unsigned lpl < bv_unsigned cl) then o3 = (1%bv : bv 64%N) else o3 = (0%bv : bv 64%N)) -> uint'64_in_bounds (bv_unsigned o3 + bv_unsigned h) ∧ (∀(o4 : bv 64%N), bv_unsigned o4 = bv_unsigned o3 + bv_unsigned h -> bv_unsigned lpl + (18446744073709551615%Z + 1%Z) * bv_unsigned o4 = bv_unsigned (pelts up (offset up)) * bv_unsigned y + bv_unsigned cl)) ∧ (∀(cl1 : bv 64%N), bv_unsigned lpl + (18446744073709551615%Z + 1%Z) * bv_unsigned cl1 = bv_unsigned (pelts up (offset up)) * bv_unsigned y + bv_unsigned cl -> ((min up ≤ offset up ∧ offset up < C.max up) ∧ writable up = true) ∧ (∀(up1 : ptr (bv 64%N)) (x2 : ptr (bv 64%N)), data up1 = data x2 ∧ length (data x2) = length (data up) ∧ offset up1 = offset up ∧ min up1 = min up ∧ C.max up1 = C.max up ∧ writable up1 = writable up ∧ zone1 up1 = zone1 up -> data up1 = data x2 ∧ length (data x2) = length (data up) ∧ offset up1 = offset up ∧ min up1 = min up ∧ C.max up1 = C.max up ∧ writable up1 = writable up ∧ zone1 up1 = zone1 up -> length (data x2) = length (data x1) ∧ offset x2 = offset x1 ∧ min x2 = min x1 ∧ C.max x2 = C.max x1 ∧ writable x2 = writable x1 ∧ zone1 x2 = zone1 x1 -> pelts up1 = fun_updt (pelts up) (offset up1) lpl -> (min up1 ≤ offset up1 + 1%Z ∧ offset up1 + 1%Z ≤ C.max up1) ∧ (∀(o3 : ptr (bv 64%N)), offset o3 = offset up1 + 1%Z ∧ plength o3 = plength up1 ∧ pelts o3 = pelts up1 ∧ data o3 = data up1 ∧ min o3 = min up1 ∧ C.max o3 = C.max up1 ∧ zone1 o3 = zone1 up1 ∧ writable o3 = writable up1 -> int'32_in_bounds (bv_signed n - 1%Z) ∧ (∀(o4 : bv 32%N), bv_signed o4 = bv_signed n - 1%Z -> int'32_in_bounds (bv_signed i + 1%Z) ∧ (∀(o5 : bv 32%N), bv_signed o5 = bv_signed i + 1%Z -> bv_signed o4 < bv_signed n ∧ (0%Z ≤ bv_signed o4 ∧ bv_signed o4 ≤ bv_signed sz) ∧ bv_signed o5 = bv_signed sz - bv_signed o4 ∧ value x2 (bv_signed o5) + Z.pow (18446744073709551615%Z + 1%Z) (bv_signed o5) * bv_unsigned cl1 = value x (bv_signed o5) * bv_unsigned y ∧ offset o3 = offset x2 + bv_signed o5 ∧ plength o3 = plength x2 ∧ min o3 = min x2 ∧ C.max o3 = C.max x2 ∧ pelts o3 = pelts x2 ∧ writable o3 = true ∧ (∀(j : Z), j < offset x2 ∨ offset x2 + bv_signed o5 ≤ j -> pelts x2 j = pelts x j)))))))) else value x1 (bv_signed sz) + Z.pow (18446744073709551615%Z + 1%Z) (bv_signed sz) * bv_unsigned cl = value x (bv_signed sz) * bv_unsigned y ∧ (∀(j : Z), j < offset x1 ∨ offset x1 + bv_signed sz ≤ j -> pelts x1 j = pelts x j))))).
Admitted.

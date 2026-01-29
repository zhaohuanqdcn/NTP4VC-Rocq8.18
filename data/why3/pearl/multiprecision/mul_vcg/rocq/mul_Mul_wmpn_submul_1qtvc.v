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
Require Import multiprecision.types.Config.
Require Import multiprecision.types.Types.
Require Import multiprecision.types.Int32Eq.
Require Import multiprecision.types.UInt64Eq.
Require Import multiprecision.lemmas.Lemmas.
Require Import multiprecision.util.Util.
Require Import multiprecision.ptralias.Alias.
Require Import multiprecision.add.Add.
Open Scope Z_scope.
Theorem wmpn_submul_1'vc (x : ptr (bv 64%N)) (sz : bv 32%N) (r : ptr (bv 64%N)) (y : bv 64%N) (fact0 : valid x (bv_signed sz)) (fact1 : valid r (bv_signed sz)) (fact2 : writable r = true) : min r ≤ offset r + 0%Z ∧ offset r + 0%Z ≤ C.max r ∧ (∀(o1 : ptr (bv 64%N)), offset o1 = offset r + 0%Z ∧ plength o1 = plength r ∧ pelts o1 = pelts r ∧ data o1 = data r ∧ min o1 = min r ∧ C.max o1 = C.max r ∧ zone1 o1 = zone1 r ∧ writable o1 = writable r -> (min x ≤ offset x + 0%Z ∧ offset x + 0%Z ≤ C.max x) ∧ (∀(o2 : ptr (bv 64%N)), offset o2 = offset x + 0%Z ∧ plength o2 = plength x ∧ pelts o2 = pelts x ∧ data o2 = data x ∧ min o2 = min x ∧ C.max o2 = C.max x ∧ zone1 o2 = zone1 x ∧ writable o2 = writable x -> ((0%Z ≤ bv_signed sz ∧ bv_signed sz ≤ bv_signed sz) ∧ 0%Z = bv_signed sz - bv_signed sz ∧ value r 0%Z - Z.pow (18446744073709551615%Z + 1%Z) 0%Z * 0%Z = value r 0%Z - value x 0%Z * bv_unsigned y ∧ offset o1 = offset r + 0%Z ∧ min o1 = min r ∧ C.max o1 = C.max r ∧ writable o1 = true ∧ pelts o1 = pelts r ∧ offset o2 = offset x + 0%Z ∧ plength o2 = plength x ∧ min o2 = min x ∧ C.max o2 = C.max x ∧ pelts o2 = pelts x) ∧ (∀(up : ptr (bv 64%N)) (rp : ptr (bv 64%N)) (i : bv 32%N) (n : bv 32%N) (cl : bv 64%N) (r1 : ptr (bv 64%N)), length (data r1) = length (data r) ∧ offset r1 = offset r ∧ min r1 = min r ∧ C.max r1 = C.max r ∧ writable r1 = writable r ∧ zone1 r1 = zone1 r -> (0%Z ≤ bv_signed n ∧ bv_signed n ≤ bv_signed sz) ∧ bv_signed i = bv_signed sz - bv_signed n ∧ value r1 (bv_signed i) - Z.pow (18446744073709551615%Z + 1%Z) (bv_signed i) * bv_unsigned cl = value r (bv_signed i) - value x (bv_signed i) * bv_unsigned y ∧ offset rp = offset r1 + bv_signed i ∧ min rp = min r1 ∧ C.max rp = C.max r1 ∧ writable rp = true ∧ pelts rp = pelts r1 ∧ offset up = offset x + bv_signed i ∧ plength up = plength x ∧ min up = min x ∧ C.max up = C.max x ∧ pelts up = pelts x ∧ (∀(j : Z), offset r1 + bv_signed i ≤ j ∧ j < offset r1 + bv_signed sz -> pelts r j = pelts r1 j) ∧ (∀(j : Z), j < offset r1 ∨ offset r1 + bv_signed sz ≤ j -> pelts r1 j = pelts r j) -> (∀(o3 : bool), (bv_signed n = bv_signed (0%bv : bv 32%N) -> o3 = true) ∧ (o3 = true -> n = (0%bv : bv 32%N)) -> (if decide (¬ o3 = true) then (min up ≤ offset up ∧ offset up < C.max up) ∧ (min up ≤ offset up + 1%Z ∧ offset up + 1%Z ≤ C.max up) ∧ (∀(o4 : ptr (bv 64%N)), offset o4 = offset up + 1%Z ∧ plength o4 = plength up ∧ pelts o4 = pelts up ∧ data o4 = data up ∧ min o4 = min up ∧ C.max o4 = C.max up ∧ zone1 o4 = zone1 up ∧ writable o4 = writable up -> (∀(l : bv 64%N) (h : bv 64%N), bv_unsigned l + (18446744073709551615%Z + 1%Z) * bv_unsigned h = bv_unsigned (pelts up (offset up)) * bv_unsigned y -> (∀(o5 : bv 64%N), bv_unsigned o5 = ZEuclid.modulo (bv_unsigned l + bv_unsigned cl) (18446744073709551615%Z + 1%Z) -> (∀(o6 : bv 64%N), (if decide (bv_unsigned o5 < bv_unsigned cl) then o6 = (1%bv : bv 64%N) else o6 = (0%bv : bv 64%N)) -> uint'64_in_bounds (bv_unsigned o6 + bv_unsigned h) ∧ (∀(o7 : bv 64%N), bv_unsigned o7 = bv_unsigned o6 + bv_unsigned h -> bv_unsigned o5 + (18446744073709551615%Z + 1%Z) * bv_unsigned o7 = bv_unsigned (pelts up (offset up)) * bv_unsigned y + bv_unsigned cl)) ∧ (∀(cl1 : bv 64%N), bv_unsigned o5 + (18446744073709551615%Z + 1%Z) * bv_unsigned cl1 = bv_unsigned (pelts up (offset up)) * bv_unsigned y + bv_unsigned cl -> (min rp ≤ offset rp ∧ offset rp < C.max rp) ∧ (∀(o6 : bv 64%N), bv_unsigned o6 = ZEuclid.modulo (bv_unsigned (pelts rp (offset rp)) - bv_unsigned o5) (18446744073709551615%Z + 1%Z) -> (∀(o7 : bv 64%N), (if decide (bv_unsigned (pelts rp (offset rp)) < bv_unsigned o6) then o7 = (1%bv : bv 64%N) else o7 = (0%bv : bv 64%N)) -> uint'64_in_bounds (bv_unsigned o7 + bv_unsigned cl1) ∧ (∀(o8 : bv 64%N), bv_unsigned o8 = bv_unsigned o7 + bv_unsigned cl1 -> bv_unsigned o6 - (18446744073709551615%Z + 1%Z) * bv_unsigned o8 = bv_unsigned (pelts rp (offset rp)) - bv_unsigned (pelts up (offset up)) * bv_unsigned y - bv_unsigned cl)) ∧ (∀(cl2 : bv 64%N), bv_unsigned o6 - (18446744073709551615%Z + 1%Z) * bv_unsigned cl2 = bv_unsigned (pelts rp (offset rp)) - bv_unsigned (pelts up (offset up)) * bv_unsigned y - bv_unsigned cl -> ((min rp ≤ offset rp ∧ offset rp < C.max rp) ∧ writable rp = true) ∧ (∀(rp1 : ptr (bv 64%N)) (r2 : ptr (bv 64%N)), data rp1 = data r2 ∧ length (data r2) = length (data rp) ∧ offset rp1 = offset rp ∧ min rp1 = min rp ∧ C.max rp1 = C.max rp ∧ writable rp1 = writable rp ∧ zone1 rp1 = zone1 rp -> data rp1 = data r2 ∧ length (data r2) = length (data rp) ∧ offset rp1 = offset rp ∧ min rp1 = min rp ∧ C.max rp1 = C.max rp ∧ writable rp1 = writable rp ∧ zone1 rp1 = zone1 rp -> length (data r2) = length (data r1) ∧ offset r2 = offset r1 ∧ min r2 = min r1 ∧ C.max r2 = C.max r1 ∧ writable r2 = writable r1 ∧ zone1 r2 = zone1 r1 -> pelts rp1 = fun_updt (pelts rp) (offset rp1) o6 -> (min rp1 ≤ offset rp1 + 1%Z ∧ offset rp1 + 1%Z ≤ C.max rp1) ∧ (∀(o7 : ptr (bv 64%N)), offset o7 = offset rp1 + 1%Z ∧ plength o7 = plength rp1 ∧ pelts o7 = pelts rp1 ∧ data o7 = data rp1 ∧ min o7 = min rp1 ∧ C.max o7 = C.max rp1 ∧ zone1 o7 = zone1 rp1 ∧ writable o7 = writable rp1 -> int'32_in_bounds (bv_signed n - 1%Z) ∧ (∀(o8 : bv 32%N), bv_signed o8 = bv_signed n - 1%Z -> int'32_in_bounds (bv_signed i + 1%Z) ∧ (∀(o9 : bv 32%N), bv_signed o9 = bv_signed i + 1%Z -> (0%Z ≤ bv_signed sz - bv_signed i ∧ bv_signed sz - bv_signed o9 < bv_signed sz - bv_signed i) ∧ (0%Z ≤ bv_signed o8 ∧ bv_signed o8 ≤ bv_signed sz) ∧ bv_signed o9 = bv_signed sz - bv_signed o8 ∧ value r2 (bv_signed o9) - Z.pow (18446744073709551615%Z + 1%Z) (bv_signed o9) * bv_unsigned cl2 = value r (bv_signed o9) - value x (bv_signed o9) * bv_unsigned y ∧ offset o7 = offset r2 + bv_signed o9 ∧ min o7 = min r2 ∧ C.max o7 = C.max r2 ∧ writable o7 = true ∧ pelts o7 = pelts r2 ∧ offset o4 = offset x + bv_signed o9 ∧ plength o4 = plength x ∧ min o4 = min x ∧ C.max o4 = C.max x ∧ pelts o4 = pelts x ∧ (∀(j : Z), offset r2 + bv_signed o9 ≤ j ∧ j < offset r2 + bv_signed sz -> pelts r j = pelts r2 j) ∧ (∀(j : Z), j < offset r2 ∨ offset r2 + bv_signed sz ≤ j -> pelts r2 j = pelts r j))))))))))) else value r1 (bv_signed sz) - Z.pow (18446744073709551615%Z + 1%Z) (bv_signed sz) * bv_unsigned cl = value r (bv_signed sz) - value x (bv_signed sz) * bv_unsigned y ∧ (∀(j : Z), j < offset r1 ∨ offset r1 + bv_signed sz ≤ j -> pelts r1 j = pelts r j)))))).
Proof.
Admitted.

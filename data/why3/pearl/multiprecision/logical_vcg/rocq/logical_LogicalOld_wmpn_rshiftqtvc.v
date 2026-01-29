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
Require Import multiprecision.logical.LogicalUtil.
Require Import Why3.mach.int.Unsigned.
Require Import Why3.mach.c.C.
Require Import multiprecision.types.Config.
Require Import multiprecision.types.Types.
Require Import multiprecision.types.Int32Eq.
Require Import multiprecision.types.UInt64Eq.
Require Import multiprecision.lemmas.Lemmas.
Open Scope Z_scope.
Theorem wmpn_rshift'vc (x : ptr (bv 64%N)) (sz : bv 32%N) (r : ptr (bv 64%N)) (cnt : bv 64%N) (fact0 : valid x (bv_signed sz)) (fact1 : valid r (bv_signed sz)) (fact2 : 0%Z < bv_unsigned cnt) (fact3 : bv_unsigned cnt < 64%Z) (fact4 : 0%Z < bv_signed sz) (fact5 : writable r = true) : uint'64_in_bounds (64%Z - bv_unsigned cnt) ∧ (∀(tnc : bv 64%N), bv_unsigned tnc = 64%Z - bv_unsigned cnt -> int'32_in_bounds (bv_signed sz - 1%Z) ∧ (∀(msb : bv 32%N), bv_signed msb = bv_signed sz - 1%Z -> (min x ≤ offset x + 0%Z ∧ offset x + 0%Z ≤ C.max x) ∧ (∀(o1 : ptr (bv 64%N)), offset o1 = offset x + 0%Z ∧ plength o1 = plength x ∧ pelts o1 = pelts x ∧ data o1 = data x ∧ min o1 = min x ∧ C.max o1 = C.max x ∧ zone1 o1 = zone1 x ∧ writable o1 = writable x -> (min r ≤ offset r + 0%Z ∧ offset r + 0%Z ≤ C.max r) ∧ (∀(o2 : ptr (bv 64%N)), offset o2 = offset r + 0%Z ∧ plength o2 = plength r ∧ pelts o2 = pelts r ∧ data o2 = data r ∧ min o2 = min r ∧ C.max o2 = C.max r ∧ zone1 o2 = zone1 r ∧ writable o2 = writable r -> (min o1 ≤ offset o1 ∧ offset o1 < C.max o1) ∧ (0%Z < bv_unsigned tnc ∧ bv_unsigned tnc < 64%Z) ∧ (∀(retval : bv 64%N) (h : bv 64%N), bv_unsigned retval + (18446744073709551615%Z + 1%Z) * bv_unsigned h = Z.pow 2%Z (bv_unsigned tnc) * bv_unsigned (pelts o1 (offset o1)) ∧ ZEuclid.modulo (bv_unsigned retval) (Z.pow 2%Z (bv_unsigned tnc)) = 0%Z ∧ bv_unsigned retval ≤ 18446744073709551615%Z + 1%Z - Z.pow 2%Z (bv_unsigned tnc) ∧ bv_unsigned h < Z.pow 2%Z (bv_unsigned tnc) -> (let c : Z := Z.pow 2%Z (bv_unsigned tnc) in ((0%Z ≤ 0%Z ∧ 0%Z ≤ bv_signed msb) ∧ bv_unsigned retval + (18446744073709551615%Z + 1%Z) * (value r 0%Z + Z.pow (18446744073709551615%Z + 1%Z) 0%Z * bv_unsigned h) = value x (0%Z + 1%Z) * c ∧ offset o2 = offset r + 0%Z ∧ offset o1 = offset x + 0%Z ∧ plength o2 = plength r ∧ min o2 = min r ∧ C.max o2 = C.max r ∧ writable o2 = true ∧ plength o1 = plength x ∧ min o1 = min x ∧ C.max o1 = C.max x ∧ pelts o2 = pelts r ∧ pelts o1 = pelts x ∧ bv_unsigned h < c) ∧ (∀(i : bv 32%N) (low : bv 64%N) (rp : ptr (bv 64%N)) (xp : ptr (bv 64%N)) (r1 : ptr (bv 64%N)), length (data r1) = length (data r) ∧ offset r1 = offset r ∧ min r1 = min r ∧ C.max r1 = C.max r ∧ writable r1 = writable r ∧ zone1 r1 = zone1 r -> (0%Z ≤ bv_signed i ∧ bv_signed i ≤ bv_signed msb) ∧ bv_unsigned retval + (18446744073709551615%Z + 1%Z) * (value r1 (bv_signed i) + Z.pow (18446744073709551615%Z + 1%Z) (bv_signed i) * bv_unsigned low) = value x (bv_signed i + 1%Z) * c ∧ offset rp = offset r1 + bv_signed i ∧ offset xp = offset x + bv_signed i ∧ plength rp = plength r1 ∧ min rp = min r1 ∧ C.max rp = C.max r1 ∧ writable rp = true ∧ plength xp = plength x ∧ min xp = min x ∧ C.max xp = C.max x ∧ pelts rp = pelts r1 ∧ pelts xp = pelts x ∧ bv_unsigned low < c -> (if decide (bv_signed i < bv_signed msb) then (min xp ≤ offset xp + 1%Z ∧ offset xp + 1%Z ≤ C.max xp) ∧ (∀(o3 : ptr (bv 64%N)), offset o3 = offset xp + 1%Z ∧ plength o3 = plength xp ∧ pelts o3 = pelts xp ∧ data o3 = data xp ∧ min o3 = min xp ∧ C.max o3 = C.max xp ∧ zone1 o3 = zone1 xp ∧ writable o3 = writable xp -> (min o3 ≤ offset o3 ∧ offset o3 < C.max o3) ∧ (0%Z < bv_unsigned tnc ∧ bv_unsigned tnc < 64%Z) ∧ (∀(l : bv 64%N) (h1 : bv 64%N), bv_unsigned l + (18446744073709551615%Z + 1%Z) * bv_unsigned h1 = Z.pow 2%Z (bv_unsigned tnc) * bv_unsigned (pelts o3 (offset o3)) ∧ ZEuclid.modulo (bv_unsigned l) (Z.pow 2%Z (bv_unsigned tnc)) = 0%Z ∧ bv_unsigned l ≤ 18446744073709551615%Z + 1%Z - Z.pow 2%Z (bv_unsigned tnc) ∧ bv_unsigned h1 < Z.pow 2%Z (bv_unsigned tnc) -> uint'64_in_bounds (bv_unsigned low + bv_unsigned l) ∧ (∀(v : bv 64%N), bv_unsigned v = bv_unsigned low + bv_unsigned l -> uint'64_in_bounds (bv_unsigned low + bv_unsigned l) ∧ (∀(o4 : bv 64%N), bv_unsigned o4 = bv_unsigned low + bv_unsigned l -> ((min rp ≤ offset rp ∧ offset rp < C.max rp) ∧ writable rp = true) ∧ (∀(rp1 : ptr (bv 64%N)) (r2 : ptr (bv 64%N)), data rp1 = data r2 ∧ length (data r2) = length (data rp) ∧ offset rp1 = offset rp ∧ min rp1 = min rp ∧ C.max rp1 = C.max rp ∧ writable rp1 = writable rp ∧ zone1 rp1 = zone1 rp -> data rp1 = data r2 ∧ length (data r2) = length (data rp) ∧ offset rp1 = offset rp ∧ min rp1 = min rp ∧ C.max rp1 = C.max rp ∧ writable rp1 = writable rp ∧ zone1 rp1 = zone1 rp -> length (data r2) = length (data r1) ∧ offset r2 = offset r1 ∧ min r2 = min r1 ∧ C.max r2 = C.max r1 ∧ writable r2 = writable r1 ∧ zone1 r2 = zone1 r1 -> pelts rp1 = fun_updt (pelts rp) (offset rp1) o4 -> int'32_in_bounds (bv_signed i + 1%Z) ∧ (∀(o5 : bv 32%N), bv_signed o5 = bv_signed i + 1%Z -> (min rp1 ≤ offset rp1 + 1%Z ∧ offset rp1 + 1%Z ≤ C.max rp1) ∧ (∀(o6 : ptr (bv 64%N)), offset o6 = offset rp1 + 1%Z ∧ plength o6 = plength rp1 ∧ pelts o6 = pelts rp1 ∧ data o6 = data rp1 ∧ min o6 = min rp1 ∧ C.max o6 = C.max rp1 ∧ zone1 o6 = zone1 rp1 ∧ writable o6 = writable rp1 -> (0%Z ≤ bv_signed sz - bv_signed i ∧ bv_signed sz - bv_signed o5 < bv_signed sz - bv_signed i) ∧ (0%Z ≤ bv_signed o5 ∧ bv_signed o5 ≤ bv_signed msb) ∧ bv_unsigned retval + (18446744073709551615%Z + 1%Z) * (value r2 (bv_signed o5) + Z.pow (18446744073709551615%Z + 1%Z) (bv_signed o5) * bv_unsigned h1) = value x (bv_signed o5 + 1%Z) * c ∧ offset o6 = offset r2 + bv_signed o5 ∧ offset o3 = offset x + bv_signed o5 ∧ plength o6 = plength r2 ∧ min o6 = min r2 ∧ C.max o6 = C.max r2 ∧ writable o6 = true ∧ plength o3 = plength x ∧ min o3 = min x ∧ C.max o3 = C.max x ∧ pelts o6 = pelts r2 ∧ pelts o3 = pelts x ∧ bv_unsigned h1 < c))))))) else ((min rp ≤ offset rp ∧ offset rp < C.max rp) ∧ writable rp = true) ∧ (∀(o3 : ptr (bv 64%N)) (r2 : ptr (bv 64%N)), data o3 = data r2 ∧ length (data r2) = length (data rp) ∧ offset o3 = offset rp ∧ min o3 = min rp ∧ C.max o3 = C.max rp ∧ writable o3 = writable rp ∧ zone1 o3 = zone1 rp -> length (data r2) = length (data r1) ∧ offset r2 = offset r1 ∧ min r2 = min r1 ∧ C.max r2 = C.max r1 ∧ writable r2 = writable r1 ∧ zone1 r2 = zone1 r1 -> pelts o3 = fun_updt (pelts rp) (offset o3) low -> bv_unsigned retval + (18446744073709551615%Z + 1%Z) * value r2 (bv_signed sz) = value x (bv_signed sz) * Z.pow 2%Z (64%Z - bv_unsigned cnt)))))))))).
Proof.
Admitted.

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
Theorem wmpn_rshift_in_place'vc (x : ptr (bv 64%N)) (sz : bv 32%N) (cnt : bv 64%N) (fact0 : valid x (bv_signed sz)) (fact1 : writable x = true) (fact2 : 0%Z < bv_unsigned cnt) (fact3 : bv_unsigned cnt < 64%Z) (fact4 : 0%Z < bv_signed sz) : uint'64_in_bounds (64%Z - bv_unsigned cnt) ∧ (∀(tnc : bv 64%N), bv_unsigned tnc = 64%Z - bv_unsigned cnt -> int'32_in_bounds (bv_signed sz - 1%Z) ∧ (∀(msb : bv 32%N), bv_signed msb = bv_signed sz - 1%Z -> (min x ≤ offset x + 0%Z ∧ offset x + 0%Z ≤ C.max x) ∧ (∀(o1 : ptr (bv 64%N)), offset o1 = offset x + 0%Z ∧ plength o1 = plength x ∧ pelts o1 = pelts x ∧ data o1 = data x ∧ min o1 = min x ∧ C.max o1 = C.max x ∧ zone1 o1 = zone1 x ∧ writable o1 = writable x -> (min x ≤ offset x + 0%Z ∧ offset x + 0%Z ≤ C.max x) ∧ (∀(o2 : ptr (bv 64%N)), offset o2 = offset x + 0%Z ∧ plength o2 = plength x ∧ pelts o2 = pelts x ∧ data o2 = data x ∧ min o2 = min x ∧ C.max o2 = C.max x ∧ zone1 o2 = zone1 x ∧ writable o2 = writable x -> (min o1 ≤ offset o1 ∧ offset o1 < C.max o1) ∧ (0%Z < bv_unsigned tnc ∧ bv_unsigned tnc < 64%Z) ∧ (∀(retval : bv 64%N) (h : bv 64%N), bv_unsigned retval + (18446744073709551615%Z + 1%Z) * bv_unsigned h = Z.pow 2%Z (bv_unsigned tnc) * bv_unsigned (pelts o1 (offset o1)) ∧ ZEuclid.modulo (bv_unsigned retval) (Z.pow 2%Z (bv_unsigned tnc)) = 0%Z ∧ bv_unsigned retval ≤ 18446744073709551615%Z + 1%Z - Z.pow 2%Z (bv_unsigned tnc) ∧ bv_unsigned h < Z.pow 2%Z (bv_unsigned tnc) -> (let c : Z := Z.pow 2%Z (bv_unsigned tnc) in ((0%Z ≤ 0%Z ∧ 0%Z ≤ bv_signed msb) ∧ bv_unsigned retval + (18446744073709551615%Z + 1%Z) * (value x 0%Z + Z.pow (18446744073709551615%Z + 1%Z) 0%Z * bv_unsigned h) = value x (0%Z + 1%Z) * c ∧ offset o1 = offset x + 0%Z ∧ offset o2 = offset x + 0%Z ∧ plength o2 = plength x ∧ min o2 = min x ∧ C.max o2 = C.max x ∧ pelts o2 = pelts x ∧ plength o1 = plength x ∧ min o1 = min x ∧ C.max o1 = C.max x ∧ writable o1 = true ∧ pelts o1 = pelts x ∧ bv_unsigned h < c) ∧ (∀(i : bv 32%N) (low : bv 64%N) (oxp : ptr (bv 64%N)) (xp : ptr (bv 64%N)) (x1 : ptr (bv 64%N)), length (data x1) = length (data x) ∧ offset x1 = offset x ∧ min x1 = min x ∧ C.max x1 = C.max x ∧ writable x1 = writable x ∧ zone1 x1 = zone1 x -> (0%Z ≤ bv_signed i ∧ bv_signed i ≤ bv_signed msb) ∧ bv_unsigned retval + (18446744073709551615%Z + 1%Z) * (value x1 (bv_signed i) + Z.pow (18446744073709551615%Z + 1%Z) (bv_signed i) * bv_unsigned low) = value x (bv_signed i + 1%Z) * c ∧ offset xp = offset x1 + bv_signed i ∧ offset oxp = offset x1 + bv_signed i ∧ plength oxp = plength x1 ∧ min oxp = min x1 ∧ C.max oxp = C.max x1 ∧ pelts oxp = pelts x ∧ plength xp = plength x1 ∧ min xp = min x1 ∧ C.max xp = C.max x1 ∧ writable xp = true ∧ pelts xp = pelts x1 ∧ bv_unsigned low < c ∧ (∀(j : Z), bv_signed i ≤ j ∧ j < bv_signed sz -> pelts x1 (offset x1 + j) = pelts x (offset x1 + j)) -> (if decide (bv_signed i < bv_signed msb) then (min xp ≤ offset xp + 1%Z ∧ offset xp + 1%Z ≤ C.max xp) ∧ (∀(o3 : ptr (bv 64%N)), offset o3 = offset xp + 1%Z ∧ plength o3 = plength xp ∧ pelts o3 = pelts xp ∧ data o3 = data xp ∧ min o3 = min xp ∧ C.max o3 = C.max xp ∧ zone1 o3 = zone1 xp ∧ writable o3 = writable xp -> (min oxp ≤ offset oxp + 1%Z ∧ offset oxp + 1%Z ≤ C.max oxp) ∧ (∀(o4 : ptr (bv 64%N)), offset o4 = offset oxp + 1%Z ∧ plength o4 = plength oxp ∧ pelts o4 = pelts oxp ∧ data o4 = data oxp ∧ min o4 = min oxp ∧ C.max o4 = C.max oxp ∧ zone1 o4 = zone1 oxp ∧ writable o4 = writable oxp -> (min o3 ≤ offset o3 ∧ offset o3 < C.max o3) ∧ (min o4 ≤ offset o4 ∧ offset o4 < C.max o4) ∧ (0%Z < bv_unsigned tnc ∧ bv_unsigned tnc < 64%Z) ∧ (∀(l : bv 64%N) (h1 : bv 64%N), bv_unsigned l + (18446744073709551615%Z + 1%Z) * bv_unsigned h1 = Z.pow 2%Z (bv_unsigned tnc) * bv_unsigned (pelts o3 (offset o3)) ∧ ZEuclid.modulo (bv_unsigned l) (Z.pow 2%Z (bv_unsigned tnc)) = 0%Z ∧ bv_unsigned l ≤ 18446744073709551615%Z + 1%Z - Z.pow 2%Z (bv_unsigned tnc) ∧ bv_unsigned h1 < Z.pow 2%Z (bv_unsigned tnc) -> uint'64_in_bounds (bv_unsigned low + bv_unsigned l) ∧ (∀(v : bv 64%N), bv_unsigned v = bv_unsigned low + bv_unsigned l -> uint'64_in_bounds (bv_unsigned low + bv_unsigned l) ∧ (∀(o5 : bv 64%N), bv_unsigned o5 = bv_unsigned low + bv_unsigned l -> ((min o3 ≤ offset o3 + - 1%Z ∧ offset o3 + - 1%Z < C.max o3) ∧ writable o3 = true) ∧ (∀(xp1 : ptr (bv 64%N)) (x2 : ptr (bv 64%N)), data xp1 = data x2 ∧ length (data x2) = length (data o3) ∧ offset xp1 = offset o3 ∧ min xp1 = min o3 ∧ C.max xp1 = C.max o3 ∧ writable xp1 = writable o3 ∧ zone1 xp1 = zone1 o3 -> data xp1 = data x2 ∧ length (data x2) = length (data o3) ∧ offset xp1 = offset o3 ∧ min xp1 = min o3 ∧ C.max xp1 = C.max o3 ∧ writable xp1 = writable o3 ∧ zone1 xp1 = zone1 o3 -> length (data x2) = length (data x1) ∧ offset x2 = offset x1 ∧ min x2 = min x1 ∧ C.max x2 = C.max x1 ∧ writable x2 = writable x1 ∧ zone1 x2 = zone1 x1 -> pelts xp1 = fun_updt (pelts o3) (offset xp1 + - 1%Z) o5 ∧ pelts xp1 (offset xp1 + - 1%Z) = o5 -> int'32_in_bounds (bv_signed i + 1%Z) ∧ (∀(o6 : bv 32%N), bv_signed o6 = bv_signed i + 1%Z -> (0%Z ≤ bv_signed sz - bv_signed i ∧ bv_signed sz - bv_signed o6 < bv_signed sz - bv_signed i) ∧ (0%Z ≤ bv_signed o6 ∧ bv_signed o6 ≤ bv_signed msb) ∧ bv_unsigned retval + (18446744073709551615%Z + 1%Z) * (value x2 (bv_signed o6) + Z.pow (18446744073709551615%Z + 1%Z) (bv_signed o6) * bv_unsigned h1) = value x (bv_signed o6 + 1%Z) * c ∧ offset xp1 = offset x2 + bv_signed o6 ∧ offset o4 = offset x2 + bv_signed o6 ∧ plength o4 = plength x2 ∧ min o4 = min x2 ∧ C.max o4 = C.max x2 ∧ pelts o4 = pelts x ∧ plength xp1 = plength x2 ∧ min xp1 = min x2 ∧ C.max xp1 = C.max x2 ∧ writable xp1 = true ∧ pelts xp1 = pelts x2 ∧ bv_unsigned h1 < c ∧ (∀(j : Z), bv_signed o6 ≤ j ∧ j < bv_signed sz -> pelts x2 (offset x2 + j) = pelts x (offset x2 + j))))))))) else ((min x1 ≤ offset x1 + bv_signed msb ∧ offset x1 + bv_signed msb < C.max x1) ∧ writable x1 = true) ∧ (∀(x2 : ptr (bv 64%N)), length (data x2) = length (data x1) ∧ offset x2 = offset x1 ∧ min x2 = min x1 ∧ C.max x2 = C.max x1 ∧ writable x2 = writable x1 ∧ zone1 x2 = zone1 x1 -> pelts x2 = fun_updt (pelts x1) (offset x2 + bv_signed msb) low ∧ pelts x2 (offset x2 + bv_signed msb) = low -> bv_unsigned retval + (18446744073709551615%Z + 1%Z) * value x2 (bv_signed sz) = value x (bv_signed sz) * Z.pow 2%Z (64%Z - bv_unsigned cnt)))))))))).
Proof.
Admitted.

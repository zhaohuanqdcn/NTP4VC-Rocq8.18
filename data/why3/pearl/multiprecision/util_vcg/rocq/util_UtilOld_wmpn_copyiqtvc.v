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
Open Scope Z_scope.
Theorem wmpn_copyi'vc (x : ptr (bv 64%N)) (sz : bv 32%N) (r : ptr (bv 64%N)) (fact0 : valid x (bv_signed sz)) (fact1 : valid r (bv_signed sz)) (fact2 : writable r = true) : min x ≤ offset x + 0%Z ∧ offset x + 0%Z ≤ C.max x ∧ (∀(o1 : ptr (bv 64%N)), offset o1 = offset x + 0%Z ∧ plength o1 = plength x ∧ pelts o1 = pelts x ∧ data o1 = data x ∧ min o1 = min x ∧ C.max o1 = C.max x ∧ zone1 o1 = zone1 x ∧ writable o1 = writable x -> (min r ≤ offset r + 0%Z ∧ offset r + 0%Z ≤ C.max r) ∧ (∀(o2 : ptr (bv 64%N)), offset o2 = offset r + 0%Z ∧ plength o2 = plength r ∧ pelts o2 = pelts r ∧ data o2 = data r ∧ min o2 = min r ∧ C.max o2 = C.max r ∧ zone1 o2 = zone1 r ∧ writable o2 = writable r -> ((0%Z ≤ 0%Z ∧ 0%Z ≤ bv_signed sz) ∧ map_eq_sub_shift (pelts r) (pelts x) (offset r) (offset x) 0%Z ∧ pelts o1 = pelts x ∧ pelts o2 = pelts r ∧ min o1 = min x ∧ C.max o1 = C.max x ∧ min o2 = min r ∧ C.max o2 = C.max r ∧ writable o2 = true ∧ offset o1 = offset x + 0%Z ∧ offset o2 = offset r + 0%Z) ∧ (∀(rp : ptr (bv 64%N)) (xp : ptr (bv 64%N)) (i : bv 32%N) (r1 : ptr (bv 64%N)), length (data r1) = length (data r) ∧ offset r1 = offset r ∧ min r1 = min r ∧ C.max r1 = C.max r ∧ writable r1 = writable r ∧ zone1 r1 = zone1 r -> (0%Z ≤ bv_signed i ∧ bv_signed i ≤ bv_signed sz) ∧ map_eq_sub_shift (pelts r1) (pelts x) (offset r1) (offset x) (bv_signed i) ∧ pelts xp = pelts x ∧ pelts rp = pelts r1 ∧ min xp = min x ∧ C.max xp = C.max x ∧ min rp = min r1 ∧ C.max rp = C.max r1 ∧ writable rp = true ∧ offset xp = offset x + bv_signed i ∧ offset rp = offset r1 + bv_signed i ∧ (∀(j : Z), j < offset r1 ∨ offset r1 + bv_signed sz ≤ j -> pelts r1 j = pelts r j) -> (if decide (bv_signed i < bv_signed sz) then (min xp ≤ offset xp ∧ offset xp < C.max xp) ∧ ((min rp ≤ offset rp ∧ offset rp < C.max rp) ∧ writable rp = true) ∧ (∀(rp1 : ptr (bv 64%N)) (r2 : ptr (bv 64%N)), data rp1 = data r2 ∧ length (data r2) = length (data rp) ∧ offset rp1 = offset rp ∧ min rp1 = min rp ∧ C.max rp1 = C.max rp ∧ writable rp1 = writable rp ∧ zone1 rp1 = zone1 rp -> data rp1 = data r2 ∧ length (data r2) = length (data rp) ∧ offset rp1 = offset rp ∧ min rp1 = min rp ∧ C.max rp1 = C.max rp ∧ writable rp1 = writable rp ∧ zone1 rp1 = zone1 rp -> length (data r2) = length (data r1) ∧ offset r2 = offset r1 ∧ min r2 = min r1 ∧ C.max r2 = C.max r1 ∧ writable r2 = writable r1 ∧ zone1 r2 = zone1 r1 -> pelts rp1 = fun_updt (pelts rp) (offset rp1) (pelts xp (offset xp)) -> (min rp1 ≤ offset rp1 + 1%Z ∧ offset rp1 + 1%Z ≤ C.max rp1) ∧ (∀(o3 : ptr (bv 64%N)), offset o3 = offset rp1 + 1%Z ∧ plength o3 = plength rp1 ∧ pelts o3 = pelts rp1 ∧ data o3 = data rp1 ∧ min o3 = min rp1 ∧ C.max o3 = C.max rp1 ∧ zone1 o3 = zone1 rp1 ∧ writable o3 = writable rp1 -> (min xp ≤ offset xp + 1%Z ∧ offset xp + 1%Z ≤ C.max xp) ∧ (∀(o4 : ptr (bv 64%N)), offset o4 = offset xp + 1%Z ∧ plength o4 = plength xp ∧ pelts o4 = pelts xp ∧ data o4 = data xp ∧ min o4 = min xp ∧ C.max o4 = C.max xp ∧ zone1 o4 = zone1 xp ∧ writable o4 = writable xp -> int'32_in_bounds (bv_signed i + 1%Z) ∧ (∀(o5 : bv 32%N), bv_signed o5 = bv_signed i + 1%Z -> (0%Z ≤ bv_signed sz - bv_signed i ∧ bv_signed sz - bv_signed o5 < bv_signed sz - bv_signed i) ∧ (0%Z ≤ bv_signed o5 ∧ bv_signed o5 ≤ bv_signed sz) ∧ map_eq_sub_shift (pelts r2) (pelts x) (offset r2) (offset x) (bv_signed o5) ∧ pelts o4 = pelts x ∧ pelts o3 = pelts r2 ∧ min o4 = min x ∧ C.max o4 = C.max x ∧ min o3 = min r2 ∧ C.max o3 = C.max r2 ∧ writable o3 = true ∧ offset o4 = offset x + bv_signed o5 ∧ offset o3 = offset r2 + bv_signed o5 ∧ (∀(j : Z), j < offset r2 ∨ offset r2 + bv_signed sz ≤ j -> pelts r2 j = pelts r j))))) else map_eq_sub_shift (pelts r1) (pelts x) (offset r1) (offset x) (bv_signed sz) ∧ (∀(j : Z), j < offset r1 ∨ offset r1 + bv_signed sz ≤ j -> pelts r1 j = pelts r j))))).
Proof.
Admitted.

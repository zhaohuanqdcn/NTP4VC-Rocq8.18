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
Open Scope Z_scope.
Theorem wmpn_zero'vc (r : ptr (bv 64%N)) (sz : bv 32%N) (fact0 : valid r (bv_signed sz)) (fact1 : writable r = true) : 0%Z ≤ 0%Z ∧ 0%Z ≤ bv_signed sz ∧ value r 0%Z = 0%Z ∧ (∀(i : bv 32%N) (r1 : ptr (bv 64%N)), length (data r1) = length (data r) ∧ offset r1 = offset r ∧ min r1 = min r ∧ C.max r1 = C.max r ∧ writable r1 = writable r ∧ zone1 r1 = zone1 r -> (0%Z ≤ bv_signed i ∧ bv_signed i ≤ bv_signed sz) ∧ value r1 (bv_signed i) = 0%Z ∧ (∀(j : Z), j < offset r1 ∨ offset r1 + bv_signed sz ≤ j -> pelts r1 j = pelts r j) -> (if decide (bv_signed i < bv_signed sz) then ((min r1 ≤ offset r1 + bv_signed i ∧ offset r1 + bv_signed i < C.max r1) ∧ writable r1 = true) ∧ (∀(r2 : ptr (bv 64%N)), length (data r2) = length (data r1) ∧ offset r2 = offset r1 ∧ min r2 = min r1 ∧ C.max r2 = C.max r1 ∧ writable r2 = writable r1 ∧ zone1 r2 = zone1 r1 -> pelts r2 = fun_updt (pelts r1) (offset r2 + bv_signed i) (0%bv : bv 64%N) ∧ pelts r2 (offset r2 + bv_signed i) = (0%bv : bv 64%N) -> int'32_in_bounds (bv_signed i + 1%Z) ∧ (∀(o1 : bv 32%N), bv_signed o1 = bv_signed i + 1%Z -> (0%Z ≤ bv_signed sz - bv_signed i ∧ bv_signed sz - bv_signed o1 < bv_signed sz - bv_signed i) ∧ (0%Z ≤ bv_signed o1 ∧ bv_signed o1 ≤ bv_signed sz) ∧ value r2 (bv_signed o1) = 0%Z ∧ (∀(j : Z), j < offset r2 ∨ offset r2 + bv_signed sz ≤ j -> pelts r2 j = pelts r j))) else value r1 (bv_signed sz) = 0%Z ∧ (∀(j : Z), j < offset r1 ∨ offset r1 + bv_signed sz ≤ j -> pelts r1 j = pelts r j))).
Admitted.

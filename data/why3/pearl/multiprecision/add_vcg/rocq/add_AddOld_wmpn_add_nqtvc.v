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
Require Import Why3.mach.c.C.
Require Import Why3.mach.int.Unsigned.
Require Import multiprecision.lemmas.Lemmas.
Require Import multiprecision.types.Config.
Require Import multiprecision.types.Types.
Require Import multiprecision.types.Int32Eq.
Require Import multiprecision.types.UInt64Eq.
Require Import multiprecision.ptralias.Alias.
Open Scope Z_scope.
Theorem wmpn_add_n'vc (x : ptr (bv 64%N)) (sz : bv 32%N) (y : ptr (bv 64%N)) (r : ptr (bv 64%N)) (fact0 : valid x (bv_signed sz)) (fact1 : valid y (bv_signed sz)) (fact2 : valid r (bv_signed sz)) (fact3 : writable r = true) : 0%Z ≤ 0%Z ∧ 0%Z ≤ bv_signed sz ∧ value r 0%Z + Z.pow (18446744073709551615%Z + 1%Z) 0%Z * 0%Z = value x 0%Z + value y 0%Z ∧ 0%Z ≤ 0%Z ∧ 0%Z ≤ 1%Z ∧ (∀(i : bv 32%N) (c : bv 64%N) (r1 : ptr (bv 64%N)), length (data r1) = length (data r) ∧ offset r1 = offset r ∧ min r1 = min r ∧ C.max r1 = C.max r ∧ writable r1 = writable r ∧ zone1 r1 = zone1 r -> (0%Z ≤ bv_signed i ∧ bv_signed i ≤ bv_signed sz) ∧ value r1 (bv_signed i) + Z.pow (18446744073709551615%Z + 1%Z) (bv_signed i) * bv_unsigned c = value x (bv_signed i) + value y (bv_signed i) ∧ (0%Z ≤ bv_unsigned c ∧ bv_unsigned c ≤ 1%Z) ∧ (∀(j : Z), j < offset r1 ∨ offset r1 + bv_signed sz ≤ j -> pelts r1 j = pelts r j) -> (if decide (bv_signed i < bv_signed sz) then (min x ≤ offset x + bv_signed i ∧ offset x + bv_signed i < C.max x) ∧ (min y ≤ offset y + bv_signed i ∧ offset y + bv_signed i < C.max y) ∧ (0%Z ≤ bv_unsigned c ∧ bv_unsigned c ≤ 1%Z) ∧ (∀(res : bv 64%N) (carry : bv 64%N), bv_unsigned res + (18446744073709551615%Z + 1%Z) * bv_unsigned carry = bv_unsigned (pelts x (offset x + bv_signed i)) + bv_unsigned (pelts y (offset y + bv_signed i)) + bv_unsigned c ∧ 0%Z ≤ bv_unsigned carry ∧ bv_unsigned carry ≤ 1%Z -> ((min r1 ≤ offset r1 + bv_signed i ∧ offset r1 + bv_signed i < C.max r1) ∧ writable r1 = true) ∧ (∀(r2 : ptr (bv 64%N)), length (data r2) = length (data r1) ∧ offset r2 = offset r1 ∧ min r2 = min r1 ∧ C.max r2 = C.max r1 ∧ writable r2 = writable r1 ∧ zone1 r2 = zone1 r1 -> pelts r2 = fun_updt (pelts r1) (offset r2 + bv_signed i) res ∧ pelts r2 (offset r2 + bv_signed i) = res -> int'32_in_bounds (bv_signed i + 1%Z) ∧ (∀(o1 : bv 32%N), bv_signed o1 = bv_signed i + 1%Z -> (0%Z ≤ bv_signed sz - bv_signed i ∧ bv_signed sz - bv_signed o1 < bv_signed sz - bv_signed i) ∧ (0%Z ≤ bv_signed o1 ∧ bv_signed o1 ≤ bv_signed sz) ∧ value r2 (bv_signed o1) + Z.pow (18446744073709551615%Z + 1%Z) (bv_signed o1) * bv_unsigned carry = value x (bv_signed o1) + value y (bv_signed o1) ∧ (0%Z ≤ bv_unsigned carry ∧ bv_unsigned carry ≤ 1%Z) ∧ (∀(j : Z), j < offset r2 ∨ offset r2 + bv_signed sz ≤ j -> pelts r2 j = pelts r j)))) else (0%Z ≤ bv_unsigned c ∧ bv_unsigned c ≤ 1%Z) ∧ value r1 (bv_signed sz) + Z.pow (18446744073709551615%Z + 1%Z) (bv_signed sz) * bv_unsigned c = value x (bv_signed sz) + value y (bv_signed sz) ∧ (∀(j : Z), j < offset r1 ∨ offset r1 + bv_signed sz ≤ j -> pelts r1 j = pelts r j))).
Proof.
Admitted.

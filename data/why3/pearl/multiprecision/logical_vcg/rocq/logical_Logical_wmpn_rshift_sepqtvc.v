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
Require Import multiprecision.logical.LogicalUtil.
Require Import Why3.mach.int.Unsigned.
Require Import Why3.mach.c.C.
Require Import multiprecision.types.Config.
Require Import multiprecision.types.Types.
Require Import multiprecision.types.Int32Eq.
Require Import multiprecision.types.UInt64Eq.
Require Import multiprecision.lemmas.Lemmas.
Require Import multiprecision.ptralias.Alias.
Open Scope Z_scope.
Theorem wmpn_rshift_sep'vc (x : ptr (bv 64%N)) (sz : bv 32%N) (r : ptr (bv 64%N)) (cnt : bv 64%N) (fact0 : valid x (bv_signed sz)) (fact1 : valid r (bv_signed sz)) (fact2 : 0%Z < bv_unsigned cnt) (fact3 : bv_unsigned cnt < 64%Z) (fact4 : 0%Z < bv_signed sz) (fact5 : writable r = true) : valid r (bv_signed sz) ∧ valid x (bv_signed sz) ∧ 0%Z ≤ bv_signed sz ∧ writable r = true ∧ (∀(x1 : ptr (bv 64%N)) (r1 : ptr (bv 64%N)), offset x1 = offset x ∧ writable x1 = writable x ∧ zone1 x1 = zone1 x -> offset r1 = offset r ∧ writable r1 = writable r ∧ zone1 r1 = zone1 r -> (∀(nr : ptr (bv 64%N)) (nx : ptr (bv 64%N)) (m : mem), writable nr = true ∧ value nx (bv_signed sz) = value x (bv_signed sz) ∧ (valid nr (bv_signed sz) ∧ valid nx (bv_signed sz)) ∧ (0%Z ≤ offset nx ∧ offset nx + bv_signed sz ≤ offset nr) ∧ (zr m = zone1 r1 ∧ zx m = zone1 x1) ∧ (bv_signed (mr m) = C.max r ∧ bv_signed (mx m) = C.max x) ∧ (lr m = lx m ∧ lx m = sz) ∧ ok m = true ∧ map_eq_sub_shift (pelts nx) (pelts x1) (offset nx) (offset x1) (bv_signed sz) ∧ map_eq_sub_shift (pelts nr) (pelts r1) (offset nr) (offset r1) (bv_signed sz) ∧ (pelts r1 = pelts r ∧ pelts x1 = pelts x) ∧ (plength r1 = plength r ∧ plength x1 = plength x) ∧ (min r1 = min r ∧ min x1 = min x) ∧ data nr = data nx -> ((0%Z < bv_unsigned cnt ∧ bv_unsigned cnt < 64%Z) ∧ valid nx (bv_signed sz) ∧ valid nr (bv_signed sz) ∧ 0%Z < bv_signed sz ∧ writable nr = true ∧ (offset nr ≤ offset nx ∨ offset nx + bv_signed sz ≤ offset nr)) ∧ (∀(nx1 : ptr (bv 64%N)) (nr1 : ptr (bv 64%N)), data nx1 = data nr1 ∧ length (data nr1) = length (data nx) ∧ offset nx1 = offset nx ∧ min nx1 = min nx ∧ C.max nx1 = C.max nx ∧ writable nx1 = writable nx ∧ zone1 nx1 = zone1 nx -> length (data nr1) = length (data nr) ∧ offset nr1 = offset nr ∧ min nr1 = min nr ∧ C.max nr1 = C.max nr ∧ writable nr1 = writable nr ∧ zone1 nr1 = zone1 nr -> (∀(res : bv 64%N), bv_unsigned res + (18446744073709551615%Z + 1%Z) * value nr1 (bv_signed sz) = value nx (bv_signed sz) * Z.pow 2%Z (64%Z - bv_unsigned cnt) ∧ (∀(j : Z), j < offset nr1 ∨ offset nr1 + bv_signed sz ≤ j -> pelts nr1 j = pelts nr j) ∧ (min nr1 = min nr ∧ C.max nr1 = C.max nr ∧ plength nr1 = plength nr) ∧ min nx1 = min nx ∧ C.max nx1 = C.max nx ∧ plength nx1 = plength nx -> ((writable r1 = true ∧ writable nr1 = true) ∧ ok m = true ∧ 0%Z ≤ bv_signed sz ∧ (0%Z ≤ offset nx1 ∧ offset nx1 + bv_signed sz ≤ offset nr1) ∧ (zx m = zone1 x1 ∧ zr m = zone1 r1) ∧ lx m = lr m ∧ lr m = sz) ∧ (∀(m1 : mem) (nx2 : ptr (bv 64%N)) (nr2 : ptr (bv 64%N)) (x2 : ptr (bv 64%N)) (r2 : ptr (bv 64%N)), zr m1 = zr m ∧ zx m1 = zx m ∧ zy m1 = zy m ∧ mr m1 = mr m ∧ mx m1 = mx m ∧ my m1 = my m ∧ lr m1 = lr m ∧ lx m1 = lx m ∧ ly m1 = ly m -> offset nx2 = offset nx1 ∧ writable nx2 = writable nx1 ∧ zone1 nx2 = zone1 nx1 -> offset nr2 = offset nr1 ∧ writable nr2 = writable nr1 ∧ zone1 nr2 = zone1 nr1 -> offset x2 = offset x1 ∧ min x2 = min x1 ∧ writable x2 = writable x1 ∧ zone1 x2 = zone1 x1 -> offset r2 = offset r1 ∧ min r2 = min r1 ∧ writable r2 = writable r1 ∧ zone1 r2 = zone1 r1 -> (C.max x2 = bv_signed (mx m1) ∧ C.max r2 = bv_signed (mr m1)) ∧ map_eq_sub_shift (pelts nx1) (pelts x2) (offset nx2) (offset x2) (bv_signed sz) ∧ map_eq_sub_shift (pelts nr1) (pelts r2) (offset nr2) (offset r2) (bv_signed sz) ∧ (∀(j : Z), j < offset x2 ∨ offset x2 + bv_signed sz ≤ j -> pelts x2 j = pelts x1 j) ∧ (∀(j : Z), j < offset r2 ∨ offset r2 + bv_signed sz ≤ j -> pelts r2 j = pelts r1 j) ∧ (plength x2 = plength x1 ∧ plength r2 = plength r1) ∧ min r2 = min r1 ∧ min x2 = min x1 -> bv_unsigned res + (18446744073709551615%Z + 1%Z) * value r2 (bv_signed sz) = value x2 (bv_signed sz) * Z.pow 2%Z (64%Z - bv_unsigned cnt) ∧ (∀(j : Z), j < offset r2 ∨ offset r2 + bv_signed sz ≤ j -> pelts r2 j = pelts r j) ∧ pelts x2 = pelts x ∧ (min x2 = min x ∧ C.max x2 = C.max x ∧ plength x2 = plength x) ∧ min r2 = min r ∧ C.max r2 = C.max r ∧ plength r2 = plength r))))).
Admitted.

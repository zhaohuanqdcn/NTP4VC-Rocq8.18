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
Require Import multiprecision.ptralias.Alias.
Open Scope Z_scope.
Theorem wmpn_copyd_sep'vc (up : ptr (bv 64%N)) (n : bv 32%N) (rp : ptr (bv 64%N)) (fact0 : valid up (bv_signed n)) (fact1 : valid rp (bv_signed n)) (fact2 : writable rp = true) : valid rp (bv_signed n) ∧ valid up (bv_signed n) ∧ 0%Z ≤ bv_signed n ∧ writable rp = true ∧ (∀(up1 : ptr (bv 64%N)) (rp1 : ptr (bv 64%N)), offset up1 = offset up ∧ writable up1 = writable up ∧ zone1 up1 = zone1 up -> offset rp1 = offset rp ∧ writable rp1 = writable rp ∧ zone1 rp1 = zone1 rp -> (∀(nr : ptr (bv 64%N)) (nx : ptr (bv 64%N)) (m : mem), writable nr = true ∧ value nx (bv_signed n) = value up (bv_signed n) ∧ (valid nr (bv_signed n) ∧ valid nx (bv_signed n)) ∧ (0%Z ≤ offset nx ∧ offset nx + bv_signed n ≤ offset nr) ∧ (zr m = zone1 rp1 ∧ zx m = zone1 up1) ∧ (bv_signed (mr m) = C.max rp ∧ bv_signed (mx m) = C.max up) ∧ (lr m = lx m ∧ lx m = n) ∧ ok m = true ∧ map_eq_sub_shift (pelts nx) (pelts up1) (offset nx) (offset up1) (bv_signed n) ∧ map_eq_sub_shift (pelts nr) (pelts rp1) (offset nr) (offset rp1) (bv_signed n) ∧ (pelts rp1 = pelts rp ∧ pelts up1 = pelts up) ∧ (plength rp1 = plength rp ∧ plength up1 = plength up) ∧ (min rp1 = min rp ∧ min up1 = min up) ∧ data nr = data nx -> (valid nx (bv_signed n) ∧ valid nr (bv_signed n) ∧ writable nr = true ∧ (offset nx ≤ offset nr ∨ offset nr + bv_signed n ≤ offset nx)) ∧ (∀(nx1 : ptr (bv 64%N)) (nr1 : ptr (bv 64%N)), data nx1 = data nr1 ∧ length (data nr1) = length (data nx) ∧ offset nx1 = offset nx ∧ min nx1 = min nx ∧ C.max nx1 = C.max nx ∧ writable nx1 = writable nx ∧ zone1 nx1 = zone1 nx -> length (data nr1) = length (data nr) ∧ offset nr1 = offset nr ∧ min nr1 = min nr ∧ C.max nr1 = C.max nr ∧ writable nr1 = writable nr ∧ zone1 nr1 = zone1 nr -> map_eq_sub_shift (pelts nr1) (pelts nx) (offset nr1) (offset nx1) (bv_signed n) ∧ (∀(j : Z), j < offset nr1 ∨ offset nr1 + bv_signed n ≤ j -> pelts nr1 j = pelts nr j) -> ((writable rp1 = true ∧ writable nr1 = true) ∧ ok m = true ∧ 0%Z ≤ bv_signed n ∧ (0%Z ≤ offset nx1 ∧ offset nx1 + bv_signed n ≤ offset nr1) ∧ (zx m = zone1 up1 ∧ zr m = zone1 rp1) ∧ lx m = lr m ∧ lr m = n) ∧ (∀(m1 : mem) (nx2 : ptr (bv 64%N)) (nr2 : ptr (bv 64%N)) (up2 : ptr (bv 64%N)) (rp2 : ptr (bv 64%N)), zr m1 = zr m ∧ zx m1 = zx m ∧ zy m1 = zy m ∧ mr m1 = mr m ∧ mx m1 = mx m ∧ my m1 = my m ∧ lr m1 = lr m ∧ lx m1 = lx m ∧ ly m1 = ly m -> offset nx2 = offset nx1 ∧ writable nx2 = writable nx1 ∧ zone1 nx2 = zone1 nx1 -> offset nr2 = offset nr1 ∧ writable nr2 = writable nr1 ∧ zone1 nr2 = zone1 nr1 -> offset up2 = offset up1 ∧ min up2 = min up1 ∧ writable up2 = writable up1 ∧ zone1 up2 = zone1 up1 -> offset rp2 = offset rp1 ∧ min rp2 = min rp1 ∧ writable rp2 = writable rp1 ∧ zone1 rp2 = zone1 rp1 -> (C.max up2 = bv_signed (mx m1) ∧ C.max rp2 = bv_signed (mr m1)) ∧ map_eq_sub_shift (pelts nx1) (pelts up2) (offset nx2) (offset up2) (bv_signed n) ∧ map_eq_sub_shift (pelts nr1) (pelts rp2) (offset nr2) (offset rp2) (bv_signed n) ∧ (∀(j : Z), j < offset up2 ∨ offset up2 + bv_signed n ≤ j -> pelts up2 j = pelts up1 j) ∧ (∀(j : Z), j < offset rp2 ∨ offset rp2 + bv_signed n ≤ j -> pelts rp2 j = pelts rp1 j) ∧ (plength up2 = plength up1 ∧ plength rp2 = plength rp1) ∧ min rp2 = min rp1 ∧ min up2 = min up1 -> map_eq_sub_shift (pelts rp2) (pelts up) (offset rp2) (offset up) (bv_signed n) ∧ (∀(j : Z), j < offset rp2 ∨ offset rp2 + bv_signed n ≤ j -> pelts rp2 j = pelts rp j) ∧ (∀(j : Z), pelts up2 j = pelts up j) ∧ (min up2 = min up ∧ C.max up2 = C.max up ∧ plength up2 = plength up) ∧ min rp2 = min rp ∧ C.max rp2 = C.max rp ∧ plength rp2 = plength rp)))).
Admitted.

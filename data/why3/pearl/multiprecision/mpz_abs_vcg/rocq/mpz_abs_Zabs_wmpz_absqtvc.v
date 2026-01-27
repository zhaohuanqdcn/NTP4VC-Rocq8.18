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
Require Import multiprecision.lemmas.Lemmas.
Require Import multiprecision.types.Config.
Require Import multiprecision.types.Types.
Require Import multiprecision.types.Int32Eq.
Require Import multiprecision.types.UInt64Eq.
Require Import multiprecision.util.Util.
Require Import multiprecision.ptralias.Alias.
Require Import multiprecision.compare.Compare.
Require Import multiprecision.mpz.Z.
Require Import multiprecision.mpz.Zutil.
Open Scope Z_scope.
Theorem wmpz_abs'vc (mpz : mpz_memo) (u : mpz_ptr) (w : mpz_ptr) (fact0 : readers mpz u = 0%Z) (fact1 : readers mpz w = 0%Z) (fact2 : 1%Z ≤ alloc mpz w) (fact3 : 1%Z ≤ alloc mpz u) : - 2%Z < readers mpz u ∧ (∀(size : bv 32%N), bv_signed size = abs_size mpz u -> mpz_eq u w = (u = w) -> (if decide (¬ mpz_eq u w) then (readers mpz w = 0%Z ∧ 1%Z ≤ alloc mpz w) ∧ (∀(mpz1 : mpz_memo), sgn mpz1 = sgn mpz -> (∀(wp : C.ptr (bv 64%N)), (∀(y : mpz_ptr), ¬ y = w -> mpz_unchanged y mpz1 mpz) ∧ readers mpz1 w = - 1%Z ∧ abs_value_of mpz1 w = value wp (abs_size mpz1 w) ∧ zones mpz1 w = zone1 wp ∧ offset wp = 0%Z ∧ plength wp = alloc mpz1 w ∧ min wp = 0%Z ∧ C.max wp = plength wp ∧ writable wp = true ∧ abs_size mpz1 w = abs_size mpz w ∧ value wp (abs_size mpz w) = abs_value_of mpz w ∧ (if decide (alloc mpz w < bv_signed size) then alloc mpz1 w = bv_signed size else alloc mpz1 w = alloc mpz w) -> 0%Z ≤ readers mpz1 u ∧ (∀(mpz2 : mpz_memo), abs_value_of mpz2 = abs_value_of mpz1 ∧ alloc mpz2 = alloc mpz1 ∧ abs_size mpz2 = abs_size mpz1 ∧ sgn mpz2 = sgn mpz1 ∧ zones mpz2 = zones mpz1 -> (∀(up : C.ptr (bv 64%N)), readers mpz2 u = readers mpz1 u + 1%Z ∧ (∀(y : mpz_ptr), ¬ u = y -> readers mpz2 y = readers mpz1 y) ∧ value up (abs_size mpz2 u) = abs_value_of mpz2 u ∧ plength up = alloc mpz2 u ∧ offset up = 0%Z ∧ min up = 0%Z ∧ C.max up = plength up ∧ zone1 up = zones mpz2 u -> (valid up (bv_signed size) ∧ valid wp (bv_signed size) ∧ writable wp = true) ∧ (∀(up1 : C.ptr (bv 64%N)) (wp1 : C.ptr (bv 64%N)), offset up1 = offset up ∧ writable up1 = writable up ∧ zone1 up1 = zone1 up -> offset wp1 = offset wp ∧ writable wp1 = writable wp ∧ zone1 wp1 = zone1 wp -> map_eq_sub_shift (pelts wp1) (pelts up) (offset wp1) (offset up) (bv_signed size) ∧ (∀(j : Z), j < offset wp1 ∨ offset wp1 + bv_signed size ≤ j -> pelts wp1 j = pelts wp j) ∧ (∀(j : Z), pelts up1 j = pelts up j) ∧ (min up1 = min up ∧ C.max up1 = C.max up ∧ plength up1 = plength up) ∧ min wp1 = min wp ∧ C.max wp1 = C.max wp ∧ plength wp1 = plength wp -> (zones mpz2 u = zone1 up1 ∧ 1%Z ≤ readers mpz2 u ∧ min up1 = 0%Z ∧ C.max up1 = plength up1) ∧ (∀(mpz3 : mpz_memo), abs_value_of mpz3 = abs_value_of mpz2 ∧ alloc mpz3 = alloc mpz2 ∧ abs_size mpz3 = abs_size mpz2 ∧ sgn mpz3 = sgn mpz2 ∧ zones mpz3 = zones mpz2 -> readers mpz3 u = readers mpz2 u - 1%Z ∧ (∀(y : mpz_ptr), ¬ y = u -> readers mpz3 y = readers mpz2 y) -> (zones mpz3 w = zone1 wp1 ∧ readers mpz3 w = - 1%Z ∧ offset wp1 = 0%Z ∧ min wp1 = 0%Z ∧ C.max wp1 = plength wp1 ∧ Z.abs (bv_signed size) ≤ plength wp1 ∧ plength wp1 = alloc mpz3 w ∧ (¬ bv_signed size = 0%Z -> Z.pow (18446744073709551615%Z + 1%Z) (Z.abs (bv_signed size) - 1%Z) ≤ value wp1 (Z.abs (bv_signed size)))) ∧ (∀(mpz4 : mpz_memo), alloc mpz4 = alloc mpz3 ∧ readers mpz4 = readers mpz3 ∧ zones mpz4 = zones mpz3 -> (∀(y : mpz_ptr), ¬ y = w -> mpz_unchanged y mpz4 mpz3) ∧ (sgn mpz4 w = 1%Z) = (0%Z ≤ bv_signed size) ∧ (sgn mpz4 w = - 1%Z) = (bv_signed size < 0%Z) ∧ abs_size mpz4 w = Z.abs (bv_signed size) ∧ abs_value_of mpz4 w = value wp1 (Z.abs (bv_signed size)) -> (zones mpz4 w = zone1 wp1 ∧ readers mpz4 w = - 1%Z ∧ min wp1 = 0%Z ∧ C.max wp1 = plength wp1 ∧ abs_value_of mpz4 w = value wp1 (abs_size mpz4 w)) ∧ (∀(mpz5 : mpz_memo), abs_value_of mpz5 = abs_value_of mpz4 ∧ alloc mpz5 = alloc mpz4 ∧ abs_size mpz5 = abs_size mpz4 ∧ sgn mpz5 = sgn mpz4 ∧ zones mpz5 = zones mpz4 -> readers mpz5 w = 0%Z ∧ (∀(y : mpz_ptr), ¬ y = w -> readers mpz5 y = readers mpz4 y) -> (readers mpz5 u = 0%Z ∧ readers mpz5 w = 0%Z) ∧ value_of w mpz5 = Z.abs (value_of u mpz) ∧ (∀(x : mpz_ptr), ¬ x = w -> mpz_unchanged x mpz5 mpz))))))))) else readers mpz w = 0%Z ∧ (∀(mpz1 : mpz_memo), abs_value_of mpz1 = abs_value_of mpz ∧ alloc mpz1 = alloc mpz ∧ abs_size mpz1 = abs_size mpz ∧ sgn mpz1 = sgn mpz ∧ zones mpz1 = zones mpz -> (∀(wp : C.ptr (bv 64%N)), readers mpz1 w = - 1%Z ∧ (∀(y : mpz_ptr), ¬ w = y -> readers mpz1 y = readers mpz y) ∧ value wp (abs_size mpz1 w) = abs_value_of mpz1 w ∧ plength wp = alloc mpz1 w ∧ offset wp = 0%Z ∧ min wp = 0%Z ∧ C.max wp = plength wp ∧ writable wp = true ∧ zone1 wp = zones mpz1 w -> (zones mpz1 w = zone1 wp ∧ readers mpz1 w = - 1%Z ∧ offset wp = 0%Z ∧ min wp = 0%Z ∧ C.max wp = plength wp ∧ Z.abs (bv_signed size) ≤ plength wp ∧ plength wp = alloc mpz1 w ∧ (¬ bv_signed size = 0%Z -> Z.pow (18446744073709551615%Z + 1%Z) (Z.abs (bv_signed size) - 1%Z) ≤ value wp (Z.abs (bv_signed size)))) ∧ (∀(mpz2 : mpz_memo), alloc mpz2 = alloc mpz1 ∧ readers mpz2 = readers mpz1 ∧ zones mpz2 = zones mpz1 -> (∀(y : mpz_ptr), ¬ y = w -> mpz_unchanged y mpz2 mpz1) ∧ (sgn mpz2 w = 1%Z) = (0%Z ≤ bv_signed size) ∧ (sgn mpz2 w = - 1%Z) = (bv_signed size < 0%Z) ∧ abs_size mpz2 w = Z.abs (bv_signed size) ∧ abs_value_of mpz2 w = value wp (Z.abs (bv_signed size)) -> (zones mpz2 w = zone1 wp ∧ readers mpz2 w = - 1%Z ∧ min wp = 0%Z ∧ C.max wp = plength wp ∧ abs_value_of mpz2 w = value wp (abs_size mpz2 w)) ∧ (∀(mpz3 : mpz_memo), abs_value_of mpz3 = abs_value_of mpz2 ∧ alloc mpz3 = alloc mpz2 ∧ abs_size mpz3 = abs_size mpz2 ∧ sgn mpz3 = sgn mpz2 ∧ zones mpz3 = zones mpz2 -> readers mpz3 w = 0%Z ∧ (∀(y : mpz_ptr), ¬ y = w -> readers mpz3 y = readers mpz2 y) -> (readers mpz3 u = 0%Z ∧ readers mpz3 w = 0%Z) ∧ value_of w mpz3 = Z.abs (value_of u mpz) ∧ (∀(x : mpz_ptr), ¬ x = w -> mpz_unchanged x mpz3 mpz))))))).
Admitted.

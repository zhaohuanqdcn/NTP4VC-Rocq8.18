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
Require Import multiprecision.lemmas.Lemmas.
Require Import multiprecision.types.Config.
Require Import multiprecision.types.Types.
Require Import multiprecision.types.Int32Eq.
Require Import multiprecision.types.UInt64Eq.
Require Import multiprecision.compare.Compare.
Require Import multiprecision.ptralias.Alias.
Require Import multiprecision.mpz.Z.
Require Import multiprecision.mpz.Zutil.
Open Scope Z_scope.
Theorem wmpz_cmpabs'vc (mpz : mpz_memo) (u : mpz_ptr) (v : mpz_ptr) (fact0 : 0%Z ≤ readers mpz u) (fact1 : 0%Z ≤ readers mpz v) : - 2%Z < readers mpz u ∧ (∀(usize : bv 32%N), bv_signed usize = abs_size mpz u -> - 2%Z < readers mpz v ∧ (∀(vsize : bv 32%N), bv_signed vsize = abs_size mpz v -> int'32_in_bounds (bv_signed usize - bv_signed vsize) ∧ (∀(dsize : bv 32%N), bv_signed dsize = bv_signed usize - bv_signed vsize -> (bv_signed dsize = 0%Z -> dsize = (0%bv : bv 32%N)) -> (if decide (¬ dsize = (0%bv : bv 32%N)) then (∀(w : mpz_ptr), mpz_unchanged w mpz mpz) ∧ (0%Z < bv_signed dsize -> Z.abs (value_of v mpz) < Z.abs (value_of u mpz)) ∧ (bv_signed dsize < 0%Z -> Z.abs (value_of u mpz) < Z.abs (value_of v mpz)) ∧ (bv_signed dsize = 0%Z -> Z.abs (value_of u mpz) = Z.abs (value_of v mpz)) else 0%Z ≤ readers mpz u ∧ (∀(mpz1 : mpz_memo), abs_value_of mpz1 = abs_value_of mpz ∧ alloc mpz1 = alloc mpz ∧ abs_size mpz1 = abs_size mpz ∧ sgn mpz1 = sgn mpz ∧ zones mpz1 = zones mpz -> (∀(up : C.ptr (bv 64%N)), readers mpz1 u = readers mpz u + 1%Z ∧ (∀(y : mpz_ptr), ¬ u = y -> readers mpz1 y = readers mpz y) ∧ value up (abs_size mpz1 u) = abs_value_of mpz1 u ∧ plength up = alloc mpz1 u ∧ offset up = 0%Z ∧ min up = 0%Z ∧ C.max up = plength up ∧ zone1 up = zones mpz1 u -> 0%Z ≤ readers mpz1 v ∧ (∀(mpz2 : mpz_memo), abs_value_of mpz2 = abs_value_of mpz1 ∧ alloc mpz2 = alloc mpz1 ∧ abs_size mpz2 = abs_size mpz1 ∧ sgn mpz2 = sgn mpz1 ∧ zones mpz2 = zones mpz1 -> (∀(vp : C.ptr (bv 64%N)), readers mpz2 v = readers mpz1 v + 1%Z ∧ (∀(y : mpz_ptr), ¬ v = y -> readers mpz2 y = readers mpz1 y) ∧ value vp (abs_size mpz2 v) = abs_value_of mpz2 v ∧ plength vp = alloc mpz2 v ∧ offset vp = 0%Z ∧ min vp = 0%Z ∧ C.max vp = plength vp ∧ zone1 vp = zones mpz2 v -> (valid up (bv_signed usize) ∧ valid vp (bv_signed usize)) ∧ (∀(cmp : bv 32%N), bv_signed cmp = compare_int (value up (bv_signed usize)) (value vp (bv_signed usize)) -> (zones mpz2 u = zone1 up ∧ 1%Z ≤ readers mpz2 u ∧ min up = 0%Z ∧ C.max up = plength up) ∧ (∀(mpz3 : mpz_memo), abs_value_of mpz3 = abs_value_of mpz2 ∧ alloc mpz3 = alloc mpz2 ∧ abs_size mpz3 = abs_size mpz2 ∧ sgn mpz3 = sgn mpz2 ∧ zones mpz3 = zones mpz2 -> readers mpz3 u = readers mpz2 u - 1%Z ∧ (∀(y : mpz_ptr), ¬ y = u -> readers mpz3 y = readers mpz2 y) -> (zones mpz3 v = zone1 vp ∧ 1%Z ≤ readers mpz3 v ∧ min vp = 0%Z ∧ C.max vp = plength vp) ∧ (∀(mpz4 : mpz_memo), abs_value_of mpz4 = abs_value_of mpz3 ∧ alloc mpz4 = alloc mpz3 ∧ abs_size mpz4 = abs_size mpz3 ∧ sgn mpz4 = sgn mpz3 ∧ zones mpz4 = zones mpz3 -> readers mpz4 v = readers mpz3 v - 1%Z ∧ (∀(y : mpz_ptr), ¬ y = v -> readers mpz4 y = readers mpz3 y) -> (∀(w : mpz_ptr), mpz_unchanged w mpz4 mpz) ∧ (0%Z < bv_signed cmp -> Z.abs (value_of v mpz4) < Z.abs (value_of u mpz4)) ∧ (bv_signed cmp < 0%Z -> Z.abs (value_of u mpz4) < Z.abs (value_of v mpz4)) ∧ (bv_signed cmp = 0%Z -> Z.abs (value_of u mpz4) = Z.abs (value_of v mpz4))))))))))))).
Proof.
Admitted.

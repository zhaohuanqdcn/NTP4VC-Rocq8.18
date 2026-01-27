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
Require Import multiprecision.compare.Compare.
Require Import multiprecision.ptralias.Alias.
Require Import multiprecision.mpz.Z.
Require Import multiprecision.mpz.Zutil.
Open Scope Z_scope.
Theorem wmpz_cmp_ui'vc (mpz : mpz_memo) (u : mpz_ptr) (v_digit : bv 64%N) (fact0 : 0%Z ≤ readers mpz u) : - 2%Z < readers mpz u ∧ (∀(un : bv 32%N), bv_signed un = sgn mpz u * abs_size mpz u -> (∀(o1 : bool), (bv_signed un = bv_signed (0%bv : bv 32%N) -> o1 = true) ∧ (o1 = true -> un = (0%bv : bv 32%N)) -> (if decide (o1 = true) then ∀(o2 : bool), (bv_unsigned v_digit = bv_unsigned (0%bv : bv 64%N) -> o2 = true) ∧ (o2 = true -> v_digit = (0%bv : bv 64%N)) -> (∀(r : bv 32%N), (if decide (¬ o2 = true) then r = ((-1)%bv : bv 32%N) else r = (0%bv : bv 32%N)) -> (∀(w : mpz_ptr), mpz_unchanged w mpz mpz) ∧ (0%Z < bv_signed r -> bv_unsigned v_digit < value_of u mpz) ∧ (bv_signed r < 0%Z -> value_of u mpz < bv_unsigned v_digit) ∧ (bv_signed r = 0%Z -> value_of u mpz = bv_unsigned v_digit)) else ∀(o2 : bool), (bv_signed un = bv_signed (1%bv : bv 32%N) -> o2 = true) ∧ (o2 = true -> un = (1%bv : bv 32%N)) -> (if decide (o2 = true) then 0%Z ≤ readers mpz u ∧ (∀(mpz1 : mpz_memo), abs_value_of mpz1 = abs_value_of mpz ∧ alloc mpz1 = alloc mpz ∧ abs_size mpz1 = abs_size mpz ∧ sgn mpz1 = sgn mpz ∧ zones mpz1 = zones mpz -> (∀(up : C.ptr (bv 64%N)), readers mpz1 u = readers mpz u + 1%Z ∧ (∀(y : mpz_ptr), ¬ u = y -> readers mpz1 y = readers mpz y) ∧ value up (abs_size mpz1 u) = abs_value_of mpz1 u ∧ plength up = alloc mpz1 u ∧ offset up = 0%Z ∧ min up = 0%Z ∧ C.max up = plength up ∧ zone1 up = zones mpz1 u -> (min up ≤ offset up ∧ offset up < C.max up) ∧ (let ul : bv 64%N := pelts up (offset up) in (zones mpz1 u = zone1 up ∧ 1%Z ≤ readers mpz1 u ∧ min up = 0%Z ∧ C.max up = plength up) ∧ (∀(mpz2 : mpz_memo), abs_value_of mpz2 = abs_value_of mpz1 ∧ alloc mpz2 = alloc mpz1 ∧ abs_size mpz2 = abs_size mpz1 ∧ sgn mpz2 = sgn mpz1 ∧ zones mpz2 = zones mpz1 -> readers mpz2 u = readers mpz1 u - 1%Z ∧ (∀(y : mpz_ptr), ¬ y = u -> readers mpz2 y = readers mpz1 y) -> (if decide (bv_unsigned v_digit < bv_unsigned ul) then (∀(w : mpz_ptr), mpz_unchanged w mpz2 mpz) ∧ (0%Z < 1%Z -> bv_unsigned v_digit < value_of u mpz2) ∧ (1%Z < 0%Z -> value_of u mpz2 < bv_unsigned v_digit) ∧ (1%Z = 0%Z -> value_of u mpz2 = bv_unsigned v_digit) else if decide (bv_unsigned ul < bv_unsigned v_digit) then (∀(w : mpz_ptr), mpz_unchanged w mpz2 mpz) ∧ (0%Z < - 1%Z -> bv_unsigned v_digit < value_of u mpz2) ∧ (- 1%Z < 0%Z -> value_of u mpz2 < bv_unsigned v_digit) ∧ (- 1%Z = 0%Z -> value_of u mpz2 = bv_unsigned v_digit) else (∀(w : mpz_ptr), mpz_unchanged w mpz2 mpz) ∧ (0%Z < 0%Z -> bv_unsigned v_digit < value_of u mpz2) ∧ (0%Z < 0%Z -> value_of u mpz2 < bv_unsigned v_digit) ∧ value_of u mpz2 = bv_unsigned v_digit))))) else ∀(r : bv 32%N), (if decide (0%Z < bv_signed un) then r = (1%bv : bv 32%N) else r = ((-1)%bv : bv 32%N)) -> (∀(w : mpz_ptr), mpz_unchanged w mpz mpz) ∧ (0%Z < bv_signed r -> bv_unsigned v_digit < value_of u mpz) ∧ (bv_signed r < 0%Z -> value_of u mpz < bv_unsigned v_digit) ∧ (bv_signed r = 0%Z -> value_of u mpz = bv_unsigned v_digit))))).
Admitted.

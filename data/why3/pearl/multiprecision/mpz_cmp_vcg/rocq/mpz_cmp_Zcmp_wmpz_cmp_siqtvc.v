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
Require Import multiprecision.mpz_getset.Set.
Open Scope Z_scope.
Theorem wmpz_cmp_si'vc (mpz : mpz_memo) (u : mpz_ptr) (v_digit : bv 64%N) (fact0 : 0%Z ≤ readers mpz u) (fact1 : abs_size mpz u < 2147483647%Z) : - 2%Z < readers mpz u ∧ (∀(usize : bv 32%N), bv_signed usize = sgn mpz u * abs_size mpz u -> (∀(o1 : bv 32%N), (if decide (bv_signed v_digit < 0%Z) then o1 = (1%bv : bv 32%N) else o1 = (0%bv : bv 32%N)) -> (∀(o2 : bv 32%N), (if decide (0%Z < bv_signed v_digit) then o2 = (1%bv : bv 32%N) else o2 = (0%bv : bv 32%N)) -> int'32_in_bounds (bv_signed o2 - bv_signed o1) ∧ (∀(vsize : bv 32%N), bv_signed vsize = bv_signed o2 - bv_signed o1 -> (∀(o3 : bool), (bv_signed usize = bv_signed (0%bv : bv 32%N) -> o3 = true) ∧ (o3 = true -> usize = (0%bv : bv 32%N)) -> (∀(o4 : bool), (if decide (o3 = true) then o4 = true else ∃(o5 : bool), ((bv_signed usize = bv_signed vsize -> o5 = true) ∧ (o5 = true -> usize = vsize)) ∧ o4 = (if decide (o5 = true) then false else true)) -> (if decide (o4 = true) then int'32_in_bounds (bv_signed usize - bv_signed vsize) ∧ (∀(r : bv 32%N), bv_signed r = bv_signed usize - bv_signed vsize -> (∀(w : mpz_ptr), mpz_unchanged w mpz mpz) ∧ (0%Z < bv_signed r -> bv_signed v_digit < value_of u mpz) ∧ (bv_signed r < 0%Z -> value_of u mpz < bv_signed v_digit) ∧ (bv_signed r = 0%Z -> value_of u mpz = bv_signed v_digit)) else 0%Z ≤ readers mpz u ∧ (∀(mpz1 : mpz_memo), abs_value_of mpz1 = abs_value_of mpz ∧ alloc mpz1 = alloc mpz ∧ abs_size mpz1 = abs_size mpz ∧ sgn mpz1 = sgn mpz ∧ zones mpz1 = zones mpz -> (∀(up : C.ptr (bv 64%N)), readers mpz1 u = readers mpz u + 1%Z ∧ (∀(y : mpz_ptr), ¬ u = y -> readers mpz1 y = readers mpz y) ∧ value up (abs_size mpz1 u) = abs_value_of mpz1 u ∧ plength up = alloc mpz1 u ∧ offset up = 0%Z ∧ min up = 0%Z ∧ C.max up = plength up ∧ zone1 up = zones mpz1 u -> (min up ≤ offset up ∧ offset up < C.max up) ∧ (let ul : bv 64%N := pelts up (offset up) in ∀(vl : bv 64%N), bv_unsigned vl = Z.abs (bv_signed v_digit) -> (zones mpz1 u = zone1 up ∧ 1%Z ≤ readers mpz1 u ∧ min up = 0%Z ∧ C.max up = plength up) ∧ (∀(mpz2 : mpz_memo), abs_value_of mpz2 = abs_value_of mpz1 ∧ alloc mpz2 = alloc mpz1 ∧ abs_size mpz2 = abs_size mpz1 ∧ sgn mpz2 = sgn mpz1 ∧ zones mpz2 = zones mpz1 -> readers mpz2 u = readers mpz1 u - 1%Z ∧ (∀(y : mpz_ptr), ¬ y = u -> readers mpz2 y = readers mpz1 y) -> (∀(o5 : bool), (bv_unsigned ul = bv_unsigned vl -> o5 = true) ∧ (o5 = true -> ul = vl) -> (if decide (o5 = true) then (∀(w : mpz_ptr), mpz_unchanged w mpz2 mpz) ∧ (0%Z < 0%Z -> bv_signed v_digit < value_of u mpz2) ∧ (0%Z < 0%Z -> value_of u mpz2 < bv_signed v_digit) ∧ value_of u mpz2 = bv_signed v_digit else if decide (bv_unsigned vl < bv_unsigned ul) then (∀(w : mpz_ptr), mpz_unchanged w mpz2 mpz) ∧ (0%Z < bv_signed usize -> bv_signed v_digit < value_of u mpz2) ∧ (bv_signed usize < 0%Z -> value_of u mpz2 < bv_signed v_digit) ∧ (bv_signed usize = 0%Z -> value_of u mpz2 = bv_signed v_digit) else int'32_in_bounds (- bv_signed usize) ∧ (∀(r : bv 32%N), bv_signed r = - bv_signed usize -> (∀(w : mpz_ptr), mpz_unchanged w mpz2 mpz) ∧ (0%Z < bv_signed r -> bv_signed v_digit < value_of u mpz2) ∧ (bv_signed r < 0%Z -> value_of u mpz2 < bv_signed v_digit) ∧ (bv_signed r = 0%Z -> value_of u mpz2 = bv_signed v_digit))))))))))))))).
Proof.
Admitted.

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
Require Import multiprecision.util.Util.
Require Import multiprecision.ptralias.Alias.
Require Import multiprecision.compare.Compare.
Require Import multiprecision.mpz.Z.
Require Import multiprecision.mpz.Zutil.
Open Scope Z_scope.
Definition alloc_of_bits (bits : Z) : Z := if decide (bits ≤ 0%Z) then 1%Z else ZEuclid.div (bits + 63%Z) 64%Z.
Theorem wmpz_realloc2'vc (mpz : mpz_memo) (x : mpz_ptr) (bits : bv 64%N) (o1 : bv 64%N) (fact0 : readers mpz x = 0%Z) (fact1 : ZEuclid.div (bv_unsigned bits - 1%Z) 64%Z < 2147483647%Z) (fact2 : 1%Z ≤ alloc mpz x) (fact3 : bv_unsigned bits = 0%Z -> bits = (0%bv : bv 64%N)) (fact4 : if decide (¬ bits = (0%bv : bv 64%N)) then o1 = (1%bv : bv 64%N) else o1 = (0%bv : bv 64%N)) : uint'64_in_bounds (bv_unsigned bits - bv_unsigned o1) ∧ (∀(bits1 : bv 64%N), bv_unsigned bits1 = bv_unsigned bits - bv_unsigned o1 -> (¬ 64%Z = 0%Z ∧ uint'64_in_bounds (Z.rem (bv_unsigned bits1) 64%Z)) ∧ (∀(o2 : bv 64%N), bv_unsigned o2 = Z.rem (bv_unsigned bits1) 64%Z -> uint'64_in_bounds (1%Z + bv_unsigned o2) ∧ (∀(o3 : bv 64%N), bv_unsigned o3 = 1%Z + bv_unsigned o2 -> bv_unsigned o3 ≤ 2147483647%Z ∧ (∀(new_alloc : bv 32%N), bv_signed new_alloc = bv_unsigned o3 -> readers mpz x = 0%Z ∧ (∀(mpz1 : mpz_memo), abs_value_of mpz1 = abs_value_of mpz ∧ alloc mpz1 = alloc mpz ∧ abs_size mpz1 = abs_size mpz ∧ sgn mpz1 = sgn mpz ∧ zones mpz1 = zones mpz -> (∀(p : C.ptr (bv 64%N)), readers mpz1 x = - 1%Z ∧ (∀(y : mpz_ptr), ¬ x = y -> readers mpz1 y = readers mpz y) ∧ value p (abs_size mpz1 x) = abs_value_of mpz1 x ∧ plength p = alloc mpz1 x ∧ offset p = 0%Z ∧ min p = 0%Z ∧ C.max p = plength p ∧ writable p = true ∧ zone1 p = zones mpz1 x -> - 2%Z < readers mpz1 x ∧ (∀(os : bv 32%N), bv_signed os = abs_size mpz1 x -> (0%Z ≤ bv_signed new_alloc ∧ offset p = 0%Z ∧ min p = 0%Z ∧ C.max p = plength p ∧ 0%Z < plength p ∧ writable p = true) ∧ (∀(p1 : C.ptr (bv 64%N)), offset p1 = offset p ∧ writable p1 = writable p ∧ zone1 p1 = zone1 p -> (∀(q : C.ptr (bv 64%N)), writable q = true ∧ (¬ zone1 q = null_zone -> min q = 0%Z) ∧ (¬ zone1 q = null_zone -> C.max q = plength q) ∧ offset q = 0%Z ∧ (¬ zone1 q = null_zone -> plength q = bv_signed new_alloc) ∧ (¬ zone1 q = null_zone -> (∀(i : Z), (0%Z ≤ i ∧ i < plength p) ∧ i < bv_signed new_alloc -> pelts q i = pelts p i)) ∧ (zone1 q = null_zone -> p1 = p) -> is_not_null q = (¬ zone1 q = null_zone) -> is_not_null q -> - 2%Z < readers mpz1 x ∧ (∀(o4 : bv 32%N), bv_signed o4 = abs_size mpz1 x -> (if decide (bv_signed new_alloc < bv_signed o4) then (- 1%Z ≤ readers mpz1 x ∧ readers mpz1 x ≤ 0%Z) ∧ (∀(mpz2 : mpz_memo), alloc mpz2 = alloc mpz1 ∧ sgn mpz2 = sgn mpz1 ∧ readers mpz2 = readers mpz1 ∧ zones mpz2 = zones mpz1 -> (∀(y : mpz_ptr), ¬ y = x -> mpz_unchanged y mpz2 mpz1) ∧ abs_size mpz2 x = 0%Z ∧ abs_value_of mpz2 x = 0%Z -> (abs_size mpz2 x ≤ bv_signed new_alloc ∧ - 1%Z ≤ readers mpz2 x ∧ readers mpz2 x ≤ 0%Z) ∧ (∀(mpz3 : mpz_memo), abs_value_of mpz3 = abs_value_of mpz2 ∧ abs_size mpz3 = abs_size mpz2 ∧ sgn mpz3 = sgn mpz2 ∧ readers mpz3 = readers mpz2 ∧ zones mpz3 = zones mpz2 -> (∀(y : mpz_ptr), ¬ y = x -> mpz_unchanged y mpz3 mpz2) ∧ alloc mpz3 x = bv_signed new_alloc -> (offset q = 0%Z ∧ writable q = true ∧ min q = 0%Z ∧ C.max q = plength q ∧ plength q = alloc mpz3 x ∧ (readers mpz3 x = 0%Z ∨ readers mpz3 x = - 1%Z)) ∧ (∀(mpz4 : mpz_memo), alloc mpz4 = alloc mpz3 ∧ abs_size mpz4 = abs_size mpz3 ∧ sgn mpz4 = sgn mpz3 -> (∀(y : mpz_ptr), ¬ y = x -> mpz_unchanged y mpz4 mpz3) ∧ abs_value_of mpz4 x = value q (abs_size mpz4 x) ∧ readers mpz4 x = - 1%Z ∧ zones mpz4 x = zone1 q -> (zones mpz4 x = zone1 q ∧ readers mpz4 x = - 1%Z ∧ min q = 0%Z ∧ C.max q = plength q ∧ abs_value_of mpz4 x = value q (abs_size mpz4 x)) ∧ (∀(mpz5 : mpz_memo), abs_value_of mpz5 = abs_value_of mpz4 ∧ alloc mpz5 = alloc mpz4 ∧ abs_size mpz5 = abs_size mpz4 ∧ sgn mpz5 = sgn mpz4 ∧ zones mpz5 = zones mpz4 -> readers mpz5 x = 0%Z ∧ (∀(y : mpz_ptr), ¬ y = x -> readers mpz5 y = readers mpz4 y) -> (∀(y : mpz_ptr), ¬ y = x -> mpz_unchanged y mpz5 mpz) ∧ readers mpz5 x = 0%Z ∧ alloc mpz5 x = alloc_of_bits (bv_unsigned bits) ∧ (if decide (abs_size mpz x ≤ alloc_of_bits (bv_unsigned bits)) then abs_size mpz5 x = abs_size mpz x ∧ abs_value_of mpz5 x = abs_value_of mpz x else abs_size mpz5 x = 0%Z))))) else (abs_size mpz1 x ≤ bv_signed new_alloc ∧ - 1%Z ≤ readers mpz1 x ∧ readers mpz1 x ≤ 0%Z) ∧ (∀(mpz2 : mpz_memo), abs_value_of mpz2 = abs_value_of mpz1 ∧ abs_size mpz2 = abs_size mpz1 ∧ sgn mpz2 = sgn mpz1 ∧ readers mpz2 = readers mpz1 ∧ zones mpz2 = zones mpz1 -> (∀(y : mpz_ptr), ¬ y = x -> mpz_unchanged y mpz2 mpz1) ∧ alloc mpz2 x = bv_signed new_alloc -> (offset q = 0%Z ∧ writable q = true ∧ min q = 0%Z ∧ C.max q = plength q ∧ plength q = alloc mpz2 x ∧ (readers mpz2 x = 0%Z ∨ readers mpz2 x = - 1%Z)) ∧ (∀(mpz3 : mpz_memo), alloc mpz3 = alloc mpz2 ∧ abs_size mpz3 = abs_size mpz2 ∧ sgn mpz3 = sgn mpz2 -> (∀(y : mpz_ptr), ¬ y = x -> mpz_unchanged y mpz3 mpz2) ∧ abs_value_of mpz3 x = value q (abs_size mpz3 x) ∧ readers mpz3 x = - 1%Z ∧ zones mpz3 x = zone1 q -> (zones mpz3 x = zone1 q ∧ readers mpz3 x = - 1%Z ∧ min q = 0%Z ∧ C.max q = plength q ∧ abs_value_of mpz3 x = value q (abs_size mpz3 x)) ∧ (∀(mpz4 : mpz_memo), abs_value_of mpz4 = abs_value_of mpz3 ∧ alloc mpz4 = alloc mpz3 ∧ abs_size mpz4 = abs_size mpz3 ∧ sgn mpz4 = sgn mpz3 ∧ zones mpz4 = zones mpz3 -> readers mpz4 x = 0%Z ∧ (∀(y : mpz_ptr), ¬ y = x -> readers mpz4 y = readers mpz3 y) -> (∀(y : mpz_ptr), ¬ y = x -> mpz_unchanged y mpz4 mpz) ∧ readers mpz4 x = 0%Z ∧ alloc mpz4 x = alloc_of_bits (bv_unsigned bits) ∧ (if decide (abs_size mpz x ≤ alloc_of_bits (bv_unsigned bits)) then abs_size mpz4 x = abs_size mpz x ∧ abs_value_of mpz4 x = abs_value_of mpz x else abs_size mpz4 x = 0%Z))))))))))))))).
Proof.
Admitted.

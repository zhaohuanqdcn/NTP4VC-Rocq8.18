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
Require Import multiprecision.mpz.Z.
Require Import Why3.mach.int.Unsigned.
Require Import Why3.mach.c.C.
Require Import multiprecision.types.Config.
Require Import multiprecision.types.Types.
Require Import multiprecision.types.Int32Eq.
Require Import multiprecision.types.UInt64Eq.
Require Import multiprecision.lemmas.Lemmas.
Open Scope Z_scope.
Axiom mpz_mem : Type.
Axiom mpz_mem_inhabited : Inhabited mpz_mem.
Global Existing Instance mpz_mem_inhabited.
Axiom mpz_mem_countable : Countable mpz_mem.
Global Existing Instance mpz_mem_countable.
Axiom ptr : mpz_mem -> mpz_ptr.
Axiom ok : mpz_mem -> bool.
Theorem wmpz_do_realloc'vc (sz : bv 32%N) (mpz : mpz_memo) (x : mpz_ptr) (fact0 : 1%Z ≤ bv_signed sz) (fact1 : readers mpz x = 0%Z) (fact2 : 1%Z ≤ alloc mpz x) : readers mpz x = 0%Z ∧ (∀(mpz1 : mpz_memo), abs_value_of mpz1 = abs_value_of mpz ∧ alloc mpz1 = alloc mpz ∧ abs_size mpz1 = abs_size mpz ∧ sgn mpz1 = sgn mpz ∧ zones mpz1 = zones mpz -> (∀(p : C.ptr (bv 64%N)), readers mpz1 x = - 1%Z ∧ (∀(y : mpz_ptr), ¬ x = y -> readers mpz1 y = readers mpz y) ∧ value p (abs_size mpz1 x) = abs_value_of mpz1 x ∧ plength p = alloc mpz1 x ∧ offset p = 0%Z ∧ min p = 0%Z ∧ C.max p = plength p ∧ writable p = true ∧ zone1 p = zones mpz1 x -> - 2%Z < readers mpz1 x ∧ (∀(os : bv 32%N), bv_signed os = abs_size mpz1 x -> (0%Z ≤ bv_signed sz ∧ offset p = 0%Z ∧ min p = 0%Z ∧ C.max p = plength p ∧ 0%Z < plength p ∧ writable p = true) ∧ (∀(p1 : C.ptr (bv 64%N)), offset p1 = offset p ∧ writable p1 = writable p ∧ zone1 p1 = zone1 p -> (∀(q : C.ptr (bv 64%N)), writable q = true ∧ (¬ zone1 q = null_zone -> min q = 0%Z) ∧ (¬ zone1 q = null_zone -> C.max q = plength q) ∧ offset q = 0%Z ∧ (¬ zone1 q = null_zone -> plength q = bv_signed sz) ∧ (¬ zone1 q = null_zone -> (∀(i : Z), (0%Z ≤ i ∧ i < plength p) ∧ i < bv_signed sz -> pelts q i = pelts p i)) ∧ (zone1 q = null_zone -> p1 = p) -> is_not_null q = (¬ zone1 q = null_zone) -> is_not_null q -> - 2%Z < readers mpz1 x ∧ (∀(o1 : bv 32%N), bv_signed o1 = abs_size mpz1 x -> (if decide (bv_signed sz < bv_signed o1) then (- 1%Z ≤ readers mpz1 x ∧ readers mpz1 x ≤ 0%Z) ∧ (∀(mpz2 : mpz_memo), alloc mpz2 = alloc mpz1 ∧ sgn mpz2 = sgn mpz1 ∧ readers mpz2 = readers mpz1 ∧ zones mpz2 = zones mpz1 -> (∀(y : mpz_ptr), ¬ y = x -> mpz_unchanged y mpz2 mpz1) ∧ abs_size mpz2 x = 0%Z ∧ abs_value_of mpz2 x = 0%Z -> (abs_size mpz2 x ≤ bv_signed sz ∧ - 1%Z ≤ readers mpz2 x ∧ readers mpz2 x ≤ 0%Z) ∧ (∀(mpz3 : mpz_memo), abs_value_of mpz3 = abs_value_of mpz2 ∧ abs_size mpz3 = abs_size mpz2 ∧ sgn mpz3 = sgn mpz2 ∧ readers mpz3 = readers mpz2 ∧ zones mpz3 = zones mpz2 -> (∀(y : mpz_ptr), ¬ y = x -> mpz_unchanged y mpz3 mpz2) ∧ alloc mpz3 x = bv_signed sz -> (offset q = 0%Z ∧ writable q = true ∧ min q = 0%Z ∧ C.max q = plength q ∧ plength q = alloc mpz3 x ∧ (readers mpz3 x = 0%Z ∨ readers mpz3 x = - 1%Z)) ∧ (∀(mpz4 : mpz_memo), alloc mpz4 = alloc mpz3 ∧ abs_size mpz4 = abs_size mpz3 ∧ sgn mpz4 = sgn mpz3 -> (∀(y : mpz_ptr), ¬ y = x -> mpz_unchanged y mpz4 mpz3) ∧ abs_value_of mpz4 x = value q (abs_size mpz4 x) ∧ readers mpz4 x = - 1%Z ∧ zones mpz4 x = zone1 q -> (∀(y : mpz_ptr), ¬ y = x -> mpz_unchanged y mpz4 mpz) ∧ readers mpz4 x = - 1%Z ∧ alloc mpz4 x = bv_signed sz ∧ abs_value_of mpz4 x = value q (abs_size mpz4 x) ∧ zones mpz4 x = zone1 q ∧ offset q = 0%Z ∧ plength q = bv_signed sz ∧ min q = 0%Z ∧ C.max q = bv_signed sz ∧ writable q = true ∧ (if decide (abs_size mpz x ≤ bv_signed sz) then abs_size mpz4 x = abs_size mpz x ∧ value q (abs_size mpz x) = abs_value_of mpz x else abs_size mpz4 x = 0%Z)))) else (abs_size mpz1 x ≤ bv_signed sz ∧ - 1%Z ≤ readers mpz1 x ∧ readers mpz1 x ≤ 0%Z) ∧ (∀(mpz2 : mpz_memo), abs_value_of mpz2 = abs_value_of mpz1 ∧ abs_size mpz2 = abs_size mpz1 ∧ sgn mpz2 = sgn mpz1 ∧ readers mpz2 = readers mpz1 ∧ zones mpz2 = zones mpz1 -> (∀(y : mpz_ptr), ¬ y = x -> mpz_unchanged y mpz2 mpz1) ∧ alloc mpz2 x = bv_signed sz -> (offset q = 0%Z ∧ writable q = true ∧ min q = 0%Z ∧ C.max q = plength q ∧ plength q = alloc mpz2 x ∧ (readers mpz2 x = 0%Z ∨ readers mpz2 x = - 1%Z)) ∧ (∀(mpz3 : mpz_memo), alloc mpz3 = alloc mpz2 ∧ abs_size mpz3 = abs_size mpz2 ∧ sgn mpz3 = sgn mpz2 -> (∀(y : mpz_ptr), ¬ y = x -> mpz_unchanged y mpz3 mpz2) ∧ abs_value_of mpz3 x = value q (abs_size mpz3 x) ∧ readers mpz3 x = - 1%Z ∧ zones mpz3 x = zone1 q -> (∀(y : mpz_ptr), ¬ y = x -> mpz_unchanged y mpz3 mpz) ∧ readers mpz3 x = - 1%Z ∧ alloc mpz3 x = bv_signed sz ∧ abs_value_of mpz3 x = value q (abs_size mpz3 x) ∧ zones mpz3 x = zone1 q ∧ offset q = 0%Z ∧ plength q = bv_signed sz ∧ min q = 0%Z ∧ C.max q = bv_signed sz ∧ writable q = true ∧ (if decide (abs_size mpz x ≤ bv_signed sz) then abs_size mpz3 x = abs_size mpz x ∧ value q (abs_size mpz x) = abs_value_of mpz x else abs_size mpz3 x = 0%Z)))))))))).
Proof.
Admitted.

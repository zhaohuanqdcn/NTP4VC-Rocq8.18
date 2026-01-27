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
Theorem wmpz_realloc'vc (mpz : mpz_memo) (x : mpz_ptr) (sz : bv 32%N) (fact0 : readers mpz x = 0%Z) (fact1 : 1%Z ≤ alloc mpz x) : - 2%Z < readers mpz x ∧ (∀(o1 : bv 32%N), bv_signed o1 = alloc mpz x -> (if decide (bv_signed o1 < bv_signed sz) then (1%Z ≤ bv_signed sz ∧ readers mpz x = 0%Z ∧ 1%Z ≤ alloc mpz x) ∧ (∀(mpz1 : mpz_memo), sgn mpz1 = sgn mpz -> (∀(result : C.ptr (bv 64%N)), (∀(y : mpz_ptr), ¬ y = x -> mpz_unchanged y mpz1 mpz) ∧ readers mpz1 x = - 1%Z ∧ alloc mpz1 x = bv_signed sz ∧ abs_value_of mpz1 x = value result (abs_size mpz1 x) ∧ zones mpz1 x = zone1 result ∧ offset result = 0%Z ∧ plength result = bv_signed sz ∧ min result = 0%Z ∧ C.max result = bv_signed sz ∧ writable result = true ∧ (if decide (abs_size mpz x ≤ bv_signed sz) then abs_size mpz1 x = abs_size mpz x ∧ value result (abs_size mpz x) = abs_value_of mpz x else abs_size mpz1 x = 0%Z) -> (∀(y : mpz_ptr), ¬ y = x -> mpz_unchanged y mpz1 mpz) ∧ readers mpz1 x = - 1%Z ∧ abs_value_of mpz1 x = value result (abs_size mpz1 x) ∧ zones mpz1 x = zone1 result ∧ offset result = 0%Z ∧ plength result = alloc mpz1 x ∧ min result = 0%Z ∧ C.max result = plength result ∧ writable result = true ∧ abs_size mpz1 x = abs_size mpz x ∧ value result (abs_size mpz x) = abs_value_of mpz x ∧ (if decide (alloc mpz x < bv_signed sz) then alloc mpz1 x = bv_signed sz else alloc mpz1 x = alloc mpz x))) else readers mpz x = 0%Z ∧ (∀(mpz1 : mpz_memo), abs_value_of mpz1 = abs_value_of mpz ∧ alloc mpz1 = alloc mpz ∧ abs_size mpz1 = abs_size mpz ∧ sgn mpz1 = sgn mpz ∧ zones mpz1 = zones mpz -> (∀(result : C.ptr (bv 64%N)), readers mpz1 x = - 1%Z ∧ (∀(y : mpz_ptr), ¬ x = y -> readers mpz1 y = readers mpz y) ∧ value result (abs_size mpz1 x) = abs_value_of mpz1 x ∧ plength result = alloc mpz1 x ∧ offset result = 0%Z ∧ min result = 0%Z ∧ C.max result = plength result ∧ writable result = true ∧ zone1 result = zones mpz1 x -> (∀(y : mpz_ptr), ¬ y = x -> mpz_unchanged y mpz1 mpz) ∧ readers mpz1 x = - 1%Z ∧ abs_value_of mpz1 x = value result (abs_size mpz1 x) ∧ zones mpz1 x = zone1 result ∧ offset result = 0%Z ∧ plength result = alloc mpz1 x ∧ min result = 0%Z ∧ C.max result = plength result ∧ writable result = true ∧ abs_size mpz1 x = abs_size mpz x ∧ value result (abs_size mpz x) = abs_value_of mpz x ∧ (if decide (alloc mpz x < bv_signed sz) then alloc mpz1 x = bv_signed sz else alloc mpz1 x = alloc mpz x))))).
Admitted.

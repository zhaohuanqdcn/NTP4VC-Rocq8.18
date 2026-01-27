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
Require Import multiprecision.lemmas.Lemmas.
Require Import Why3.mach.int.Unsigned.
Require Import Why3.mach.c.C.
Require Import multiprecision.types.Config.
Require Import multiprecision.types.Types.
Require Import multiprecision.types.Int32Eq.
Require Import multiprecision.types.UInt64Eq.
Require Import multiprecision.mpz.Z.
Require Import multiprecision.mpz.Zutil.
Open Scope Z_scope.
Theorem wmpz_set_ui'vc (mpz : mpz_memo) (dst : mpz_ptr) (src : bv 64%N) (fact0 : 1%Z ≤ alloc mpz dst) (fact1 : readers mpz dst = 0%Z) : readers mpz dst = 0%Z ∧ 1%Z ≤ alloc mpz dst ∧ (∀(mpz1 : mpz_memo), sgn mpz1 = sgn mpz -> (∀(dstp : C.ptr (bv 64%N)), (∀(y : mpz_ptr), ¬ y = dst -> mpz_unchanged y mpz1 mpz) ∧ readers mpz1 dst = - 1%Z ∧ abs_value_of mpz1 dst = value dstp (abs_size mpz1 dst) ∧ zones mpz1 dst = zone1 dstp ∧ offset dstp = 0%Z ∧ plength dstp = alloc mpz1 dst ∧ min dstp = 0%Z ∧ C.max dstp = plength dstp ∧ writable dstp = true ∧ abs_size mpz1 dst = abs_size mpz dst ∧ value dstp (abs_size mpz dst) = abs_value_of mpz dst ∧ (if decide (alloc mpz dst < 1%Z) then alloc mpz1 dst = 1%Z else alloc mpz1 dst = alloc mpz dst) -> ((min dstp ≤ offset dstp ∧ offset dstp < C.max dstp) ∧ writable dstp = true) ∧ (∀(dstp1 : C.ptr (bv 64%N)), length (data dstp1) = length (data dstp) ∧ offset dstp1 = offset dstp ∧ min dstp1 = min dstp ∧ C.max dstp1 = C.max dstp ∧ writable dstp1 = writable dstp ∧ zone1 dstp1 = zone1 dstp -> pelts dstp1 = fun_updt (pelts dstp) (offset dstp1) src -> (bv_unsigned src = 0%Z -> src = (0%bv : bv 64%N)) -> (∀(size : bv 32%N), (if decide (¬ src = (0%bv : bv 64%N)) then size = (1%bv : bv 32%N) else size = (0%bv : bv 32%N)) -> (zones mpz1 dst = zone1 dstp1 ∧ readers mpz1 dst = - 1%Z ∧ offset dstp1 = 0%Z ∧ min dstp1 = 0%Z ∧ C.max dstp1 = plength dstp1 ∧ Z.abs (bv_signed size) ≤ plength dstp1 ∧ plength dstp1 = alloc mpz1 dst ∧ (¬ bv_signed size = 0%Z -> Z.pow (18446744073709551615%Z + 1%Z) (Z.abs (bv_signed size) - 1%Z) ≤ value dstp1 (Z.abs (bv_signed size)))) ∧ (∀(mpz2 : mpz_memo), alloc mpz2 = alloc mpz1 ∧ readers mpz2 = readers mpz1 ∧ zones mpz2 = zones mpz1 -> (∀(y : mpz_ptr), ¬ y = dst -> mpz_unchanged y mpz2 mpz1) ∧ (sgn mpz2 dst = 1%Z) = (0%Z ≤ bv_signed size) ∧ (sgn mpz2 dst = - 1%Z) = (bv_signed size < 0%Z) ∧ abs_size mpz2 dst = Z.abs (bv_signed size) ∧ abs_value_of mpz2 dst = value dstp1 (Z.abs (bv_signed size)) -> (zones mpz2 dst = zone1 dstp1 ∧ readers mpz2 dst = - 1%Z ∧ min dstp1 = 0%Z ∧ C.max dstp1 = plength dstp1 ∧ abs_value_of mpz2 dst = value dstp1 (abs_size mpz2 dst)) ∧ (∀(mpz3 : mpz_memo), abs_value_of mpz3 = abs_value_of mpz2 ∧ alloc mpz3 = alloc mpz2 ∧ abs_size mpz3 = abs_size mpz2 ∧ sgn mpz3 = sgn mpz2 ∧ zones mpz3 = zones mpz2 -> readers mpz3 dst = 0%Z ∧ (∀(y : mpz_ptr), ¬ y = dst -> readers mpz3 y = readers mpz2 y) -> value_of dst mpz3 = bv_unsigned src ∧ (∀(x : mpz_ptr), ¬ x = dst -> mpz_unchanged x mpz3 mpz) ∧ readers mpz3 dst = 0%Z)))))).
Admitted.

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
Theorem wmpz_get_ui'vc (mpz : mpz_memo) (src : mpz_ptr) (fact0 : readers mpz src = 0%Z) : - 2%Z < readers mpz src ∧ (∀(o1 : bv 32%N), bv_signed o1 = sgn mpz src * abs_size mpz src -> (bv_signed o1 = 0%Z -> o1 = (0%bv : bv 32%N)) -> (if decide (o1 = (0%bv : bv 32%N)) then 0%Z = ZEuclid.modulo (Z.abs (value_of src mpz)) (18446744073709551615%Z + 1%Z) ∧ (∀(x : mpz_ptr), mpz_unchanged x mpz mpz) ∧ readers mpz src = 0%Z else 0%Z ≤ readers mpz src ∧ (∀(mpz1 : mpz_memo), abs_value_of mpz1 = abs_value_of mpz ∧ alloc mpz1 = alloc mpz ∧ abs_size mpz1 = abs_size mpz ∧ sgn mpz1 = sgn mpz ∧ zones mpz1 = zones mpz -> (∀(srcp : C.ptr (bv 64%N)), readers mpz1 src = readers mpz src + 1%Z ∧ (∀(y : mpz_ptr), ¬ src = y -> readers mpz1 y = readers mpz y) ∧ value srcp (abs_size mpz1 src) = abs_value_of mpz1 src ∧ plength srcp = alloc mpz1 src ∧ offset srcp = 0%Z ∧ min srcp = 0%Z ∧ C.max srcp = plength srcp ∧ zone1 srcp = zones mpz1 src -> (min srcp ≤ offset srcp ∧ offset srcp < C.max srcp) ∧ (zones mpz1 src = zone1 srcp ∧ 1%Z ≤ readers mpz1 src ∧ min srcp = 0%Z ∧ C.max srcp = plength srcp) ∧ (∀(mpz2 : mpz_memo), abs_value_of mpz2 = abs_value_of mpz1 ∧ alloc mpz2 = alloc mpz1 ∧ abs_size mpz2 = abs_size mpz1 ∧ sgn mpz2 = sgn mpz1 ∧ zones mpz2 = zones mpz1 -> readers mpz2 src = readers mpz1 src - 1%Z ∧ (∀(y : mpz_ptr), ¬ y = src -> readers mpz2 y = readers mpz1 y) -> bv_unsigned (pelts srcp (offset srcp)) = ZEuclid.modulo (Z.abs (value_of src mpz2)) (18446744073709551615%Z + 1%Z) ∧ (∀(x : mpz_ptr), mpz_unchanged x mpz2 mpz) ∧ readers mpz2 src = 0%Z))))).
Proof.
Admitted.

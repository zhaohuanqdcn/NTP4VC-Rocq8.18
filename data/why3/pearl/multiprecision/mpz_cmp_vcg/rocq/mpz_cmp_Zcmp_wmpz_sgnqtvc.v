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
Require Import multiprecision.mpz_getset.Set.
Open Scope Z_scope.
Theorem wmpz_sgn'vc (mpz : mpz_memo) (u : mpz_ptr) (fact0 : 0%Z ≤ readers mpz u) : - 2%Z < readers mpz u ∧ (∀(o1 : bv 32%N), bv_signed o1 = sgn mpz u * abs_size mpz u -> (¬ bv_signed o1 < 0%Z -> - 2%Z < readers mpz u) ∧ (∀(result : bv 32%N), (if decide (bv_signed o1 < 0%Z) then result = ((-1)%bv : bv 32%N) else ∃(o2 : bv 32%N), bv_signed o2 = sgn mpz u * abs_size mpz u ∧ (if decide (0%Z < bv_signed o2) then result = (1%bv : bv 32%N) else result = (0%bv : bv 32%N))) -> (∀(w : mpz_ptr), mpz_unchanged w mpz mpz) ∧ (0%Z < bv_signed result -> 0%Z < value_of u mpz) ∧ (bv_signed result < 0%Z -> value_of u mpz < 0%Z) ∧ (bv_signed result = 0%Z -> value_of u mpz = 0%Z))).
Admitted.

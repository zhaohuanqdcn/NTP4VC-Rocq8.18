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
Require Import multiprecision.types.Config.
Require Import multiprecision.types.Types.
Require Import multiprecision.types.Int32Eq.
Require Import multiprecision.types.UInt64Eq.
Require Import multiprecision.lemmas.Lemmas.
Open Scope Z_scope.
Theorem lsl_mod_ext'vc (cnt : bv 64%N) (x : bv 64%N) (fact0 : 0%Z ≤ bv_unsigned cnt) (fact1 : bv_unsigned cnt < 64%Z) : 0%Z ≤ bv_unsigned cnt ∧ bv_unsigned cnt < 64%Z ∧ (∀(r : bv 64%N), bv_unsigned r = ZEuclid.modulo (bv_unsigned x * Z.pow 2%Z (bv_unsigned cnt)) (18446744073709551615%Z + 1%Z) -> ¬ 18446744073709551615%Z + 1%Z = 0%Z ∧ bv_unsigned r = ZEuclid.modulo (bv_unsigned x * Z.pow 2%Z (bv_unsigned cnt)) (18446744073709551615%Z + 1%Z) ∧ bv_unsigned r ≤ 18446744073709551615%Z + 1%Z - Z.pow 2%Z (bv_unsigned cnt)).
Proof.
Admitted.

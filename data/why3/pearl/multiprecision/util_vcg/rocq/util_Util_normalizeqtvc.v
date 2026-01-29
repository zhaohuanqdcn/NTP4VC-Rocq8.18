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
Theorem normalize'vc (n : bv 32%N) (p : ptr (bv 64%N)) (fact0 : 0%Z ≤ bv_signed n) (fact1 : valid p (bv_signed n)) : 0%Z ≤ bv_signed n ∧ bv_signed n ≤ bv_signed n ∧ (∀(n1 : bv 32%N), value p (bv_signed n1) = value p (bv_signed n) ∧ 0%Z ≤ bv_signed n1 ∧ bv_signed n1 ≤ bv_signed n -> (if decide (0%Z < bv_signed n1) then int'32_in_bounds (bv_signed n1 - 1%Z) ∧ (∀(o1 : bv 32%N), bv_signed o1 = bv_signed n1 - 1%Z -> (min p ≤ offset p + bv_signed o1 ∧ offset p + bv_signed o1 < C.max p) ∧ (let o2 : bv 64%N := pelts p (offset p + bv_signed o1) in ∀(o3 : bool), (bv_unsigned o2 = bv_unsigned (0%bv : bv 64%N) -> o3 = true) ∧ (o3 = true -> o2 = (0%bv : bv 64%N)) -> (if decide (¬ o3 = true) then (0%Z ≤ bv_signed n1 ∧ bv_signed n1 ≤ bv_signed n) ∧ value p (bv_signed n1) = value p (bv_signed n) ∧ (bv_signed n1 = 0%Z ∨ 0%Z < bv_unsigned (pelts p (offset p + bv_signed n1 - 1%Z))) ∧ (bv_signed n1 = 0%Z ∨ Z.pow (18446744073709551615%Z + 1%Z) (bv_signed n1 - 1%Z) ≤ value p (bv_signed n1)) else int'32_in_bounds (bv_signed n1 - 1%Z) ∧ (∀(o4 : bv 32%N), bv_signed o4 = bv_signed n1 - 1%Z -> bv_signed o4 < bv_signed n1 ∧ value p (bv_signed o4) = value p (bv_signed n) ∧ 0%Z ≤ bv_signed o4 ∧ bv_signed o4 ≤ bv_signed n)))) else (0%Z ≤ bv_signed n1 ∧ bv_signed n1 ≤ bv_signed n) ∧ value p (bv_signed n1) = value p (bv_signed n) ∧ (bv_signed n1 = 0%Z ∨ 0%Z < bv_unsigned (pelts p (offset p + bv_signed n1 - 1%Z))) ∧ (bv_signed n1 = 0%Z ∨ Z.pow (18446744073709551615%Z + 1%Z) (bv_signed n1 - 1%Z) ≤ value p (bv_signed n1)))).
Proof.
Admitted.

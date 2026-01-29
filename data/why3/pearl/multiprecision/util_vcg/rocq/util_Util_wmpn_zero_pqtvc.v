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
Theorem wmpn_zero_p'vc (x : ptr (bv 64%N)) (sz : bv 32%N) (fact0 : valid x (bv_signed sz)) : 0%Z ≤ bv_signed sz ∧ bv_signed sz ≤ bv_signed sz ∧ value_sub (pelts x) (offset x + bv_signed sz) (offset x + bv_signed sz) = 0%Z ∧ (∀(i : bv 32%N), (0%Z ≤ bv_signed i ∧ bv_signed i ≤ bv_signed sz) ∧ value_sub (pelts x) (offset x + bv_signed i) (offset x + bv_signed sz) = 0%Z -> (if decide (1%Z ≤ bv_signed i) then int'32_in_bounds (bv_signed i - 1%Z) ∧ (∀(o1 : bv 32%N), bv_signed o1 = bv_signed i - 1%Z -> (min x ≤ offset x + bv_signed o1 ∧ offset x + bv_signed o1 < C.max x) ∧ ((bv_unsigned (pelts x (offset x + bv_signed o1)) = 0%Z -> pelts x (offset x + bv_signed o1) = (0%bv : bv 64%N)) -> (if decide (¬ pelts x (offset x + bv_signed o1) = (0%bv : bv 64%N)) then (0%Z ≤ bv_signed (0%bv : bv 32%N) ∧ bv_signed (0%bv : bv 32%N) ≤ 1%Z) ∧ (bv_signed (0%bv : bv 32%N) = 1%Z) = (value x (bv_signed sz) = 0%Z) else (0%Z ≤ bv_signed i ∧ bv_signed o1 < bv_signed i) ∧ (0%Z ≤ bv_signed o1 ∧ bv_signed o1 ≤ bv_signed sz) ∧ value_sub (pelts x) (offset x + bv_signed o1) (offset x + bv_signed sz) = 0%Z))) else (0%Z ≤ bv_signed (1%bv : bv 32%N) ∧ bv_signed (1%bv : bv 32%N) ≤ 1%Z) ∧ (bv_signed (1%bv : bv 32%N) = 1%Z) = (value x (bv_signed sz) = 0%Z))).
Proof.
Admitted.

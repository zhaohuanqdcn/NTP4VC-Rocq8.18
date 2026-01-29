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
Open Scope Z_scope.
Theorem euclid'vc (u : bv 63%N) (v : bv 63%N) (fact0 : 0%Z ≤ bv_signed u) (fact1 : 0%Z ≤ bv_signed v) : ((bv_signed v = 0%Z -> v = (0%bv : bv 63%N)) -> ¬ v = (0%bv : bv 63%N) -> (¬ bv_signed v = 0%Z ∧ int'63_in_bounds (Z.quot (bv_signed u) (bv_signed v))) ∧ (∀(o1 : bv 63%N), bv_signed o1 = Z.quot (bv_signed u) (bv_signed v) -> (0%Z ≤ bv_signed v ∧ bv_signed o1 < bv_signed v) ∧ 0%Z ≤ bv_signed v ∧ 0%Z ≤ bv_signed o1)) ∧ (∀(result : bv 63%N), (bv_signed v = 0%Z -> v = (0%bv : bv 63%N)) ∧ (if decide (v = (0%bv : bv 63%N)) then result = u else ∃(o1 : bv 63%N), bv_signed o1 = Z.quot (bv_signed u) (bv_signed v) ∧ bv_signed result = Z.gcd (bv_signed v) (bv_signed o1)) -> bv_signed result = Z.gcd (bv_signed u) (bv_signed v)).
Proof.
Admitted.

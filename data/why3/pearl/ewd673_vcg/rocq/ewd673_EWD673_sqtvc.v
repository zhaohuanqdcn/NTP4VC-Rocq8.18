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
Open Scope Z_scope.
Theorem s'vc (x : Z) (y : Z) (fact0 : 0%Z ≤ x) (fact1 : 0%Z ≤ y) : 0%Z ≤ x ∧ 0%Z ≤ y ∧ (∀(y1 : Z) (x1 : Z), 0%Z ≤ x1 ∧ 0%Z ≤ y1 -> (if decide (0%Z < x1) then True else true = (if decide (0%Z < y1) then true else false)) -> (if decide (0%Z < x1) then ∀(o1 : Z), 0%Z ≤ o1 -> (if decide (0%Z < o1) then (0%Z ≤ x1 ∧ x1 - 1%Z < x1 ∨ x1 = x1 - 1%Z ∧ 0%Z ≤ y1 ∧ o1 - 1%Z < y1) ∧ 0%Z ≤ x1 - 1%Z ∧ 0%Z ≤ o1 - 1%Z else (0%Z ≤ x1 ∧ x1 - 1%Z < x1 ∨ x1 = x1 - 1%Z ∧ 0%Z ≤ y1 ∧ o1 < y1) ∧ 0%Z ≤ x1 - 1%Z ∧ 0%Z ≤ o1) else if decide (0%Z < y1) then (0%Z ≤ x1 ∧ x1 < x1 ∨ 0%Z ≤ y1 ∧ y1 - 1%Z < y1) ∧ 0%Z ≤ x1 ∧ 0%Z ≤ y1 - 1%Z else (0%Z ≤ x1 ∧ x1 < x1 ∨ 0%Z ≤ y1 ∧ y1 < y1) ∧ 0%Z ≤ x1 ∧ 0%Z ≤ y1)).
Proof.
Admitted.

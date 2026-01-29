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
Theorem last_is_black'vc (b0 : Z) (w0 : Z) (fact0 : 0%Z ≤ b0) (fact1 : 0%Z ≤ w0) (fact2 : 1%Z ≤ b0 + w0) : 0%Z ≤ b0 ∧ 0%Z ≤ w0 ∧ 1%Z ≤ b0 + w0 ∧ (∀(w : Z) (b : Z), (0%Z ≤ b ∧ 0%Z ≤ w ∧ 1%Z ≤ b + w) ∧ Z.Odd b = Z.Odd b0 -> (if decide (2%Z ≤ b + w) then (∃(x : Z) (y : Z), 0%Z ≤ x ∧ 0%Z ≤ y ∧ x + y = 2%Z ∧ x ≤ b ∧ y ≤ w) ∧ (∀(x : Z) (y : Z), 0%Z ≤ x ∧ 0%Z ≤ y ∧ x + y = 2%Z ∧ x ≤ b ∧ y ≤ w -> (∀(o1 : bool), (if decide (x = 0%Z) then o1 = true else o1 = (if decide (y = 0%Z) then true else false)) -> (if decide (o1 = true) then (0%Z ≤ b + w ∧ b - x + (w - y + 1%Z) < b + w) ∧ (0%Z ≤ b - x ∧ 0%Z ≤ w - y + 1%Z ∧ 1%Z ≤ b - x + (w - y + 1%Z)) ∧ Z.Odd (b - x) = Z.Odd b0 else (0%Z ≤ b + w ∧ b - x + 1%Z + (w - y) < b + w) ∧ (0%Z ≤ b - x + 1%Z ∧ 0%Z ≤ w - y ∧ 1%Z ≤ b - x + 1%Z + (w - y)) ∧ Z.Odd (b - x + 1%Z) = Z.Odd b0))) else (0%Z < b) = Z.Odd b0)).
Proof.
Admitted.

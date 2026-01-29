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
Definition cube (x : Z) : Z := x * x * x.
Theorem cubic_root'vc (x : Z) (fact0 : 0%Z ≤ x) : cube (1%Z - 1%Z) ≤ x ∧ 1%Z = cube 1%Z ∧ 1%Z = 1%Z * 1%Z ∧ (∀(b : Z), cube (b - 1%Z) ≤ x -> (if decide (cube b ≤ x) then (0%Z ≤ x - cube b ∧ x - (cube b + 3%Z * (b * b) + 3%Z * b + 1%Z) < x - cube b) ∧ cube (b + 1%Z - 1%Z) ≤ x ∧ cube b + 3%Z * (b * b) + 3%Z * b + 1%Z = cube (b + 1%Z) ∧ b * b + 2%Z * b + 1%Z = (b + 1%Z) * (b + 1%Z) else cube (b - 1%Z) ≤ x ∧ x < cube b)).
Proof.
Admitted.

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
Open Scope Z_scope.
Inductive even : Z -> Prop :=
 | even_0 : even 0%Z
 | even_odd (x : Z) : even x -> even (x + 2%Z).
Theorem sqrt'vc (x : Z) (fact0 : 0%Z ≤ x) : 0%Z ≤ 0%Z ∧ 0%Z * 0%Z ≤ x ∧ (∀(z : Z), 0%Z ≤ z ∧ z * z ≤ x -> (if decide ((z + 1%Z) * (z + 1%Z) ≤ x) then (0%Z ≤ x - z * z ∧ x - (z + 1%Z) * (z + 1%Z) < x - z * z) ∧ 0%Z ≤ z + 1%Z ∧ (z + 1%Z) * (z + 1%Z) ≤ x else z * z ≤ x ∧ x < (z + 1%Z) * (z + 1%Z))).
Admitted.

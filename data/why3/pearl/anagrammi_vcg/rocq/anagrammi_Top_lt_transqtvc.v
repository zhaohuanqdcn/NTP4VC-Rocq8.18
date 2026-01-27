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
Open Scope Z_scope.
Axiom line : Type.
Axiom line_inhabited : Inhabited line.
Global Existing Instance line_inhabited.
Axiom line_countable : Countable line.
Global Existing Instance line_countable.
Definition perm4 (s : list Z) := Z.of_nat (length s) = 4%Z ∧ (∀(i : Z), 0%Z ≤ i ∧ i < 4%Z -> 1%Z ≤ nth (Z.to_nat i) s inhabitant ∧ nth (Z.to_nat i) s inhabitant ≤ 4%Z) ∧ NoDup s.
Definition lt (s1 : list Z) (s2 : list Z) := ∃(i : Z), (0%Z ≤ i ∧ i < 4%Z) ∧ nth (Z.to_nat i) s1 inhabitant < nth (Z.to_nat i) s2 inhabitant ∧ (∀(j : Z), 0%Z ≤ j ∧ j < i -> nth (Z.to_nat j) s1 inhabitant = nth (Z.to_nat j) s2 inhabitant).
Theorem lt_trans'vc (s1 : list Z) (s2 : list Z) (s3 : list Z) (fact0 : perm4 s1) (fact1 : perm4 s2) (fact2 : perm4 s3) (fact3 : lt s1 s2) (fact4 : lt s2 s3) : lt s1 s3.
Admitted.

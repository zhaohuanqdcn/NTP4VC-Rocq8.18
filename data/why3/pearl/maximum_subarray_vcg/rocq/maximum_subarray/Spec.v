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
Require Import Why3.int.Sum.
Open Scope Z_scope.
Definition maxsublo (a : list Z) (maxlo : Z) (s : Z) := ∀(l : Z) (h : Z), 0%Z ≤ l ∧ l < maxlo -> l ≤ h ∧ h ≤ Z.of_nat (length a) -> list_sum (drop (Z.to_nat l) (take (Z.to_nat h - Z.to_nat l) a)) ≤ s.
Definition maxsub (a : list Z) (s : Z) := ∀(l : Z) (h : Z), 0%Z ≤ l ∧ l ≤ h ∧ h ≤ Z.of_nat (length a) -> list_sum (drop (Z.to_nat l) (take (Z.to_nat h - Z.to_nat l) a)) ≤ s.

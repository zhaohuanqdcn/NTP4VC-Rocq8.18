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
Definition injective (a : Z -> Z) (n : Z) := ∀(i : Z) (j : Z), 0%Z ≤ i ∧ i < n -> 0%Z ≤ j ∧ j < n -> ¬ i = j -> ¬ a i = a j.
Definition surjective (a : Z -> Z) (n : Z) := ∀(i : Z), 0%Z ≤ i ∧ i < n -> (∃(j : Z), (0%Z ≤ j ∧ j < n) ∧ a j = i).
Definition range (a : Z -> Z) (n : Z) := ∀(i : Z), 0%Z ≤ i ∧ i < n -> 0%Z ≤ a i ∧ a i < n.
Axiom injective_surjective : forall  (a : Z -> Z) (n : Z) (fact0 : injective a n) (fact1 : range a n), surjective a n.
Axiom injection_occ : forall  (m : Z -> Z) (n : Z), injective m n = (∀(v : Z), Z.of_nat (map_occ_list v m 0%Z n) ≤ 1%Z).

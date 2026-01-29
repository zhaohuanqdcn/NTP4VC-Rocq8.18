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
Axiom n : Z.
Axiom solution : Type.
Axiom solution_inhabited : Inhabited solution.
Global Existing Instance solution_inhabited.
Axiom solution_countable : Countable solution.
Global Existing Instance solution_countable.
Definition eq_prefix {α : Type} `{Inhabited α} (t : Z -> α) (u : Z -> α) (i : Z) := ∀(k : Z), 0%Z ≤ k ∧ k < i -> t k = u k.
Definition partial_solution (k : Z) (s : Z -> Z) := ∀(i : Z), 0%Z ≤ i ∧ i < k -> (0%Z ≤ s i ∧ s i < n) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < i -> ¬ s i = s j ∧ ¬ s i - s j = i - j ∧ ¬ s i - s j = j - i).
Definition lt_sol (s1 : Z -> Z) (s2 : Z -> Z) := ∃(i : Z), (0%Z ≤ i ∧ i < n) ∧ eq_prefix s1 s2 i ∧ s1 i < s2 i.
Axiom solutions : Type.
Axiom solutions_inhabited : Inhabited solutions.
Global Existing Instance solutions_inhabited.
Axiom solutions_countable : Countable solutions.
Global Existing Instance solutions_countable.
Definition sorted (s : Z -> Z -> Z) (a : Z) (b : Z) := ∀(i : Z) (j : Z), a ≤ i ∧ i < j ∧ j < b -> lt_sol (s i) (s j).

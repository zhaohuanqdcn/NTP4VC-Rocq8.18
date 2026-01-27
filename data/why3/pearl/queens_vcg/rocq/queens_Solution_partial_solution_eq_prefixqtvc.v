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
Axiom n : Z.
Axiom solution : Type.
Axiom solution_inhabited : Inhabited solution.
Global Existing Instance solution_inhabited.
Axiom solution_countable : Countable solution.
Global Existing Instance solution_countable.
Definition eq_prefix {α : Type} `{Inhabited α} (t : Z -> α) (u : Z -> α) (i : Z) := ∀(k : Z), 0%Z ≤ k ∧ k < i -> t k = u k.
Definition partial_solution (k : Z) (s : Z -> Z) := ∀(i : Z), 0%Z ≤ i ∧ i < k -> (0%Z ≤ s i ∧ s i < n) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < i -> ¬ s i = s j ∧ ¬ s i - s j = i - j ∧ ¬ s i - s j = j - i).
Theorem partial_solution_eq_prefix'vc (k : Z) (t : Z -> Z) (u : Z -> Z) (fact0 : partial_solution k t) (fact1 : eq_prefix t u k) : partial_solution k u.
Admitted.

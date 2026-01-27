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
Axiom state : Type.
Axiom state_inhabited : Inhabited state.
Global Existing Instance state_inhabited.
Axiom state_countable : Countable state.
Global Existing Instance state_countable.
Axiom moves : state -> list state.
Axiom start : state.
Axiom success : state -> Prop.
Inductive path : state -> state -> Z -> Prop :=
 | Path0 (s : state) : path s s 0%Z
 | Path1 (i : Z) (s : state) : 0%Z ≤ i -> i < Z.of_nat (length (moves s)) -> path s (nth (Z.to_nat i) (moves s) inhabitant) 1%Z
 | Patht (s : state) (t : state) (n : Z) (u : state) (m : Z) : path s t n -> path t u m -> path s u (n + m).
Definition move (s : state) (t : state) := ∃(i : Z), (0%Z ≤ i ∧ i < Z.of_nat (length (moves s))) ∧ t = nth (Z.to_nat i) (moves s) inhabitant.
Theorem path_inversion'vc (s : state) (t : state) (n : Z) (fact0 : path s t n) : n = 0%Z ∧ s = t ∨ 0%Z < n ∧ (∃(i : Z), (0%Z ≤ i ∧ i < Z.of_nat (length (moves s))) ∧ path (nth (Z.to_nat i) (moves s) inhabitant) t (n - 1%Z)).
Admitted.

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
Axiom loc : Type.
Axiom loc_inhabited : Inhabited loc.
Global Existing Instance loc_inhabited.
Axiom loc_countable : Countable loc.
Global Existing Instance loc_countable.
Axiom null : loc.
Inductive mem :=
  | mem'mk : (loc -> loc) -> mem.
Axiom mem_inhabited : Inhabited mem.
Global Existing Instance mem_inhabited.
Axiom mem_countable : Countable mem.
Global Existing Instance mem_countable.
Definition next (x : mem) := match x with |  mem'mk a => a end.
Definition valid_cells (s : Z -> loc) (n : Z) := (∀(i : Z), 0%Z ≤ i ∧ i < n -> ¬ s i = null) ∧ (∀(i : Z) (j : Z), 0%Z ≤ i ∧ i < n -> 0%Z ≤ j ∧ j < n -> ¬ i = j -> ¬ s i = s j).
Definition listLR (m : mem) (s : Z -> loc) (l : loc) (lo : Z) (hi : Z) := (0%Z ≤ lo ∧ lo ≤ hi) ∧ (if decide (lo = hi) then l = null else l = s lo ∧ next m (s (hi - 1%Z)) = null ∧ (∀(k : Z), lo ≤ k ∧ k < hi - 1%Z -> next m (s k) = s (k + 1%Z))).
Definition listRL (m : mem) (s : Z -> loc) (l : loc) (lo : Z) (hi : Z) := (0%Z ≤ lo ∧ lo ≤ hi) ∧ (if decide (lo = hi) then l = null else next m (s lo) = null ∧ l = s (hi - 1%Z) ∧ (∀(k : Z), lo < k ∧ k < hi -> next m (s k) = s (k - 1%Z))).
Definition frame (m1 : mem) (m2 : mem) (s : Z -> loc) (n : Z) := ∀(p : loc), (∀(i : Z), 0%Z ≤ i ∧ i < n -> ¬ p = s i) -> next m1 p = next m2 p.
Theorem is_list'vc (n : Z) (s : Z -> loc) (l : loc) (fact0 : 0%Z ≤ n) (fact1 : ¬ n = 0%Z) (fact2 : let q1' : loc := s 0%Z in if decide (l = q1') then true = (if decide (q1' = null) then false else true) else true = false) : let o1 : Z := n - 1%Z in (0%Z ≤ n ∧ o1 < n) ∧ 0%Z ≤ o1.
Admitted.

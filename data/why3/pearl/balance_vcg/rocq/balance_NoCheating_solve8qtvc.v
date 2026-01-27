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
Inductive outcome :=
  | Left : outcome
  | Equal : outcome
  | Right : outcome.
Axiom outcome_inhabited : Inhabited outcome.
Global Existing Instance outcome_inhabited.
Axiom outcome_countable : Countable outcome.
Global Existing Instance outcome_countable.
Axiom counter : Type.
Axiom counter_inhabited : Inhabited counter.
Global Existing Instance counter_inhabited.
Axiom counter_countable : Countable counter.
Global Existing Instance counter_countable.
Axiom v : counter -> Z.
Axiom subset : Type.
Axiom subset_inhabited : Inhabited subset.
Global Existing Instance subset_inhabited.
Axiom subset_countable : Countable subset.
Global Existing Instance subset_countable.
Definition sum (balls : list Z) (s : Z -> bool) : Z := (if decide (s 0%Z = true) then nth 0%nat balls inhabitant else 0%Z) + (if decide (s 1%Z = true) then nth 1%nat balls inhabitant else 0%Z) + (if decide (s 2%Z = true) then nth 2%nat balls inhabitant else 0%Z) + (if decide (s 3%Z = true) then nth 3%nat balls inhabitant else 0%Z) + (if decide (s 4%Z = true) then nth 4%nat balls inhabitant else 0%Z) + (if decide (s 5%Z = true) then nth 5%nat balls inhabitant else 0%Z) + (if decide (s 6%Z = true) then nth 6%nat balls inhabitant else 0%Z) + (if decide (s 7%Z = true) then nth 7%nat balls inhabitant else 0%Z).
Definition spec (balls : list Z) (lo : Z) (hi : Z) (lb : Z) (w : Z) := (0%Z ≤ lo ∧ lo ≤ lb ∧ lb < hi ∧ hi ≤ Z.of_nat (length balls) ∧ Z.of_nat (length balls) = 8%Z) ∧ (∀(i : Z), lo ≤ i ∧ i < hi -> ¬ i = lb -> nth (Z.to_nat i) balls inhabitant = w) ∧ nth (Z.to_nat lb) balls inhabitant < w.
Axiom o1 : Z -> bool.
Axiom o2 : Z -> bool.
Axiom o3 : Z -> bool.
Axiom o4 : Z -> bool.
Axiom o'def : forall  (i : Z), (o1 i = true) = (i = 3%Z ∨ i = 4%Z ∨ i = 5%Z).
Axiom o'def1 : forall  (i : Z), (o2 i = true) = (i = 0%Z ∨ i = 1%Z ∨ i = 2%Z).
Axiom o'def2 : forall  (i : Z), (o3 i = true) = (i = 7%Z).
Axiom o'def3 : forall  (i : Z), (o4 i = true) = (i = 6%Z).
Theorem solve8'vc (counter1 : counter) (balls : list Z) (lb : Z) (w : Z) (fact0 : v counter1 = 2%Z) (fact1 : spec balls 0%Z 8%Z lb w) : let o5 : Z -> bool := o1 in let o6 : Z -> bool := o2 in (0%Z < v counter1 ∧ (∀(i : Z), 0%Z ≤ i ∧ i < 8%Z -> ¬ o6 i = true ∨ ¬ o5 i = true)) ∧ (∀(counter2 : counter) (o7 : outcome), (let left1 : Z := sum balls o6 in let right1 : Z := sum balls o5 in (match o7 with | Left => right1 < left1 | Equal => left1 = right1 | Right => left1 < right1 end)) ∧ v counter2 = v counter1 - 1%Z -> (match o7 with | Right => 1%Z ≤ v counter2 ∧ spec balls 0%Z (0%Z + 3%Z) lb w | Left => 1%Z ≤ v counter2 ∧ spec balls 3%Z (3%Z + 3%Z) lb w | Equal => (let o8 : Z -> bool := o3 in let o9 : Z -> bool := o4 in (0%Z < v counter2 ∧ (∀(i : Z), 0%Z ≤ i ∧ i < 8%Z -> ¬ o9 i = true ∨ ¬ o8 i = true)) ∧ (∀(counter3 : counter) (o10 : outcome), (let left1 : Z := sum balls o9 in let right1 : Z := sum balls o8 in (match o10 with | Left => right1 < left1 | Equal => left1 = right1 | Right => left1 < right1 end)) ∧ v counter3 = v counter2 - 1%Z -> (match o10 with | Right => True | Left => True | Equal => False end) ∧ (∀(result : Z), (match o10 with | Right => result = 6%Z | Left => result = 7%Z | Equal => False end) -> result = lb))) end)).
Admitted.

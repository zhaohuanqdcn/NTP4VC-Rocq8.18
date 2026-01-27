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
Axiom o1 : Z -> Z -> bool.
Axiom o2 : Z -> Z -> bool.
Axiom o'def : forall  (lo : Z) (i : Z), (o1 lo i = true) = (i = lo + 1%Z).
Axiom o'def1 : forall  (lo : Z) (i : Z), (o2 lo i = true) = (i = lo).
Theorem solve3'vc (counter1 : counter) (balls : list Z) (lo : Z) (lb : Z) (w : Z) (fact0 : 1%Z ≤ v counter1) (fact1 : spec balls lo (lo + 3%Z) lb w) : let o3 : Z -> bool := o1 lo in let o4 : Z -> bool := o2 lo in (0%Z < v counter1 ∧ (∀(i : Z), 0%Z ≤ i ∧ i < 8%Z -> ¬ o4 i = true ∨ ¬ o3 i = true)) ∧ (∀(counter2 : counter) (o5 : outcome), (let left1 : Z := sum balls o4 in let right1 : Z := sum balls o3 in (match o5 with | Left => right1 < left1 | Equal => left1 = right1 | Right => left1 < right1 end)) ∧ v counter2 = v counter1 - 1%Z -> (match o5 with | Right => True | Left => True | Equal => True end) ∧ (∀(result : Z), (match o5 with | Right => result = lo | Left => result = lo + 1%Z | Equal => result = lo + 2%Z end) -> result = lb ∧ v counter2 = v counter1 - 1%Z)).
Admitted.

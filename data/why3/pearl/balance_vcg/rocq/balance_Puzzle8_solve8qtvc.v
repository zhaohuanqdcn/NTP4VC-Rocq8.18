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
Require Import balance_vcg.balance.Roberval.
Open Scope Z_scope.
Definition spec (balls : list Z) (lo : Z) (hi : Z) (lb : Z) (w : Z) := (0%Z ≤ lo ∧ lo ≤ lb ∧ lb < hi ∧ hi ≤ Z.of_nat (length balls)) ∧ (∀(i : Z), lo ≤ i ∧ i < hi -> ¬ i = lb -> nth (Z.to_nat i) balls inhabitant = w) ∧ nth (Z.to_nat lb) balls inhabitant < w.
Theorem solve8'vc (counter : Roberval.counter) (balls : list Z) (lb : Z) (w : Z) (fact0 : v counter = 2%Z) (fact1 : spec balls 0%Z 8%Z lb w) : 0%Z ≤ 5%Z ∧ 5%Z < Z.of_nat (length balls) ∧ 0%Z ≤ 4%Z ∧ 4%Z < Z.of_nat (length balls) ∧ 0%Z ≤ 3%Z ∧ 3%Z < Z.of_nat (length balls) ∧ (let o1 : Z := nth 3%nat balls inhabitant + nth 4%nat balls inhabitant + nth 5%nat balls inhabitant in (0%Z ≤ 2%Z ∧ 2%Z < Z.of_nat (length balls)) ∧ (0%Z ≤ 1%Z ∧ 1%Z < Z.of_nat (length balls)) ∧ (0%Z ≤ 0%Z ∧ 0%Z < Z.of_nat (length balls)) ∧ (let o2 : Z := nth 0%nat balls inhabitant + nth 1%nat balls inhabitant + nth 2%nat balls inhabitant in 0%Z < v counter ∧ (∀(counter1 : Roberval.counter) (o3 : outcome), (match o3 with | Left => o1 < o2 | Equal => o2 = o1 | Right => o2 < o1 end) ∧ v counter1 = v counter - 1%Z -> (match o3 with | Right => 1%Z ≤ v counter1 ∧ spec balls 0%Z (0%Z + 3%Z) lb w | Left => 1%Z ≤ v counter1 ∧ spec balls 3%Z (3%Z + 3%Z) lb w | Equal => (0%Z ≤ 7%Z ∧ 7%Z < Z.of_nat (length balls)) ∧ (let o4 : Z := nth 7%nat balls inhabitant in (0%Z ≤ 6%Z ∧ 6%Z < Z.of_nat (length balls)) ∧ (let o5 : Z := nth 6%nat balls inhabitant in 0%Z < v counter1 ∧ (∀(counter2 : Roberval.counter) (o6 : outcome), (match o6 with | Left => o4 < o5 | Equal => o5 = o4 | Right => o5 < o4 end) ∧ v counter2 = v counter1 - 1%Z -> (match o6 with | Right => True | Left => True | Equal => False end) ∧ (∀(result : Z), (match o6 with | Right => result = 6%Z | Left => result = 7%Z | Equal => False end) -> result = lb)))) end)))).
Admitted.

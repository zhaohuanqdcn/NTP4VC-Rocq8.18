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
Theorem solve3'vc (counter : Roberval.counter) (balls : list Z) (lo : Z) (lb : Z) (w : Z) (fact0 : 1%Z ≤ v counter) (fact1 : spec balls lo (lo + 3%Z) lb w) : let o1 : Z := lo + 1%Z in (0%Z ≤ o1 ∧ o1 < Z.of_nat (length balls)) ∧ (let o2 : Z := nth (Z.to_nat o1) balls inhabitant in (0%Z ≤ lo ∧ lo < Z.of_nat (length balls)) ∧ (let o3 : Z := nth (Z.to_nat lo) balls inhabitant in 0%Z < v counter ∧ (∀(counter1 : Roberval.counter) (o4 : outcome), (match o4 with | Left => o2 < o3 | Equal => o3 = o2 | Right => o3 < o2 end) ∧ v counter1 = v counter - 1%Z -> (match o4 with | Right => True | Left => True | Equal => True end) ∧ (∀(result : Z), (match o4 with | Right => result = lo | Left => result = lo + 1%Z | Equal => result = lo + 2%Z end) -> result = lb ∧ v counter1 = v counter - 1%Z)))).
Admitted.

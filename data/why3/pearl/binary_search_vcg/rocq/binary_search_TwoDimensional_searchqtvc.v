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
Require Import Why3.matrix.Matrix.
Open Scope Z_scope.
Theorem search'vc (m : matrix Z) (v : Z) (fact0 : ∀(i : Z), 0%Z ≤ i ∧ i < rows m -> (∀(j1 : Z) (j2 : Z), 0%Z ≤ j1 ∧ j1 ≤ j2 ∧ j2 < columns m -> get m i j1 ≤ get m i j2)) (fact1 : ∀(j : Z), 0%Z ≤ j ∧ j < columns m -> (∀(i1 : Z) (i2 : Z), 0%Z ≤ i1 ∧ i1 ≤ i2 ∧ i2 < rows m -> get m i1 j ≤ get m i2 j)) : let o1 : Z := columns m - 1%Z in ((0%Z ≤ 0%Z ∧ 0%Z ≤ rows m) ∧ (- 1%Z ≤ o1 ∧ o1 < columns m) ∧ (∀(i' : Z) (j' : Z), 0%Z ≤ i' ∧ i' < rows m -> 0%Z ≤ j' ∧ j' < columns m -> i' < 0%Z ∨ o1 < j' -> ¬ get m i' j' = v)) ∧ (∀(j : Z) (i : Z), (0%Z ≤ i ∧ i ≤ rows m) ∧ (- 1%Z ≤ j ∧ j < columns m) ∧ (∀(i' : Z) (j' : Z), 0%Z ≤ i' ∧ i' < rows m -> 0%Z ≤ j' ∧ j' < columns m -> i' < i ∨ j < j' -> ¬ get m i' j' = v) -> (∀(o2 : bool), (if decide (i < rows m) then o2 = (if decide (0%Z ≤ j) then true else false) else o2 = false) -> (if decide (o2 = true) then valid_index m i j ∧ (let x : Z := elts m i j in if decide (x = v) then ∃(i1 : Z) (j1 : Z), (0%Z ≤ i1 ∧ i1 < rows m) ∧ (0%Z ≤ j1 ∧ j1 < columns m) ∧ get m i1 j1 = v else if decide (x < v) then (0%Z ≤ rows m - i + j ∧ rows m - (i + 1%Z) + j < rows m - i + j) ∧ (0%Z ≤ i + 1%Z ∧ i + 1%Z ≤ rows m) ∧ (- 1%Z ≤ j ∧ j < columns m) ∧ (∀(i' : Z) (j' : Z), 0%Z ≤ i' ∧ i' < rows m -> 0%Z ≤ j' ∧ j' < columns m -> i' < i + 1%Z ∨ j < j' -> ¬ get m i' j' = v) else (0%Z ≤ rows m - i + j ∧ rows m - i + (j - 1%Z) < rows m - i + j) ∧ (0%Z ≤ i ∧ i ≤ rows m) ∧ (- 1%Z ≤ j - 1%Z ∧ j - 1%Z < columns m) ∧ (∀(i' : Z) (j' : Z), 0%Z ≤ i' ∧ i' < rows m -> 0%Z ≤ j' ∧ j' < columns m -> i' < i ∨ j - 1%Z < j' -> ¬ get m i' j' = v)) else ¬ (∃(i1 : Z) (j1 : Z), (0%Z ≤ i1 ∧ i1 < rows m) ∧ (0%Z ≤ j1 ∧ j1 < columns m) ∧ get m i1 j1 = v)))).
Admitted.

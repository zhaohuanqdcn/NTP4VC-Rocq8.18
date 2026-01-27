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
Definition eq_board (b1 : list Z) (b2 : list Z) (pos : Z) := ∀(q : Z), 0%Z ≤ q ∧ q < pos -> nth (Z.to_nat q) b1 inhabitant = nth (Z.to_nat q) b2 inhabitant.
Definition consistent_row (board : list Z) (pos : Z) (q : Z) := ¬ nth (Z.to_nat q) board inhabitant = nth (Z.to_nat pos) board inhabitant ∧ ¬ nth (Z.to_nat q) board inhabitant - nth (Z.to_nat pos) board inhabitant = pos - q ∧ ¬ nth (Z.to_nat pos) board inhabitant - nth (Z.to_nat q) board inhabitant = pos - q.
Definition is_consistent (board : list Z) (pos : Z) := ∀(q : Z), 0%Z ≤ q ∧ q < pos -> consistent_row board pos q.
Definition is_board (board : list Z) (pos : Z) := ∀(q : Z), 0%Z ≤ q ∧ q < pos -> 0%Z ≤ nth (Z.to_nat q) board inhabitant ∧ nth (Z.to_nat q) board inhabitant < Z.of_nat (length board).
Definition solution (board : list Z) (pos : Z) := is_board board pos ∧ (∀(q : Z), 0%Z ≤ q ∧ q < pos -> is_consistent board q).
Theorem solution_eq_board'vc (b1 : list Z) (b2 : list Z) (pos : Z) (fact0 : length b1 = length b2) (fact1 : eq_board b1 b2 pos) (fact2 : solution b1 pos) : solution b2 pos.
Admitted.

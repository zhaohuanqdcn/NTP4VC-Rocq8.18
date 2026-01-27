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
Theorem check_is_consistent'vc (pos : Z) (board : list Z) (fact0 : 0%Z ≤ pos) (fact1 : pos < Z.of_nat (length board)) : let o1 : Z := pos - 1%Z in (0%Z ≤ o1 + 1%Z -> (∀(j : Z), 0%Z ≤ j ∧ j < 0%Z -> consistent_row board pos j) ∧ (∀(q : Z), (0%Z ≤ q ∧ q ≤ o1) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < q -> consistent_row board pos j) -> (0%Z ≤ q ∧ q < Z.of_nat (length board)) ∧ (let bq : Z := nth (Z.to_nat q) board inhabitant in (0%Z ≤ pos ∧ pos < Z.of_nat (length board)) ∧ (let bpos : Z := nth (Z.to_nat pos) board inhabitant in if decide (bq = bpos) then ¬ is_consistent board pos else if decide (bq - bpos = pos - q) then ¬ is_consistent board pos else if decide (bpos - bq = pos - q) then ¬ is_consistent board pos else ∀(j : Z), 0%Z ≤ j ∧ j < q + 1%Z -> consistent_row board pos j))) ∧ ((∀(j : Z), 0%Z ≤ j ∧ j < o1 + 1%Z -> consistent_row board pos j) -> is_consistent board pos)) ∧ (o1 + 1%Z < 0%Z -> is_consistent board pos).
Admitted.

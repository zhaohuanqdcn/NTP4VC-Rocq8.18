From Coq Require Import Strings.String.
From Coq Require Import String Ascii.
From Coq Require Arith.
From stdpp Require Import base.
From stdpp Require Import fin_maps.
From stdpp Require Import gmap.
From stdpp Require Import base gmultiset.
From Coq Require Classical.
From Coq Require Import ZArith.
From stdpp.bitvector Require Import definitions tactics.
From Coq Require Import Sorting.Sorted.
From Coq Require Import Reals.Rbasic_fun.
From Coq Require Import Reals.Abstract.ConstructiveAbs.
From Coq Require Import Reals.Rdefinitions.
From stdpp Require Import list_relations.
From stdpp Require Import list_numbers.
From stdpp Require Import functions.
From Coq Require Import ClassicalEpsilon.
From stdpp Require Import base decidable.
From Coq Require Import ZArith.Zeuclid.
From Coq Require Import ZArith.Znumtheory.
From stdpp Require Import propset.
From Coq Require Import Reals.
Require Import Why3.Base.
Open Scope Z_scope.
Definition eq_board (b1 : list Z) (b2 : list Z) (pos : Z) := ∀(q : Z), 0%Z ≤ q ∧ q < pos -> nth (Z.to_nat q) b1 inhabitant = nth (Z.to_nat q) b2 inhabitant.
Definition consistent_row (board : list Z) (pos : Z) (q : Z) := ¬ nth (Z.to_nat q) board inhabitant = nth (Z.to_nat pos) board inhabitant ∧ ¬ nth (Z.to_nat q) board inhabitant - nth (Z.to_nat pos) board inhabitant = pos - q ∧ ¬ nth (Z.to_nat pos) board inhabitant - nth (Z.to_nat q) board inhabitant = pos - q.
Definition is_consistent (board : list Z) (pos : Z) := ∀(q : Z), 0%Z ≤ q ∧ q < pos -> consistent_row board pos q.
Definition is_board (board : list Z) (pos : Z) := ∀(q : Z), 0%Z ≤ q ∧ q < pos -> 0%Z ≤ nth (Z.to_nat q) board inhabitant ∧ nth (Z.to_nat q) board inhabitant < Z.of_nat (length board).
Definition solution (board : list Z) (pos : Z) := is_board board pos ∧ (∀(q : Z), 0%Z ≤ q ∧ q < pos -> is_consistent board q).
Theorem queens'vc (board : list Z) : 0%Z ≤ 0%Z ∧ 0%Z ≤ Z.of_nat (length board) ∧ solution board 0%Z ∧ (∀(board1 : list Z), length board1 = length board -> eq_board board1 board 0%Z ∧ (∀(b : list Z), length b = length board -> is_board b (Z.of_nat (length board)) -> eq_board board1 b 0%Z -> ¬ solution b (Z.of_nat (length board))) -> (∀(b : list Z), length b = length board -> is_board b (Z.of_nat (length board)) -> ¬ solution b (Z.of_nat (length board)))).
Proof.
Admitted.

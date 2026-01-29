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
Require Import Why3.why3.Ref.Ref.
Open Scope Z_scope.
Definition is_board (board : array63 (bv 63%N)) (pos : Z) := ∀(q : Z), 0%Z ≤ q ∧ q < pos -> 0%Z ≤ bv_signed (nth (Z.to_nat q) (array63_elts board) inhabitant) ∧ bv_signed (nth (Z.to_nat q) (array63_elts board) inhabitant) < bv_signed (array63_length board).
Theorem count_bt_queens'vc (pos : bv 63%N) (board : array63 (bv 63%N)) (solutions : nat) (fact0 : 0%Z ≤ bv_signed pos) (fact1 : bv_signed pos ≤ bv_signed (array63_length board)) (fact2 : is_board board (bv_signed pos)) (fact3 : bv_signed pos = bv_signed (array63_length board) -> pos = array63_length board) : if decide (pos = array63_length board) then ∀(o1 : nat), Z.of_nat o1 = Z.of_nat solutions + 1%Z -> is_board board (bv_signed pos) else ((0%Z ≤ 0%Z ∧ 0%Z ≤ bv_signed (array63_length board)) ∧ is_board board (bv_signed pos)) ∧ (∀(i : bv 63%N) (board1 : array63 (bv 63%N)), array63_length board1 = array63_length board -> (0%Z ≤ bv_signed i ∧ bv_signed i ≤ bv_signed (array63_length board)) ∧ is_board board1 (bv_signed pos) -> (if decide (bv_signed i < bv_signed (array63_length board)) then (0%Z ≤ bv_signed pos ∧ bv_signed pos < bv_signed (array63_length board1)) ∧ (∀(board2 : array63 (bv 63%N)), array63_length board2 = array63_length board1 -> array63_elts board2 = set_list (array63_elts board1) (Z.to_nat (bv_signed pos)) i -> ((0%Z ≤ bv_signed pos ∧ bv_signed pos < bv_signed (array63_length board2)) ∧ is_board board2 (bv_signed pos + 1%Z)) ∧ (∀(o1 : bool), if decide (o1 = true) then int'63_in_bounds (bv_signed pos + 1%Z) ∧ (∀(o2 : bv 63%N), bv_signed o2 = bv_signed pos + 1%Z -> ((0%Z ≤ bv_signed (array63_length board) - bv_signed pos ∧ bv_signed (array63_length board) - bv_signed o2 < bv_signed (array63_length board) - bv_signed pos) ∧ array63_length board2 = array63_length board ∧ (0%Z ≤ bv_signed o2 ∧ bv_signed o2 ≤ bv_signed (array63_length board)) ∧ is_board board2 (bv_signed o2)) ∧ (∀(board3 : array63 (bv 63%N)), array63_length board3 = array63_length board2 -> is_board board3 (bv_signed o2) -> int'63_in_bounds (bv_signed i + 1%Z) ∧ (∀(o3 : bv 63%N), bv_signed o3 = bv_signed i + 1%Z -> (0%Z ≤ bv_signed (array63_length board) - bv_signed i ∧ bv_signed (array63_length board) - bv_signed o3 < bv_signed (array63_length board) - bv_signed i) ∧ (0%Z ≤ bv_signed o3 ∧ bv_signed o3 ≤ bv_signed (array63_length board)) ∧ is_board board3 (bv_signed pos)))) else int'63_in_bounds (bv_signed i + 1%Z) ∧ (∀(o2 : bv 63%N), bv_signed o2 = bv_signed i + 1%Z -> (0%Z ≤ bv_signed (array63_length board) - bv_signed i ∧ bv_signed (array63_length board) - bv_signed o2 < bv_signed (array63_length board) - bv_signed i) ∧ (0%Z ≤ bv_signed o2 ∧ bv_signed o2 ≤ bv_signed (array63_length board)) ∧ is_board board2 (bv_signed pos)))) else is_board board1 (bv_signed pos))).
Proof.
Admitted.

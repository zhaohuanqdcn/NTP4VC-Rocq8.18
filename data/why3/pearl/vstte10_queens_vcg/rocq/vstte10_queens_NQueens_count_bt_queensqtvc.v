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
Definition eq_board (b1 : list Z) (b2 : list Z) (pos : Z) := ∀(q : Z), 0%Z ≤ q ∧ q < pos -> nth (Z.to_nat q) b1 inhabitant = nth (Z.to_nat q) b2 inhabitant.
Definition consistent_row (board : list Z) (pos : Z) (q : Z) := ¬ nth (Z.to_nat q) board inhabitant = nth (Z.to_nat pos) board inhabitant ∧ ¬ nth (Z.to_nat q) board inhabitant - nth (Z.to_nat pos) board inhabitant = pos - q ∧ ¬ nth (Z.to_nat pos) board inhabitant - nth (Z.to_nat q) board inhabitant = pos - q.
Definition is_consistent (board : list Z) (pos : Z) := ∀(q : Z), 0%Z ≤ q ∧ q < pos -> consistent_row board pos q.
Definition is_board (board : list Z) (pos : Z) := ∀(q : Z), 0%Z ≤ q ∧ q < pos -> 0%Z ≤ nth (Z.to_nat q) board inhabitant ∧ nth (Z.to_nat q) board inhabitant < Z.of_nat (length board).
Definition solution (board : list Z) (pos : Z) := is_board board pos ∧ (∀(q : Z), 0%Z ≤ q ∧ q < pos -> is_consistent board q).
Theorem count_bt_queens'vc (pos : Z) (board : list Z) (fact0 : 0%Z ≤ pos) (fact1 : pos ≤ Z.of_nat (length board)) (fact2 : solution board pos) : if decide (pos = Z.of_nat (length board)) then eq_board board board pos else let o1 : Z := Z.of_nat (length board) - 1%Z in (0%Z ≤ o1 + 1%Z -> eq_board board board pos ∧ (∀(s : Z) (board1 : list Z), length board1 = length board -> (∀(i : Z), (0%Z ≤ i ∧ i ≤ o1) ∧ eq_board board1 board pos -> (0%Z ≤ pos ∧ pos < Z.of_nat (length board1)) ∧ (length (set_list board1 (Z.to_nat pos) i) = length board1 -> nth_i (set_list board1 (Z.to_nat pos) i) = fun_updt (nth_i board1) pos i -> (0%Z ≤ pos ∧ pos < Z.of_nat (length (set_list board1 (Z.to_nat pos) i))) ∧ (if decide (is_consistent (set_list board1 (Z.to_nat pos) i) pos) then let o2 : Z := pos + 1%Z in ((0%Z ≤ Z.of_nat (length board) - pos ∧ Z.of_nat (length board) - o2 < Z.of_nat (length board) - pos) ∧ length (set_list board1 (Z.to_nat pos) i) = length board ∧ (0%Z ≤ o2 ∧ o2 ≤ Z.of_nat (length board)) ∧ solution (set_list board1 (Z.to_nat pos) i) o2) ∧ (∀(board2 : list Z), length board2 = length (set_list board1 (Z.to_nat pos) i) -> (∀(o3 : Z), eq_board board2 (set_list board1 (Z.to_nat pos) i) o2 -> eq_board board2 board pos)) else eq_board (set_list board1 (Z.to_nat pos) i) board pos))))) ∧ (o1 + 1%Z < 0%Z -> eq_board board board pos).
Proof.
Admitted.

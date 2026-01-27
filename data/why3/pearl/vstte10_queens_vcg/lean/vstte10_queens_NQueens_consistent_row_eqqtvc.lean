import Why3.Base
open Classical
open Lean4Why3
namespace vstte10_queens_NQueens_consistent_row_eqqtvc
noncomputable def eq_board (b1 : List ℤ) (b2 : List ℤ) (pos : ℤ) := ∀(q : ℤ), (0 : ℤ) ≤ q ∧ q < pos → b1[Int.toNat q]! = b2[Int.toNat q]!
noncomputable def consistent_row (board : List ℤ) (pos : ℤ) (q : ℤ) := ¬board[Int.toNat q]! = board[Int.toNat pos]! ∧ ¬board[Int.toNat q]! - board[Int.toNat pos]! = pos - q ∧ ¬board[Int.toNat pos]! - board[Int.toNat q]! = pos - q
theorem consistent_row_eq'vc (b1 : List ℤ) (b2 : List ℤ) (pos : ℤ) (q : ℤ) (fact0 : eq_board b1 b2 (pos + (1 : ℤ))) (fact1 : (0 : ℤ) ≤ q) (fact2 : q < pos) (fact3 : consistent_row b1 pos q) : consistent_row b2 pos q
  := sorry
end vstte10_queens_NQueens_consistent_row_eqqtvc

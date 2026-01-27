import Why3.Base
open Classical
open Lean4Why3
namespace vstte10_queens_NQueens_solution_eq_boardqtvc
noncomputable def eq_board (b1 : List ℤ) (b2 : List ℤ) (pos : ℤ) := ∀(q : ℤ), (0 : ℤ) ≤ q ∧ q < pos → b1[Int.toNat q]! = b2[Int.toNat q]!
noncomputable def consistent_row (board : List ℤ) (pos : ℤ) (q : ℤ) := ¬board[Int.toNat q]! = board[Int.toNat pos]! ∧ ¬board[Int.toNat q]! - board[Int.toNat pos]! = pos - q ∧ ¬board[Int.toNat pos]! - board[Int.toNat q]! = pos - q
noncomputable def is_consistent (board : List ℤ) (pos : ℤ) := ∀(q : ℤ), (0 : ℤ) ≤ q ∧ q < pos → consistent_row board pos q
noncomputable def is_board (board : List ℤ) (pos : ℤ) := ∀(q : ℤ), (0 : ℤ) ≤ q ∧ q < pos → (0 : ℤ) ≤ board[Int.toNat q]! ∧ board[Int.toNat q]! < Int.ofNat (List.length board)
noncomputable def solution (board : List ℤ) (pos : ℤ) := is_board board pos ∧ (∀(q : ℤ), (0 : ℤ) ≤ q ∧ q < pos → is_consistent board q)
theorem solution_eq_board'vc (b1 : List ℤ) (b2 : List ℤ) (pos : ℤ) (fact0 : List.length b1 = List.length b2) (fact1 : eq_board b1 b2 pos) (fact2 : solution b1 pos) : solution b2 pos
  := sorry
end vstte10_queens_NQueens_solution_eq_boardqtvc

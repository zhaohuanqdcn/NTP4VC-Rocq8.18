import Why3.Base
open Classical
open Lean4Why3
namespace vstte10_queens_NQueens_queensqtvc
noncomputable def eq_board (b1 : List ℤ) (b2 : List ℤ) (pos : ℤ) := ∀(q : ℤ), (0 : ℤ) ≤ q ∧ q < pos → b1[Int.toNat q]! = b2[Int.toNat q]!
noncomputable def consistent_row (board : List ℤ) (pos : ℤ) (q : ℤ) := ¬board[Int.toNat q]! = board[Int.toNat pos]! ∧ ¬board[Int.toNat q]! - board[Int.toNat pos]! = pos - q ∧ ¬board[Int.toNat pos]! - board[Int.toNat q]! = pos - q
noncomputable def is_consistent (board : List ℤ) (pos : ℤ) := ∀(q : ℤ), (0 : ℤ) ≤ q ∧ q < pos → consistent_row board pos q
noncomputable def is_board (board : List ℤ) (pos : ℤ) := ∀(q : ℤ), (0 : ℤ) ≤ q ∧ q < pos → (0 : ℤ) ≤ board[Int.toNat q]! ∧ board[Int.toNat q]! < Int.ofNat (List.length board)
noncomputable def solution (board : List ℤ) (pos : ℤ) := is_board board pos ∧ (∀(q : ℤ), (0 : ℤ) ≤ q ∧ q < pos → is_consistent board q)
theorem queens'vc (board : List ℤ) : (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ Int.ofNat (List.length board) ∧ solution board (0 : ℤ) ∧ (∀(board1 : List ℤ), List.length board1 = List.length board → eq_board board1 board (0 : ℤ) ∧ (∀(b : List ℤ), List.length b = List.length board → is_board b (Int.ofNat (List.length board)) → eq_board board1 b (0 : ℤ) → ¬solution b (Int.ofNat (List.length board))) → (∀(b : List ℤ), List.length b = List.length board → is_board b (Int.ofNat (List.length board)) → ¬solution b (Int.ofNat (List.length board))))
  := sorry
end vstte10_queens_NQueens_queensqtvc

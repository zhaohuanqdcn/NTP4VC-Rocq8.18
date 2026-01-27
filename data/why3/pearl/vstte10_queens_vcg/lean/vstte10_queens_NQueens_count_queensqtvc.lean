import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace vstte10_queens_NQueens_count_queensqtvc
noncomputable def eq_board (b1 : List ℤ) (b2 : List ℤ) (pos : ℤ) := ∀(q : ℤ), (0 : ℤ) ≤ q ∧ q < pos → b1[Int.toNat q]! = b2[Int.toNat q]!
noncomputable def consistent_row (board : List ℤ) (pos : ℤ) (q : ℤ) := ¬board[Int.toNat q]! = board[Int.toNat pos]! ∧ ¬board[Int.toNat q]! - board[Int.toNat pos]! = pos - q ∧ ¬board[Int.toNat pos]! - board[Int.toNat q]! = pos - q
noncomputable def is_consistent (board : List ℤ) (pos : ℤ) := ∀(q : ℤ), (0 : ℤ) ≤ q ∧ q < pos → consistent_row board pos q
noncomputable def is_board (board : List ℤ) (pos : ℤ) := ∀(q : ℤ), (0 : ℤ) ≤ q ∧ q < pos → (0 : ℤ) ≤ board[Int.toNat q]! ∧ board[Int.toNat q]! < Int.ofNat (List.length board)
noncomputable def solution (board : List ℤ) (pos : ℤ) := is_board board pos ∧ (∀(q : ℤ), (0 : ℤ) ≤ q ∧ q < pos → is_consistent board q)
theorem count_queens'vc (board : List ℤ) : (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ Int.ofNat (List.length board) ∧ solution board (0 : ℤ)
  := sorry
end vstte10_queens_NQueens_count_queensqtvc

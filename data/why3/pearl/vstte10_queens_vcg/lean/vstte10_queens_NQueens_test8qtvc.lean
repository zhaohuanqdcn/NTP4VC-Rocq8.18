import Why3.Base
open Classical
open Lean4Why3
namespace vstte10_queens_NQueens_test8qtvc
noncomputable def eq_board (b1 : List ℤ) (b2 : List ℤ) (pos : ℤ) := ∀(q : ℤ), (0 : ℤ) ≤ q ∧ q < pos → b1[Int.toNat q]! = b2[Int.toNat q]!
noncomputable def consistent_row (board : List ℤ) (pos : ℤ) (q : ℤ) := ¬board[Int.toNat q]! = board[Int.toNat pos]! ∧ ¬board[Int.toNat q]! - board[Int.toNat pos]! = pos - q ∧ ¬board[Int.toNat pos]! - board[Int.toNat q]! = pos - q
noncomputable def is_consistent (board : List ℤ) (pos : ℤ) := ∀(q : ℤ), (0 : ℤ) ≤ q ∧ q < pos → consistent_row board pos q
noncomputable def is_board (board : List ℤ) (pos : ℤ) := ∀(q : ℤ), (0 : ℤ) ≤ q ∧ q < pos → (0 : ℤ) ≤ board[Int.toNat q]! ∧ board[Int.toNat q]! < Int.ofNat (List.length board)
noncomputable def solution (board : List ℤ) (pos : ℤ) := is_board board pos ∧ (∀(q : ℤ), (0 : ℤ) ≤ q ∧ q < pos → is_consistent board q)
theorem test8'vc : (0 : ℤ) ≤ (8 : ℤ) ∧ (∀(a : List ℤ), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (8 : ℤ) → a[Int.toNat i]! = (0 : ℤ)) ∧ Int.ofNat (List.length a) = (8 : ℤ) → Int.ofNat (List.length a) = (8 : ℤ))
  := sorry
end vstte10_queens_NQueens_test8qtvc

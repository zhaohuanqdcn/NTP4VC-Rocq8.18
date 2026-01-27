import Why3.Base
open Classical
open Lean4Why3
namespace vstte10_queens_NQueens_check_is_consistentqtvc
noncomputable def eq_board (b1 : List ℤ) (b2 : List ℤ) (pos : ℤ) := ∀(q : ℤ), (0 : ℤ) ≤ q ∧ q < pos → b1[Int.toNat q]! = b2[Int.toNat q]!
noncomputable def consistent_row (board : List ℤ) (pos : ℤ) (q : ℤ) := ¬board[Int.toNat q]! = board[Int.toNat pos]! ∧ ¬board[Int.toNat q]! - board[Int.toNat pos]! = pos - q ∧ ¬board[Int.toNat pos]! - board[Int.toNat q]! = pos - q
noncomputable def is_consistent (board : List ℤ) (pos : ℤ) := ∀(q : ℤ), (0 : ℤ) ≤ q ∧ q < pos → consistent_row board pos q
theorem check_is_consistent'vc (pos : ℤ) (board : List ℤ) (fact0 : (0 : ℤ) ≤ pos) (fact1 : pos < Int.ofNat (List.length board)) : let o1 : ℤ := pos - (1 : ℤ); ((0 : ℤ) ≤ o1 + (1 : ℤ) → (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < (0 : ℤ) → consistent_row board pos j) ∧ (∀(q : ℤ), ((0 : ℤ) ≤ q ∧ q ≤ o1) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < q → consistent_row board pos j) → ((0 : ℤ) ≤ q ∧ q < Int.ofNat (List.length board)) ∧ (let bq : ℤ := board[Int.toNat q]!; ((0 : ℤ) ≤ pos ∧ pos < Int.ofNat (List.length board)) ∧ (let bpos : ℤ := board[Int.toNat pos]!; if bq = bpos then ¬is_consistent board pos else if bq - bpos = pos - q then ¬is_consistent board pos else if bpos - bq = pos - q then ¬is_consistent board pos else ∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < q + (1 : ℤ) → consistent_row board pos j))) ∧ ((∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < o1 + (1 : ℤ) → consistent_row board pos j) → is_consistent board pos)) ∧ (o1 + (1 : ℤ) < (0 : ℤ) → is_consistent board pos)
  := sorry
end vstte10_queens_NQueens_check_is_consistentqtvc

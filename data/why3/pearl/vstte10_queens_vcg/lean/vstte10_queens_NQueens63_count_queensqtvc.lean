import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace vstte10_queens_NQueens63_count_queensqtvc
noncomputable def is_board (board : array63 (BitVec 63)) (pos : ℤ) := ∀(q : ℤ), (0 : ℤ) ≤ q ∧ q < pos → (0 : ℤ) ≤ BitVec.toInt ((array63_elts board)[Int.toNat q]!) ∧ BitVec.toInt ((array63_elts board)[Int.toNat q]!) < BitVec.toInt (array63_length board)
theorem count_queens'vc (n : BitVec 63) (fact0 : (0 : ℤ) ≤ BitVec.toInt n) : (0 : ℤ) ≤ BitVec.toInt n ∧ (∀(board : array63 (BitVec 63)), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < BitVec.toInt n → (array63_elts board)[Int.toNat i]! = (0 : BitVec 63)) ∧ array63_length board = n → array63_length board = n ∧ ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ BitVec.toInt n) ∧ is_board board (0 : ℤ))
  := sorry
end vstte10_queens_NQueens63_count_queensqtvc

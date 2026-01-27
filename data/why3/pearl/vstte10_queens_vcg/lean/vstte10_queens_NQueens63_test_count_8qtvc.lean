import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace vstte10_queens_NQueens63_test_count_8qtvc
noncomputable def is_board (board : array63 (BitVec 63)) (pos : ℤ) := ∀(q : ℤ), (0 : ℤ) ≤ q ∧ q < pos → (0 : ℤ) ≤ BitVec.toInt ((array63_elts board)[Int.toNat q]!) ∧ BitVec.toInt ((array63_elts board)[Int.toNat q]!) < BitVec.toInt (array63_length board)
theorem test_count_8'vc : (0 : ℤ) ≤ (8 : ℤ)
  := sorry
end vstte10_queens_NQueens63_test_count_8qtvc

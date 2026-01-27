import Why3.Base
open Classical
open Lean4Why3
namespace vstte10_queens_NQueens_eq_board_symqtvc
noncomputable def eq_board (b1 : List ℤ) (b2 : List ℤ) (pos : ℤ) := ∀(q : ℤ), (0 : ℤ) ≤ q ∧ q < pos → b1[Int.toNat q]! = b2[Int.toNat q]!
theorem eq_board_sym'vc (b1 : List ℤ) (b2 : List ℤ) (pos : ℤ) (fact0 : eq_board b1 b2 pos) : eq_board b2 b1 pos
  := sorry
end vstte10_queens_NQueens_eq_board_symqtvc

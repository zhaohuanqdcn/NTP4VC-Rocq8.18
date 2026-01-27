import Why3.Base
open Classical
open Lean4Why3
namespace vstte10_queens_NQueens_eq_board_transqtvc
noncomputable def eq_board (b1 : List ℤ) (b2 : List ℤ) (pos : ℤ) := ∀(q : ℤ), (0 : ℤ) ≤ q ∧ q < pos → b1[Int.toNat q]! = b2[Int.toNat q]!
theorem eq_board_trans'vc (b1 : List ℤ) (b2 : List ℤ) (pos : ℤ) (b3 : List ℤ) (fact0 : eq_board b1 b2 pos) (fact1 : eq_board b2 b3 pos) : eq_board b1 b3 pos
  := sorry
end vstte10_queens_NQueens_eq_board_transqtvc

import Why3.Base
open Classical
open Lean4Why3
namespace vstte10_queens_NQueens_eq_board_setqtvc
noncomputable def eq_board (b1 : List ℤ) (b2 : List ℤ) (pos : ℤ) := ∀(q : ℤ), (0 : ℤ) ≤ q ∧ q < pos → b1[Int.toNat q]! = b2[Int.toNat q]!
theorem eq_board_set'vc (pos : ℤ) (q : ℤ) (b : List ℤ) (i : ℤ) (fact0 : pos ≤ q) : eq_board b (List.set b (Int.toNat q) i) pos
  := sorry
end vstte10_queens_NQueens_eq_board_setqtvc

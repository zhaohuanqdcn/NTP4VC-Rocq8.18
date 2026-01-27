import Why3.Base
open Classical
open Lean4Why3
namespace vstte10_queens_NQueens_eq_board_extensionqtvc
noncomputable def eq_board (b1 : List ℤ) (b2 : List ℤ) (pos : ℤ) := ∀(q : ℤ), (0 : ℤ) ≤ q ∧ q < pos → b1[Int.toNat q]! = b2[Int.toNat q]!
theorem eq_board_extension'vc (b1 : List ℤ) (b2 : List ℤ) (pos : ℤ) (fact0 : eq_board b1 b2 pos) (fact1 : b1[Int.toNat pos]! = b2[Int.toNat pos]!) : eq_board b1 b2 (pos + (1 : ℤ))
  := sorry
end vstte10_queens_NQueens_eq_board_extensionqtvc

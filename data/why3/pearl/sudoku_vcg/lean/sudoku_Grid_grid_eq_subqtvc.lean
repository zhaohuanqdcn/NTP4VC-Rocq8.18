import Why3.Base
open Classical
open Lean4Why3
namespace sudoku_Grid_grid_eq_subqtvc
axiom grid : Type
axiom inhabited_axiom_grid : Inhabited grid
attribute [instance] inhabited_axiom_grid
noncomputable def is_index (i : ℤ) := (0 : ℤ) ≤ i ∧ i < (81 : ℤ)
noncomputable def valid_values (g : ℤ -> ℤ) := ∀(i : ℤ), is_index i → (0 : ℤ) ≤ g i ∧ g i ≤ (9 : ℤ)
noncomputable def grid_eq_sub (g1 : ℤ -> ℤ) (g2 : ℤ -> ℤ) (a : ℤ) (b : ℤ) := ∀(j : ℤ), a ≤ j ∧ j < b → g1 j = g2 j
theorem grid_eq_sub'vc (a : ℤ) (b : ℤ) (g1 : ℤ -> ℤ) (g2 : ℤ -> ℤ) (fact0 : (0 : ℤ) ≤ a) (fact1 : a ≤ (81 : ℤ)) (fact2 : (0 : ℤ) ≤ b) (fact3 : b ≤ (81 : ℤ)) (fact4 : grid_eq_sub g1 g2 (0 : ℤ) (81 : ℤ)) : grid_eq_sub g1 g2 a b
  := sorry
end sudoku_Grid_grid_eq_subqtvc

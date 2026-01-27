import Why3.Base
import pearl.sudoku_vcg.lean.sudoku.Grid
open Classical
open Lean4Why3
namespace sudoku_Solver_valid_up_to_changeqtvc
noncomputable def valid_chunk_up_to (g : ℤ -> ℤ) (i : ℤ) (start : List ℤ) (offsets : List ℤ) (off : ℤ) := let s : ℤ := start[Int.toNat i]!; ∀(o1 : ℤ) (o2 : ℤ), ((0 : ℤ) ≤ o1 ∧ o1 < off) ∧ ((0 : ℤ) ≤ o2 ∧ o2 < off) ∧ ¬o1 = o2 → (let i1 : ℤ := s + offsets[Int.toNat o1]!; let i2 : ℤ := s + offsets[Int.toNat o2]!; ((1 : ℤ) ≤ g i1 ∧ g i1 ≤ (9 : ℤ)) ∧ (1 : ℤ) ≤ g i2 ∧ g i2 ≤ (9 : ℤ) → ¬g i1 = g i2)
noncomputable def valid_up_to (s : Grid.sudoku_chunks) (g : ℤ -> ℤ) (i : ℤ) := ∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i → Grid.valid_column s g j ∧ Grid.valid_row s g j ∧ Grid.valid_square s g j
noncomputable def full_up_to (g : ℤ -> ℤ) (i : ℤ) := ∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i → (1 : ℤ) ≤ g j ∧ g j ≤ (9 : ℤ)
theorem valid_up_to_change'vc (s : Grid.sudoku_chunks) (i : ℤ) (g : ℤ -> ℤ) (x : ℤ) (fact0 : Grid.well_formed_sudoku s) (fact1 : Grid.is_index i) (fact2 : valid_up_to s g i) (fact3 : (1 : ℤ) ≤ x) (fact4 : x ≤ (9 : ℤ)) (fact5 : Grid.valid_column s (Function.update g i x) i) (fact6 : Grid.valid_row s (Function.update g i x) i) (fact7 : Grid.valid_square s (Function.update g i x) i) : valid_up_to s (Function.update g i x) (i + (1 : ℤ))
  := sorry
end sudoku_Solver_valid_up_to_changeqtvc

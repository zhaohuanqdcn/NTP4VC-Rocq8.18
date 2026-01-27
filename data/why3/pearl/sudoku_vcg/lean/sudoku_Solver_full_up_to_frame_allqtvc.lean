import Why3.Base
import pearl.sudoku_vcg.lean.sudoku.Grid
open Classical
open Lean4Why3
namespace sudoku_Solver_full_up_to_frame_allqtvc
noncomputable def valid_chunk_up_to (g : ℤ -> ℤ) (i : ℤ) (start : List ℤ) (offsets : List ℤ) (off : ℤ) := let s : ℤ := start[Int.toNat i]!; ∀(o1 : ℤ) (o2 : ℤ), ((0 : ℤ) ≤ o1 ∧ o1 < off) ∧ ((0 : ℤ) ≤ o2 ∧ o2 < off) ∧ ¬o1 = o2 → (let i1 : ℤ := s + offsets[Int.toNat o1]!; let i2 : ℤ := s + offsets[Int.toNat o2]!; ((1 : ℤ) ≤ g i1 ∧ g i1 ≤ (9 : ℤ)) ∧ (1 : ℤ) ≤ g i2 ∧ g i2 ≤ (9 : ℤ) → ¬g i1 = g i2)
noncomputable def valid_up_to (s : Grid.sudoku_chunks) (g : ℤ -> ℤ) (i : ℤ) := ∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i → Grid.valid_column s g j ∧ Grid.valid_row s g j ∧ Grid.valid_square s g j
noncomputable def full_up_to (g : ℤ -> ℤ) (i : ℤ) := ∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i → (1 : ℤ) ≤ g j ∧ g j ≤ (9 : ℤ)
theorem full_up_to_frame_all'vc (i : ℤ) (g1 : ℤ -> ℤ) (g2 : ℤ -> ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i ≤ (81 : ℤ)) (fact2 : Grid.grid_eq_sub g1 g2 (0 : ℤ) (81 : ℤ)) (fact3 : full_up_to g1 i) : full_up_to g2 i
  := sorry
end sudoku_Solver_full_up_to_frame_allqtvc

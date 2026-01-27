import Why3.Base
import pearl.sudoku_vcg.lean.sudoku.Grid
open Classical
open Lean4Why3
namespace sudoku_Solver_valid_changed_chunksqtvc
noncomputable def valid_chunk_up_to (g : ℤ -> ℤ) (i : ℤ) (start : List ℤ) (offsets : List ℤ) (off : ℤ) := let s : ℤ := start[Int.toNat i]!; ∀(o1 : ℤ) (o2 : ℤ), ((0 : ℤ) ≤ o1 ∧ o1 < off) ∧ ((0 : ℤ) ≤ o2 ∧ o2 < off) ∧ ¬o1 = o2 → (let i1 : ℤ := s + offsets[Int.toNat o1]!; let i2 : ℤ := s + offsets[Int.toNat o2]!; ((1 : ℤ) ≤ g i1 ∧ g i1 ≤ (9 : ℤ)) ∧ (1 : ℤ) ≤ g i2 ∧ g i2 ≤ (9 : ℤ) → ¬g i1 = g i2)
noncomputable def valid_up_to (s : Grid.sudoku_chunks) (g : ℤ -> ℤ) (i : ℤ) := ∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i → Grid.valid_column s g j ∧ Grid.valid_row s g j ∧ Grid.valid_square s g j
noncomputable def full_up_to (g : ℤ -> ℤ) (i : ℤ) := ∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i → (1 : ℤ) ≤ g j ∧ g j ≤ (9 : ℤ)
theorem valid_changed_chunks'vc (i1 : ℤ) (i2 : ℤ) (k : ℤ) (start : List ℤ) (g : ℤ -> ℤ) (offsets : List ℤ) (fact0 : Grid.is_index i1) (fact1 : Grid.is_index i2) (fact2 : (1 : ℤ) ≤ k) (fact3 : k ≤ (9 : ℤ)) (fact4 : start[Int.toNat i1]! = start[Int.toNat i2]!) (fact5 : Grid.valid_chunk (Function.update g i1 k) i1 start offsets) : Grid.valid_chunk (Function.update g i1 k) i2 start offsets
  := sorry
end sudoku_Solver_valid_changed_chunksqtvc

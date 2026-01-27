import Why3.Base
import pearl.sudoku_vcg.lean.sudoku.Grid
open Classical
open Lean4Why3
namespace sudoku_Solver_valid_unchanged_chunksqtvc
noncomputable def valid_chunk_up_to (g : ℤ -> ℤ) (i : ℤ) (start : List ℤ) (offsets : List ℤ) (off : ℤ) := let s : ℤ := start[Int.toNat i]!; ∀(o1 : ℤ) (o2 : ℤ), ((0 : ℤ) ≤ o1 ∧ o1 < off) ∧ ((0 : ℤ) ≤ o2 ∧ o2 < off) ∧ ¬o1 = o2 → (let i1 : ℤ := s + offsets[Int.toNat o1]!; let i2 : ℤ := s + offsets[Int.toNat o2]!; ((1 : ℤ) ≤ g i1 ∧ g i1 ≤ (9 : ℤ)) ∧ (1 : ℤ) ≤ g i2 ∧ g i2 ≤ (9 : ℤ) → ¬g i1 = g i2)
noncomputable def valid_up_to (s : Grid.sudoku_chunks) (g : ℤ -> ℤ) (i : ℤ) := ∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i → Grid.valid_column s g j ∧ Grid.valid_row s g j ∧ Grid.valid_square s g j
noncomputable def full_up_to (g : ℤ -> ℤ) (i : ℤ) := ∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i → (1 : ℤ) ≤ g j ∧ g j ≤ (9 : ℤ)
theorem valid_unchanged_chunks'vc (start : List ℤ) (offsets : List ℤ) (i1 : ℤ) (i2 : ℤ) (k : ℤ) (g : ℤ -> ℤ) (fact0 : Grid.disjoint_chunks start offsets) (fact1 : Grid.is_index i1) (fact2 : Grid.is_index i2) (fact3 : (1 : ℤ) ≤ k) (fact4 : k ≤ (9 : ℤ)) (fact5 : ¬start[Int.toNat i1]! = start[Int.toNat i2]!) (fact6 : Grid.valid_chunk g i2 start offsets) : Grid.valid_chunk (Function.update g i1 k) i2 start offsets
  := sorry
end sudoku_Solver_valid_unchanged_chunksqtvc

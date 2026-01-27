import Why3.Base
open Classical
open Lean4Why3
namespace sudoku_Grid_subset_valid_chunkqtvc
axiom grid : Type
axiom inhabited_axiom_grid : Inhabited grid
attribute [instance] inhabited_axiom_grid
noncomputable def is_index (i : ℤ) := (0 : ℤ) ≤ i ∧ i < (81 : ℤ)
noncomputable def valid_values (g : ℤ -> ℤ) := ∀(i : ℤ), is_index i → (0 : ℤ) ≤ g i ∧ g i ≤ (9 : ℤ)
noncomputable def grid_eq_sub (g1 : ℤ -> ℤ) (g2 : ℤ -> ℤ) (a : ℤ) (b : ℤ) := ∀(j : ℤ), a ≤ j ∧ j < b → g1 j = g2 j
structure sudoku_chunks where
  column_start : List ℤ
  column_offsets : List ℤ
  row_start : List ℤ
  row_offsets : List ℤ
  square_start : List ℤ
  square_offsets : List ℤ
axiom inhabited_axiom_sudoku_chunks : Inhabited sudoku_chunks
attribute [instance] inhabited_axiom_sudoku_chunks
noncomputable def chunk_valid_indexes (start : List ℤ) (offsets : List ℤ) := Int.ofNat (List.length start) = (81 : ℤ) ∧ Int.ofNat (List.length offsets) = (9 : ℤ) ∧ (∀(i : ℤ) (o1 : ℤ), is_index i ∧ (0 : ℤ) ≤ o1 ∧ o1 < (9 : ℤ) → is_index (start[Int.toNat i]! + offsets[Int.toNat o1]!))
noncomputable def disjoint_chunks (start : List ℤ) (offsets : List ℤ) := Int.ofNat (List.length start) = (81 : ℤ) ∧ Int.ofNat (List.length offsets) = (9 : ℤ) ∧ (∀(i1 : ℤ) (i2 : ℤ) (o1 : ℤ), is_index i1 ∧ is_index i2 ∧ (0 : ℤ) ≤ o1 ∧ o1 < (9 : ℤ) → (let s2 : ℤ := start[Int.toNat i2]!; ¬start[Int.toNat i1]! = s2 → ¬i1 = s2 + offsets[Int.toNat o1]!))
noncomputable def well_formed_sudoku (s : sudoku_chunks) := chunk_valid_indexes (sudoku_chunks.column_start s) (sudoku_chunks.column_offsets s) ∧ chunk_valid_indexes (sudoku_chunks.row_start s) (sudoku_chunks.row_offsets s) ∧ chunk_valid_indexes (sudoku_chunks.square_start s) (sudoku_chunks.square_offsets s) ∧ disjoint_chunks (sudoku_chunks.column_start s) (sudoku_chunks.column_offsets s) ∧ disjoint_chunks (sudoku_chunks.row_start s) (sudoku_chunks.row_offsets s) ∧ disjoint_chunks (sudoku_chunks.square_start s) (sudoku_chunks.square_offsets s)
noncomputable def valid_chunk (g : ℤ -> ℤ) (i : ℤ) (start : List ℤ) (offsets : List ℤ) := let s : ℤ := start[Int.toNat i]!; ∀(o1 : ℤ) (o2 : ℤ), ((0 : ℤ) ≤ o1 ∧ o1 < (9 : ℤ)) ∧ ((0 : ℤ) ≤ o2 ∧ o2 < (9 : ℤ)) ∧ ¬o1 = o2 → (let i1 : ℤ := s + offsets[Int.toNat o1]!; let i2 : ℤ := s + offsets[Int.toNat o2]!; ((1 : ℤ) ≤ g i1 ∧ g i1 ≤ (9 : ℤ)) ∧ (1 : ℤ) ≤ g i2 ∧ g i2 ≤ (9 : ℤ) → ¬g i1 = g i2)
noncomputable def valid_column (s : sudoku_chunks) (g : ℤ -> ℤ) (i : ℤ) := valid_chunk g i (sudoku_chunks.column_start s) (sudoku_chunks.column_offsets s)
noncomputable def valid_row (s : sudoku_chunks) (g : ℤ -> ℤ) (i : ℤ) := valid_chunk g i (sudoku_chunks.row_start s) (sudoku_chunks.row_offsets s)
noncomputable def valid_square (s : sudoku_chunks) (g : ℤ -> ℤ) (i : ℤ) := valid_chunk g i (sudoku_chunks.square_start s) (sudoku_chunks.square_offsets s)
noncomputable def valid (s : sudoku_chunks) (g : ℤ -> ℤ) := ∀(i : ℤ), is_index i → valid_column s g i ∧ valid_row s g i ∧ valid_square s g i
noncomputable def full (g : ℤ -> ℤ) := ∀(i : ℤ), is_index i → (1 : ℤ) ≤ g i ∧ g i ≤ (9 : ℤ)
noncomputable def included (g1 : ℤ -> ℤ) (g2 : ℤ -> ℤ) := ∀(i : ℤ), is_index i ∧ (1 : ℤ) ≤ g1 i ∧ g1 i ≤ (9 : ℤ) → g2 i = g1 i
theorem subset_valid_chunk'vc (g : ℤ -> ℤ) (h : ℤ -> ℤ) (i : ℤ) (s : List ℤ) (o1 : List ℤ) (fact0 : included g h) (fact1 : is_index i) (fact2 : chunk_valid_indexes s o1) (fact3 : valid_chunk h i s o1) : valid_chunk g i s o1
  := sorry
end sudoku_Grid_subset_valid_chunkqtvc

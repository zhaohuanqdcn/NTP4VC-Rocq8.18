import Why3.Base
import pearl.sudoku_vcg.lean.sudoku.Grid
open Classical
open Lean4Why3
namespace sudoku_Solver_solveqtvc
noncomputable def valid_chunk_up_to (g : ℤ -> ℤ) (i : ℤ) (start : List ℤ) (offsets : List ℤ) (off : ℤ) := let s : ℤ := start[Int.toNat i]!; ∀(o1 : ℤ) (o2 : ℤ), ((0 : ℤ) ≤ o1 ∧ o1 < off) ∧ ((0 : ℤ) ≤ o2 ∧ o2 < off) ∧ ¬o1 = o2 → (let i1 : ℤ := s + offsets[Int.toNat o1]!; let i2 : ℤ := s + offsets[Int.toNat o2]!; ((1 : ℤ) ≤ g i1 ∧ g i1 ≤ (9 : ℤ)) ∧ (1 : ℤ) ≤ g i2 ∧ g i2 ≤ (9 : ℤ) → ¬g i1 = g i2)
noncomputable def valid_up_to (s : Grid.sudoku_chunks) (g : ℤ -> ℤ) (i : ℤ) := ∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i → Grid.valid_column s g j ∧ Grid.valid_row s g j ∧ Grid.valid_square s g j
noncomputable def full_up_to (g : ℤ -> ℤ) (i : ℤ) := ∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i → (1 : ℤ) ≤ g j ∧ g j ≤ (9 : ℤ)
theorem solve'vc (s : Grid.sudoku_chunks) (g : List ℤ) (fact0 : Grid.well_formed_sudoku s) (fact1 : Int.ofNat (List.length g) = (81 : ℤ)) (fact2 : Grid.valid_values (getElem! g ∘ Int.toNat)) : Grid.well_formed_sudoku s ∧ Int.ofNat (List.length g) = (81 : ℤ) ∧ Grid.valid_values (getElem! g ∘ Int.toNat) ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (81 : ℤ) ∧ valid_up_to s (getElem! g ∘ Int.toNat) (0 : ℤ) ∧ full_up_to (getElem! g ∘ Int.toNat) (0 : ℤ) ∧ (∀(g1 : List ℤ), List.length g1 = List.length g → Grid.grid_eq_sub (getElem! g ∘ Int.toNat) (getElem! g1 ∘ Int.toNat) (0 : ℤ) (81 : ℤ) ∧ (∀(h : ℤ -> ℤ), Grid.included (getElem! g1 ∘ Int.toNat) h ∧ Grid.full h → ¬Grid.valid s h) → (∀(h : ℤ -> ℤ), Grid.included (getElem! g1 ∘ Int.toNat) h ∧ Grid.full h → ¬Grid.valid s h))
  := sorry
end sudoku_Solver_solveqtvc

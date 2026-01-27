import Why3.Base
import pearl.schorr_waite_via_recursion_vcg.lean.schorr_waite_via_recursion.Memory
open Classical
open Lean4Why3
namespace GraphShape
noncomputable def black (c : Memory.color) := ¬c = Memory.color.White
noncomputable def edge (m : Memory.memory) (x : Memory.loc) (y : Memory.loc) := ¬x = Memory.null ∧ (∃(n : ℤ), ((0 : ℤ) ≤ n ∧ n < Memory.block_size m x) ∧ Memory.accessor m x n = y)
inductive path : Memory.memory -> Memory.loc -> Memory.loc -> Prop where
 | path_nil (m : Memory.memory) (x : Memory.loc) : path m x x
 | path_cons (m : Memory.memory) (x : Memory.loc) (y : Memory.loc) (z : Memory.loc) : edge m x y → path m y z → path m x z
noncomputable def well_colored_on (graph : Finset Memory.loc) (gray : Finset Memory.loc) (m : Memory.memory) (cl : Memory.loc -> Memory.color) := gray ⊆ graph ∧ (∀(x : Memory.loc) (y : Memory.loc), x ∈ graph ∧ edge m x y ∧ ¬y = Memory.null ∧ black (cl x) → x ∈ gray ∨ black (cl y)) ∧ (∀(x : Memory.loc), x ∈ gray → black (cl x))
noncomputable def unchanged (m1 : Memory.memory) (m2 : Memory.memory) := ∀(x : Memory.loc) (n : ℤ), ¬x = Memory.null ∧ (0 : ℤ) ≤ n ∧ n < Memory.block_size m1 x → Memory.accessor m2 x n = Memory.accessor m1 x n
end GraphShape

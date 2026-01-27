import Why3.Base
import pearl.schorr_waite_with_ghost_monitor_vcg.lean.schorr_waite_with_ghost_monitor.Memory
open Classical
open Lean4Why3
namespace GraphShape
noncomputable def edge (m : Memory.memory) (x : Memory.loc) (y : Memory.loc) := ¬x = Memory.null ∧ (Memory.left1 m x = y ∨ Memory.right1 m x = y)
inductive path : Memory.memory -> Memory.loc -> Memory.loc -> Prop where
 | path_nil (m : Memory.memory) (x : Memory.loc) : path m x x
 | path_cons (m : Memory.memory) (x : Memory.loc) (y : Memory.loc) (z : Memory.loc) : edge m x y → path m y z → path m x z
noncomputable def well_colored_on (graph : Finset Memory.loc) (gray : Finset Memory.loc) (m : Memory.memory) (mark : Memory.loc -> Bool) := gray ⊆ graph ∧ (∀(x : Memory.loc), x ∈ gray → mark x = true) ∧ (∀(x : Memory.loc) (y : Memory.loc), x ∈ graph ∧ edge m x y ∧ ¬y = Memory.null ∧ mark x = true → x ∈ gray ∨ mark y = true)
noncomputable def unchanged_structure (m1 : Memory.memory) (m2 : Memory.memory) := ∀(x : Memory.loc), ¬x = Memory.null → Memory.left1 m2 x = Memory.left1 m1 x ∧ Memory.right1 m2 x = Memory.right1 m1 x
end GraphShape

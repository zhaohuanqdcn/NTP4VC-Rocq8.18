import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace dfs_DFS_reformulationqtvc
axiom loc : Type
axiom inhabited_axiom_loc : Inhabited loc
attribute [instance] inhabited_axiom_loc
axiom null : loc
axiom root : loc
axiom left1 : loc -> loc
axiom right1 : loc -> loc
axiom marks : Type
axiom inhabited_axiom_marks : Inhabited marks
attribute [instance] inhabited_axiom_marks
noncomputable def edge (x : loc) (y : loc) := ¬x = null ∧ (left1 x = y ∨ right1 x = y)
inductive path : loc -> loc -> Prop where
 | path_nil (x : loc) : path x x
 | path_cons (x : loc) (y : loc) (z : loc) : path x y → edge y z → path x z
noncomputable def only_descendants_are_marked (marked : loc -> Bool) := ∀(x : loc), ¬x = null ∧ marked x = true → path root x
noncomputable def well_colored (marked : loc -> Bool) (busy : loc -> Bool) := ∀(x : loc) (y : loc), edge x y → ¬y = null → busy x = true ∨ (marked x = true → marked y = true)
noncomputable def all_descendants_are_marked (marked : loc -> Bool) := ¬root = null → marked root = true ∧ (∀(x : loc) (y : loc), edge x y → marked x = true → ¬y = null → marked y = true)
theorem reformulation'vc (marked : loc -> Bool) (x : loc) (fact0 : all_descendants_are_marked marked) (fact1 : ¬x = null) (fact2 : path root x) : marked x = true ∧ ¬root = null
  := sorry
end dfs_DFS_reformulationqtvc

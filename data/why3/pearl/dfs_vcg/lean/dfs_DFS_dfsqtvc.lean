import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace dfs_DFS_dfsqtvc
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
theorem dfs'vc (marked : loc -> Bool) (busy : loc -> Bool) (c : loc) (o1 : Bool) (fact0 : well_colored marked busy) (fact1 : only_descendants_are_marked marked) (fact2 : path root c) (fact3 : if ¬c = null then o1 = (if marked c = true then false else true) else o1 = false) : if o1 = true then let o2 : loc := left1 c; (well_colored (Function.update marked c true) (Function.update busy c true) ∧ only_descendants_are_marked (Function.update marked c true) ∧ path root o2) ∧ (∀(busy1 : loc -> Bool) (marked1 : loc -> Bool), well_colored marked1 busy1 ∧ (∀(x : loc), Function.update marked c true x = true → marked1 x = true) ∧ (¬o2 = null → marked1 o2 = true) ∧ (∀(x : loc), busy1 x = true → Function.update busy c true x = true) ∧ only_descendants_are_marked marked1 → (let o3 : loc := right1 c; (well_colored marked1 busy1 ∧ only_descendants_are_marked marked1 ∧ path root o3) ∧ (∀(busy2 : loc -> Bool) (marked2 : loc -> Bool), well_colored marked2 busy2 ∧ (∀(x : loc), marked1 x = true → marked2 x = true) ∧ (¬o3 = null → marked2 o3 = true) ∧ (∀(x : loc), busy2 x = true → busy1 x = true) ∧ only_descendants_are_marked marked2 → well_colored marked2 (Function.update busy2 c false) ∧ (∀(x : loc), marked x = true → marked2 x = true) ∧ (¬c = null → marked2 c = true) ∧ (∀(x : loc), Function.update busy2 c false x = true → busy x = true) ∧ only_descendants_are_marked marked2))) else well_colored marked busy ∧ (¬c = null → marked c = true) ∧ only_descendants_are_marked marked
  := sorry
end dfs_DFS_dfsqtvc

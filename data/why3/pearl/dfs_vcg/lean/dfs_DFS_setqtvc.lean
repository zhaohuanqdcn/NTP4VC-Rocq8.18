import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace dfs_DFS_setqtvc
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
axiom o1 : (loc -> Bool) -> loc -> Bool -> loc -> Bool
axiom o'def (m : loc -> Bool) (l : loc) (b : Bool) (x : loc) : (o1 m l b x = true) = (if x = l then b = true else m x = true)
theorem set'vc (m : loc -> Bool) (l : loc) (b : Bool) (m1 : loc -> Bool) (fact0 : ∀(x : loc), (m x = true) = (if x = l then b = true else m1 x = true)) : m = Function.update m1 l b
  := sorry
end dfs_DFS_setqtvc

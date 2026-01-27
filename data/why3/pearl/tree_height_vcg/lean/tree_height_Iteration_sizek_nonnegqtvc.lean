import Why3.Base
import Why3.why3.Ref.Ref
import Why3.bintree.Tree
import Why3.bintree.Size
import Why3.bintree.Height
open Classical
open Lean4Why3
namespace tree_height_Iteration_sizek_nonnegqtvc
inductive cont (α : Type) where
  | Id : cont α
  | Kleft : Tree.tree α -> cont α -> cont α
  | Kright : ℤ -> cont α -> cont α
axiom inhabited_axiom_cont {α : Type} [Inhabited α] : Inhabited (cont α)
attribute [instance] inhabited_axiom_cont
inductive what (α : Type) where
  | Argument : Tree.tree α -> what α
  | Result : ℤ -> what α
axiom inhabited_axiom_what {α : Type} [Inhabited α] : Inhabited (what α)
attribute [instance] inhabited_axiom_what
noncomputable def is_id {α : Type} [Inhabited α] (k : cont α) := match k with | (cont.Id : cont α) => True | _ => False
noncomputable def is_result {α : Type} [Inhabited α] (w : what α) := match w with | what.Result _ => True | _ => False
noncomputable def evalk {α : Type} [Inhabited α] : cont α -> ℤ -> ℤ
  | (cont.Id : cont α), r => r
  | (cont.Kleft l k1), r => evalk k1 ((1 : ℤ) + max (Height.height l) r)
  | (cont.Kright x k1), r => evalk k1 ((1 : ℤ) + max x r)
noncomputable def evalw {α : Type} [Inhabited α] (w : what α) := match w with | what.Argument t => Height.height t | what.Result x => x
noncomputable def sizek {α : Type} [Inhabited α] : cont α -> ℤ
  | (cont.Id : cont α) => (0 : ℤ)
  | (cont.Kleft t k1) => (3 : ℤ) + (4 : ℤ) * Size.size t + sizek k1
  | (cont.Kright x k1) => (1 : ℤ) + sizek k1
theorem sizek_nonneg'vc {α : Type} [Inhabited α] (k : cont α) : (0 : ℤ) ≤ sizek k
  := sorry
end tree_height_Iteration_sizek_nonnegqtvc

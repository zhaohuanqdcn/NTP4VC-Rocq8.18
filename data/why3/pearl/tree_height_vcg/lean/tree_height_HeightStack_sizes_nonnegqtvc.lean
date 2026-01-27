import Why3.Base
import Why3.bintree.Tree
import Why3.bintree.Size
import Why3.bintree.Height
open Classical
open Lean4Why3
namespace tree_height_HeightStack_sizes_nonnegqtvc
axiom stack : Type -> Type
axiom inhabited_axiom_stack {α : Type} [Inhabited α] : Inhabited (stack α)
attribute [instance] inhabited_axiom_stack
noncomputable def heights {α : Type} [Inhabited α] : List (ℤ × Tree.tree α) -> ℤ
  | ([] : List (ℤ × Tree.tree α)) => (0 : ℤ)
  | (List.cons (h, t) s') => max (h + Height.height t) (heights s')
noncomputable def sizes {α : Type} [Inhabited α] : List (ℤ × Tree.tree α) -> ℤ
  | ([] : List (ℤ × Tree.tree α)) => (0 : ℤ)
  | (List.cons (x, t) s') => Size.size t + sizes s'
theorem sizes_nonneg'vc {α : Type} [Inhabited α] (s : List (ℤ × Tree.tree α)) : (0 : ℤ) ≤ sizes s
  := sorry
end tree_height_HeightStack_sizes_nonnegqtvc

import Why3.Base
import Why3.bintree.Tree
import Why3.bintree.Size
import Why3.bintree.Height
open Classical
open Lean4Why3
namespace tree_height_HeightStack_height_stackqtvc
axiom stack : Type -> Type
axiom inhabited_axiom_stack {α : Type} [Inhabited α] : Inhabited (stack α)
attribute [instance] inhabited_axiom_stack
noncomputable def heights {α : Type} [Inhabited α] : List (ℤ × Tree.tree α) -> ℤ
  | ([] : List (ℤ × Tree.tree α)) => (0 : ℤ)
  | (List.cons (h, t) s') => max (h + Height.height t) (heights s')
noncomputable def sizes {α : Type} [Inhabited α] : List (ℤ × Tree.tree α) -> ℤ
  | ([] : List (ℤ × Tree.tree α)) => (0 : ℤ)
  | (List.cons (x, t) s') => Size.size t + sizes s'
theorem height_stack'vc {α : Type} [Inhabited α] (m : ℤ) (s : List (ℤ × Tree.tree α)) (fact0 : (0 : ℤ) ≤ m) : (match s with | ([] : List (ℤ × Tree.tree α)) => True | List.cons (h, (Tree.tree.Empty : Tree.tree α)) s' => ((0 : ℤ) ≤ sizes s ∧ sizes s' < sizes s ∨ sizes s = sizes s' ∧ (match s with | ([] : List (ℤ × Tree.tree α)) => False | List.cons _ f => f = s')) ∧ (0 : ℤ) ≤ max m h | List.cons (h, Tree.tree.Node l _ r) s' => (let o1 : List (ℤ × Tree.tree α) := List.cons (h + (1 : ℤ), l) (List.cons (h + (1 : ℤ), r) s'); ((0 : ℤ) ≤ sizes s ∧ sizes o1 < sizes s ∨ sizes s = sizes o1 ∧ (match s with | ([] : List (ℤ × Tree.tree α)) => False | List.cons _ f => f = o1)) ∧ (0 : ℤ) ≤ m)) ∧ (∀(result : ℤ), (match s with | ([] : List (ℤ × Tree.tree α)) => result = m | List.cons (h, (Tree.tree.Empty : Tree.tree α)) s' => result = max (max m h) (heights s') | List.cons (h, Tree.tree.Node l _ r) s' => result = max m (heights (List.cons (h + (1 : ℤ), l) (List.cons (h + (1 : ℤ), r) s')))) → result = max m (heights s))
  := sorry
end tree_height_HeightStack_height_stackqtvc

import Why3.Base
import Why3.bintree.Tree
import Why3.bintree.Size
open Classical
open Lean4Why3
namespace flexible_arrays_BraunTrees_get_treeqtvc
noncomputable def braun {α : Type} [Inhabited α] : Tree.tree α -> Prop
  | (Tree.tree.Empty : Tree.tree α) => True
  | (Tree.tree.Node l x r) => (Size.size l = Size.size r ∨ Size.size l = Size.size r + (1 : ℤ)) ∧ braun l ∧ braun r
theorem get_tree'vc {α : Type} [Inhabited α] (i : ℤ) (t : Tree.tree α) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < Size.size t) (fact2 : braun t) : match t with | (Tree.tree.Empty : Tree.tree α) => False | Tree.tree.Node l x r => ¬i = (0 : ℤ) → ¬(2 : ℤ) = (0 : ℤ) ∧ (if Int.tmod i (2 : ℤ) = (1 : ℤ) then ¬(2 : ℤ) = (0 : ℤ) ∧ (let o1 : ℤ := Int.tdiv i (2 : ℤ); (match t with | (Tree.tree.Empty : Tree.tree α) => False | Tree.tree.Node f _ f1 => f = l ∨ f1 = l) ∧ ((0 : ℤ) ≤ o1 ∧ o1 < Size.size l) ∧ braun l) else ¬(2 : ℤ) = (0 : ℤ) ∧ (let o1 : ℤ := Int.tdiv i (2 : ℤ) - (1 : ℤ); (match t with | (Tree.tree.Empty : Tree.tree α) => False | Tree.tree.Node f _ f1 => f = r ∨ f1 = r) ∧ ((0 : ℤ) ≤ o1 ∧ o1 < Size.size r) ∧ braun r))
  := sorry
end flexible_arrays_BraunTrees_get_treeqtvc

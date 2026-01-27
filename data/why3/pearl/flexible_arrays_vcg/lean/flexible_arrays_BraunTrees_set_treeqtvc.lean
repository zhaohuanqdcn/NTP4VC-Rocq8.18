import Why3.Base
import Why3.bintree.Tree
import Why3.bintree.Size
open Classical
open Lean4Why3
namespace flexible_arrays_BraunTrees_set_treeqtvc
noncomputable def braun {α : Type} [Inhabited α] : Tree.tree α -> Prop
  | (Tree.tree.Empty : Tree.tree α) => True
  | (Tree.tree.Node l x r) => (Size.size l = Size.size r ∨ Size.size l = Size.size r + (1 : ℤ)) ∧ braun l ∧ braun r
axiom get_tree :  {α : Type} -> [Inhabited α] -> Tree.tree α -> ℤ -> α
axiom get_tree'def {α : Type} [Inhabited α] (i : ℤ) (t : Tree.tree α) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < Size.size t) (fact2 : braun t) : match t with | (Tree.tree.Empty : Tree.tree α) => False | Tree.tree.Node l x r => (if i = (0 : ℤ) then get_tree t i = x else if Int.tmod i (2 : ℤ) = (1 : ℤ) then get_tree t i = get_tree l (Int.tdiv i (2 : ℤ)) else get_tree t i = get_tree r (Int.tdiv i (2 : ℤ) - (1 : ℤ)))
theorem set_tree'vc {α : Type} [Inhabited α] (i : ℤ) (t : Tree.tree α) (v : α) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < Size.size t) (fact2 : braun t) : (match t with | (Tree.tree.Empty : Tree.tree α) => False | Tree.tree.Node l x r => ¬i = (0 : ℤ) → ¬(2 : ℤ) = (0 : ℤ) ∧ (if Int.tmod i (2 : ℤ) = (1 : ℤ) then ¬(2 : ℤ) = (0 : ℤ) ∧ (let o1 : ℤ := Int.tdiv i (2 : ℤ); (match t with | (Tree.tree.Empty : Tree.tree α) => False | Tree.tree.Node f _ f1 => f = l ∨ f1 = l) ∧ ((0 : ℤ) ≤ o1 ∧ o1 < Size.size l) ∧ braun l) else ¬(2 : ℤ) = (0 : ℤ) ∧ (let o1 : ℤ := Int.tdiv i (2 : ℤ) - (1 : ℤ); (match t with | (Tree.tree.Empty : Tree.tree α) => False | Tree.tree.Node f _ f1 => f = r ∨ f1 = r) ∧ ((0 : ℤ) ≤ o1 ∧ o1 < Size.size r) ∧ braun r))) ∧ (∀(r : Tree.tree α), (match t with | (Tree.tree.Empty : Tree.tree α) => False | Tree.tree.Node l x r1 => (if i = (0 : ℤ) then r = Tree.tree.Node l v r1 else if Int.tmod i (2 : ℤ) = (1 : ℤ) then let o1 : ℤ := Int.tdiv i (2 : ℤ); ∃(o2 : Tree.tree α), (Size.size o2 = Size.size l ∧ braun o2 ∧ get_tree o2 o1 = v ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < Size.size l → ¬j = o1 → get_tree o2 j = get_tree l j)) ∧ r = Tree.tree.Node o2 x r1 else let o1 : ℤ := Int.tdiv i (2 : ℤ) - (1 : ℤ); ∃(o2 : Tree.tree α), (Size.size o2 = Size.size r1 ∧ braun o2 ∧ get_tree o2 o1 = v ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < Size.size r1 → ¬j = o1 → get_tree o2 j = get_tree r1 j)) ∧ r = Tree.tree.Node l x o2)) → Size.size r = Size.size t ∧ braun r ∧ get_tree r i = v ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < Size.size t → ¬j = i → get_tree r j = get_tree t j))
  := sorry
end flexible_arrays_BraunTrees_set_treeqtvc

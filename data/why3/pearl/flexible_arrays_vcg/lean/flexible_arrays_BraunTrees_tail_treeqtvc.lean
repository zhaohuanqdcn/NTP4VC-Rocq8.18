import Why3.Base
import Why3.bintree.Tree
import Why3.bintree.Size
open Classical
open Lean4Why3
namespace flexible_arrays_BraunTrees_tail_treeqtvc
noncomputable def braun {α : Type} [Inhabited α] : Tree.tree α -> Prop
  | (Tree.tree.Empty : Tree.tree α) => True
  | (Tree.tree.Node l x r) => (Size.size l = Size.size r ∨ Size.size l = Size.size r + (1 : ℤ)) ∧ braun l ∧ braun r
axiom get_tree :  {α : Type} -> [Inhabited α] -> Tree.tree α -> ℤ -> α
axiom get_tree'def {α : Type} [Inhabited α] (i : ℤ) (t : Tree.tree α) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < Size.size t) (fact2 : braun t) : match t with | (Tree.tree.Empty : Tree.tree α) => False | Tree.tree.Node l x r => (if i = (0 : ℤ) then get_tree t i = x else if Int.tmod i (2 : ℤ) = (1 : ℤ) then get_tree t i = get_tree l (Int.tdiv i (2 : ℤ)) else get_tree t i = get_tree r (Int.tdiv i (2 : ℤ) - (1 : ℤ)))
axiom set_tree :  {α : Type} -> [Inhabited α] -> Tree.tree α -> ℤ -> α -> Tree.tree α
axiom set_tree'spec'2 {α : Type} [Inhabited α] (i : ℤ) (t : Tree.tree α) (v : α) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < Size.size t) (fact2 : braun t) : Size.size (set_tree t i v) = Size.size t
axiom set_tree'spec'1 {α : Type} [Inhabited α] (i : ℤ) (t : Tree.tree α) (v : α) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < Size.size t) (fact2 : braun t) : braun (set_tree t i v)
axiom set_tree'spec'0 {α : Type} [Inhabited α] (i : ℤ) (t : Tree.tree α) (v : α) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < Size.size t) (fact2 : braun t) : get_tree (set_tree t i v) i = v
axiom set_tree'spec {α : Type} [Inhabited α] (i : ℤ) (t : Tree.tree α) (j : ℤ) (v : α) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < Size.size t) (fact2 : braun t) (fact3 : (0 : ℤ) ≤ j) (fact4 : j < Size.size t) (fact5 : ¬j = i) : get_tree (set_tree t i v) j = get_tree t j
theorem tail_tree'vc {α : Type} [Inhabited α] (t : Tree.tree α) (fact0 : braun t) (fact1 : (0 : ℤ) < Size.size t) : (match t with | (Tree.tree.Empty : Tree.tree α) => False | Tree.tree.Node (Tree.tree.Empty : Tree.tree α) _ (Tree.tree.Empty : Tree.tree α) => True | Tree.tree.Node l _ r => ((match t with | (Tree.tree.Empty : Tree.tree α) => False | Tree.tree.Node f _ f1 => f = l ∨ f1 = l) ∧ braun l ∧ (0 : ℤ) < Size.size l) ∧ (∀(o1 : Tree.tree α), Size.size o1 = Size.size l - (1 : ℤ) ∧ braun o1 ∧ (∀(i : ℤ), (0 : ℤ) < i ∧ i < Size.size l → get_tree o1 (i - (1 : ℤ)) = get_tree l i) → ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) < Size.size l) ∧ braun l)) ∧ (∀(r : Tree.tree α), (match t with | (Tree.tree.Empty : Tree.tree α) => False | Tree.tree.Node (Tree.tree.Empty : Tree.tree α) _ (Tree.tree.Empty : Tree.tree α) => r = (Tree.tree.Empty : Tree.tree α) | Tree.tree.Node l _ r1 => (∃(o1 : Tree.tree α), (Size.size o1 = Size.size l - (1 : ℤ) ∧ braun o1 ∧ (∀(i : ℤ), (0 : ℤ) < i ∧ i < Size.size l → get_tree o1 (i - (1 : ℤ)) = get_tree l i)) ∧ r = Tree.tree.Node r1 (get_tree l (0 : ℤ)) o1)) → Size.size r = Size.size t - (1 : ℤ) ∧ braun r ∧ (∀(i : ℤ), (0 : ℤ) < i ∧ i < Size.size t → get_tree r (i - (1 : ℤ)) = get_tree t i))
  := sorry
end flexible_arrays_BraunTrees_tail_treeqtvc

import Why3.Base
import Why3.bintree.Tree
import Why3.bintree.Size
open Classical
open Lean4Why3
namespace BraunTrees
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
end BraunTrees

import Why3.Base
import Why3.bintree.Tree
import Why3.bintree.Size
import Why3.bintree.Occ
open Classical
open Lean4Why3
namespace braun_trees_BraunHeaps_diffqtvc
axiom elt : Type
axiom inhabited_axiom_elt : Inhabited elt
attribute [instance] inhabited_axiom_elt
axiom le : elt -> elt -> Prop
axiom Refl (x : elt) : le x x
axiom Trans (x : elt) (y : elt) (z : elt) (fact0 : le x y) (fact1 : le y z) : le x z
axiom Total (x : elt) (y : elt) : le x y ∨ le y x
noncomputable def le_root (e : elt) (t : Tree.tree elt) := match t with | (Tree.tree.Empty : Tree.tree elt) => True | Tree.tree.Node _ x _ => le e x
noncomputable def heap : Tree.tree elt -> Prop
  | (Tree.tree.Empty : Tree.tree elt) => True
  | (Tree.tree.Node l x r) => le_root x l ∧ heap l ∧ le_root x r ∧ heap r
axiom minimum : Tree.tree elt -> elt
axiom minimum_def (l : Tree.tree elt) (x : elt) (r : Tree.tree elt) : minimum (Tree.tree.Node l x r) = x
noncomputable def is_minimum (x : elt) (t : Tree.tree elt) := Occ.mem x t ∧ (∀(e : elt), Occ.mem e t → le x e)
noncomputable def inv : Tree.tree elt -> Prop
  | (Tree.tree.Empty : Tree.tree elt) => True
  | (Tree.tree.Node l x r) => (Size.size l = Size.size r ∨ Size.size l = Size.size r + (1 : ℤ)) ∧ inv l ∧ inv r
axiom empty : Tree.tree elt
axiom empty'def : heap empty ∧ inv empty ∧ Size.size empty = (0 : ℤ) ∧ (∀(e : elt), ¬Occ.mem e empty)
theorem diff'vc (t : Tree.tree elt) (m : ℤ) (fact0 : inv t) (fact1 : (0 : ℤ) ≤ m) (fact2 : m ≤ Size.size t) (fact3 : Size.size t ≤ m + (1 : ℤ)) : (match t with | (Tree.tree.Empty : Tree.tree elt) => True | Tree.tree.Node l _ r => ¬m = (0 : ℤ) → ¬(2 : ℤ) = (0 : ℤ) ∧ (if Int.tmod m (2 : ℤ) = (1 : ℤ) then ¬(2 : ℤ) = (0 : ℤ) ∧ (let o1 : ℤ := Int.tdiv m (2 : ℤ); (match t with | (Tree.tree.Empty : Tree.tree elt) => False | Tree.tree.Node f _ f1 => f = l ∨ f1 = l) ∧ inv l ∧ (0 : ℤ) ≤ o1 ∧ o1 ≤ Size.size l ∧ Size.size l ≤ o1 + (1 : ℤ)) else ¬(2 : ℤ) = (0 : ℤ) ∧ (let o1 : ℤ := Int.tdiv (m - (1 : ℤ)) (2 : ℤ); (match t with | (Tree.tree.Empty : Tree.tree elt) => False | Tree.tree.Node f _ f1 => f = r ∨ f1 = r) ∧ inv r ∧ (0 : ℤ) ≤ o1 ∧ o1 ≤ Size.size r ∧ Size.size r ≤ o1 + (1 : ℤ)))) ∧ (∀(result : ℤ), (match t with | (Tree.tree.Empty : Tree.tree elt) => result = (0 : ℤ) | Tree.tree.Node l _ r => (if m = (0 : ℤ) then result = (1 : ℤ) else if Int.tmod m (2 : ℤ) = (1 : ℤ) then Size.size l = Int.tdiv m (2 : ℤ) + result else Size.size r = Int.tdiv (m - (1 : ℤ)) (2 : ℤ) + result)) → Size.size t = m + result)
  := sorry
end braun_trees_BraunHeaps_diffqtvc

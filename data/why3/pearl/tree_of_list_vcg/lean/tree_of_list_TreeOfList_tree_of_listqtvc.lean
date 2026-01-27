import Why3.Base
import Why3.bintree.Tree
import Why3.bintree.Size
import Why3.bintree.Height
import Why3.bintree.Inorder
import Why3.bintree.InorderLength
open Classical
open Lean4Why3
namespace tree_of_list_TreeOfList_tree_of_listqtvc
axiom elt : Type
axiom inhabited_axiom_elt : Inhabited elt
attribute [instance] inhabited_axiom_elt
theorem tree_of_list'vc (l : List elt) : let o1 : ℤ := Int.ofNat (List.length l); ((0 : ℤ) ≤ o1 ∧ o1 ≤ Int.ofNat (List.length l)) ∧ (∀(o2 : Tree.tree elt) (o3 : List elt), Inorder.inorder o2 ++ o3 = l ∧ Size.size o2 = o1 ∧ ((0 : ℤ) < o1 → (let h : ℤ := Height.height o2; HPow.hPow (2 : ℤ) (Int.toNat (h - (1 : ℤ))) ≤ o1 ∧ o1 < HPow.hPow (2 : ℤ) (Int.toNat h))) → Inorder.inorder o2 = l ∧ ((0 : ℤ) < Size.size o2 → (let h : ℤ := Height.height o2; HPow.hPow (2 : ℤ) (Int.toNat (h - (1 : ℤ))) ≤ Size.size o2 ∧ Size.size o2 < HPow.hPow (2 : ℤ) (Int.toNat h))))
  := sorry
end tree_of_list_TreeOfList_tree_of_listqtvc

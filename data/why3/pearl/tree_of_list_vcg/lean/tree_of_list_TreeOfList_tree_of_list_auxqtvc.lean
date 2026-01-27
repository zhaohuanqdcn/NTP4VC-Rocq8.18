import Why3.Base
import Why3.bintree.Tree
import Why3.bintree.Size
import Why3.bintree.Height
import Why3.bintree.Inorder
import Why3.bintree.InorderLength
open Classical
open Lean4Why3
namespace tree_of_list_TreeOfList_tree_of_list_auxqtvc
axiom elt : Type
axiom inhabited_axiom_elt : Inhabited elt
attribute [instance] inhabited_axiom_elt
theorem tree_of_list_aux'vc (n : ℤ) (l : List elt) (fact0 : (0 : ℤ) ≤ n) (fact1 : n ≤ Int.ofNat (List.length l)) : (¬n = (0 : ℤ) → (let n1 : ℤ := n - (1 : ℤ); ¬(2 : ℤ) = (0 : ℤ) ∧ (let n11 : ℤ := Int.tdiv n1 (2 : ℤ); (((0 : ℤ) ≤ n ∧ n11 < n) ∧ (0 : ℤ) ≤ n11 ∧ n11 ≤ Int.ofNat (List.length l)) ∧ (∀(left1 : Tree.tree elt) (l1 : List elt), Inorder.inorder left1 ++ l1 = l ∧ Size.size left1 = n11 ∧ ((0 : ℤ) < n11 → (let h : ℤ := Height.height left1; HPow.hPow (2 : ℤ) (Int.toNat (h - (1 : ℤ))) ≤ n11 ∧ n11 < HPow.hPow (2 : ℤ) (Int.toNat h))) → (match l1 with | ([] : List elt) => False | List.cons x l2 => (let o1 : ℤ := n1 - n11; ((0 : ℤ) ≤ n ∧ o1 < n) ∧ (0 : ℤ) ≤ o1 ∧ o1 ≤ Int.ofNat (List.length l2))))))) ∧ (∀(t : Tree.tree elt) (l' : List elt), (if n = (0 : ℤ) then t = (Tree.tree.Empty : Tree.tree elt) ∧ l' = l else let n1 : ℤ := n - (1 : ℤ); let n11 : ℤ := Int.tdiv n1 (2 : ℤ); ∃(t1 : Tree.tree elt) (l'1 : List elt), (Inorder.inorder t1 ++ l'1 = l ∧ Size.size t1 = n11 ∧ ((0 : ℤ) < n11 → (let h : ℤ := Height.height t1; HPow.hPow (2 : ℤ) (Int.toNat (h - (1 : ℤ))) ≤ n11 ∧ n11 < HPow.hPow (2 : ℤ) (Int.toNat h)))) ∧ (match l'1 with | ([] : List elt) => False | List.cons x l1 => (let o1 : ℤ := n1 - n11; ∃(t2 : Tree.tree elt), (Inorder.inorder t2 ++ l' = l1 ∧ Size.size t2 = o1 ∧ ((0 : ℤ) < o1 → (let h : ℤ := Height.height t2; HPow.hPow (2 : ℤ) (Int.toNat (h - (1 : ℤ))) ≤ o1 ∧ o1 < HPow.hPow (2 : ℤ) (Int.toNat h)))) ∧ t = Tree.tree.Node t1 x t2))) → Inorder.inorder t ++ l' = l ∧ Size.size t = n ∧ ((0 : ℤ) < n → (let h : ℤ := Height.height t; HPow.hPow (2 : ℤ) (Int.toNat (h - (1 : ℤ))) ≤ n ∧ n < HPow.hPow (2 : ℤ) (Int.toNat h))))
  := sorry
end tree_of_list_TreeOfList_tree_of_list_auxqtvc

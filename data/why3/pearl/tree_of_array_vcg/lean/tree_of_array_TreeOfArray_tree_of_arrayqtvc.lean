import Why3.Base
import Why3.bintree.Tree
import Why3.bintree.Size
import Why3.bintree.Height
import Why3.bintree.Inorder
open Classical
open Lean4Why3
namespace tree_of_array_TreeOfArray_tree_of_arrayqtvc
theorem tree_of_array'vc {α : Type} [Inhabited α] (a : List α) : let o1 : ℤ := Int.ofNat (List.length a); ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ o1 ∧ o1 ≤ Int.ofNat (List.length a)) ∧ (∀(result : Tree.tree α), (let n : ℤ := o1 - (0 : ℤ); Size.size result = n ∧ Inorder.inorder result = List.drop (0 : ℕ) (List.take (Int.toNat o1 - (0 : ℕ)) a) ∧ ((0 : ℤ) < n → (let h : ℤ := Height.height result; HPow.hPow (2 : ℤ) (Int.toNat (h - (1 : ℤ))) ≤ n ∧ n < HPow.hPow (2 : ℤ) (Int.toNat h)))) → Inorder.inorder result = List.drop (0 : ℕ) (List.take (List.length a - (0 : ℕ)) a) ∧ ((0 : ℤ) < Size.size result → (let h : ℤ := Height.height result; HPow.hPow (2 : ℤ) (Int.toNat (h - (1 : ℤ))) ≤ Size.size result ∧ Size.size result < HPow.hPow (2 : ℤ) (Int.toNat h))))
  := sorry
end tree_of_array_TreeOfArray_tree_of_arrayqtvc

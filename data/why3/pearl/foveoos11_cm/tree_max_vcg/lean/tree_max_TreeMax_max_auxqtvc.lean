import Why3.Base
import pearl.foveoos11_cm.lib.lean.tree_max.BinTree
open Classical
open Lean4Why3
namespace tree_max_TreeMax_max_auxqtvc
theorem max_aux'vc (t : BinTree.tree) (acc : ℤ) : (match t with | BinTree.tree.Null => True | BinTree.tree.Tree v l r => (let o1 : ℤ := max v acc; (match t with | BinTree.tree.Null => False | BinTree.tree.Tree _ f f1 => f = r ∨ f1 = r) ∧ (∀(o2 : ℤ), BinTree.ge_tree o2 r ∧ o1 ≤ o2 ∧ (o2 = o1 ∨ BinTree.mem o2 r) → (match t with | BinTree.tree.Null => False | BinTree.tree.Tree _ f f1 => f = l ∨ f1 = l)))) ∧ (∀(result : ℤ), (match t with | BinTree.tree.Null => result = acc | BinTree.tree.Tree v l r => (let o1 : ℤ := max v acc; ∃(o2 : ℤ), (BinTree.ge_tree o2 r ∧ o1 ≤ o2 ∧ (o2 = o1 ∨ BinTree.mem o2 r)) ∧ BinTree.ge_tree result l ∧ o2 ≤ result ∧ (result = o2 ∨ BinTree.mem result l))) → BinTree.ge_tree result t ∧ acc ≤ result ∧ (result = acc ∨ BinTree.mem result t))
  := sorry
end tree_max_TreeMax_max_auxqtvc

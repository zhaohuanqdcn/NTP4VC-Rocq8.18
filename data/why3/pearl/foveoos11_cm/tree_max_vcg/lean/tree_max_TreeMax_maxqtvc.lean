import Why3.Base
import pearl.foveoos11_cm.lib.lean.tree_max.BinTree
open Classical
open Lean4Why3
namespace tree_max_TreeMax_maxqtvc
theorem max'vc (t : BinTree.tree) (fact0 : ¬t = BinTree.tree.Null) : (match t with | BinTree.tree.Null => False | BinTree.tree.Tree v l r => True) ∧ (∀(result : ℤ), (match t with | BinTree.tree.Null => False | BinTree.tree.Tree v l r => (∃(o1 : ℤ), (BinTree.ge_tree o1 r ∧ v ≤ o1 ∧ (o1 = v ∨ BinTree.mem o1 r)) ∧ BinTree.ge_tree result l ∧ o1 ≤ result ∧ (result = o1 ∨ BinTree.mem result l))) → BinTree.ge_tree result t ∧ BinTree.mem result t)
  := sorry
end tree_max_TreeMax_maxqtvc

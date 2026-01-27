import Why3.Base
import Why3.bintree.Tree
import Why3.bintree.Height
open Classical
open Lean4Why3
namespace tree_height_HeightCPS_height_cpsqtvc
axiom o1 :  {β : Type} -> [Inhabited β] -> (ℤ -> β) -> ℤ -> ℤ -> β
axiom result :  {β : Type} -> [Inhabited β] -> (ℤ -> β) -> ℤ -> ℤ -> β
axiom o2 :  {β : Type} -> [Inhabited β] ->  {α : Type} -> [Inhabited α] -> (ℤ -> β) -> Tree.tree α -> ℤ -> β
axiom result1 :  {β : Type} -> [Inhabited β] -> (ℤ -> β) -> ℤ -> ℤ -> β
axiom o3 :  {β : Type} -> [Inhabited β] ->  {α : Type} -> [Inhabited α] -> (ℤ -> β) -> Tree.tree α -> ℤ -> β
axiom result2 :  {β : Type} -> [Inhabited β] -> (ℤ -> β) -> ℤ -> ℤ -> β
axiom o4 :  {β : Type} -> [Inhabited β] ->  {α : Type} -> [Inhabited α] -> (ℤ -> β) -> Tree.tree α -> ℤ -> β
axiom o'def {β : Type} [Inhabited β] (k : ℤ -> β) (hl : ℤ) (hr : ℤ) : o1 k hl hr = k ((1 : ℤ) + max hl hr)
axiom result'def {β : Type} [Inhabited β] (k : ℤ -> β) (hl : ℤ) (hr : ℤ) : result k hl hr = k ((1 : ℤ) + max hl hr)
axiom o'def1 {β : Type} {α : Type} [Inhabited β] [Inhabited α] (k : ℤ -> β) (r : Tree.tree α) (hl : ℤ) : o2 k r hl = result k hl (Height.height r)
axiom result'def1 {β : Type} [Inhabited β] (k : ℤ -> β) (hl : ℤ) (hr : ℤ) : result1 k hl hr = k ((1 : ℤ) + max hl hr)
axiom o'def2 {β : Type} {α : Type} [Inhabited β] [Inhabited α] (k : ℤ -> β) (r : Tree.tree α) (hl : ℤ) : o3 k r hl = result1 k hl (Height.height r)
axiom result'def2 {β : Type} [Inhabited β] (k : ℤ -> β) (hl : ℤ) (hr : ℤ) : result2 k hl hr = k ((1 : ℤ) + max hl hr)
axiom o'def3 {β : Type} {α : Type} [Inhabited β] [Inhabited α] (k : ℤ -> β) (r : Tree.tree α) (hl : ℤ) : o4 k r hl = result2 k hl (Height.height r)
theorem height_cps'vc {β : Type} {α : Type} [Inhabited β] [Inhabited α] (t : Tree.tree α) (k : ℤ -> β) : (match t with | (Tree.tree.Empty : Tree.tree α) => True | Tree.tree.Node l _ r => (match t with | (Tree.tree.Empty : Tree.tree α) => False | Tree.tree.Node f _ f1 => f = r ∨ f1 = r) ∧ (match t with | (Tree.tree.Empty : Tree.tree α) => False | Tree.tree.Node f _ f1 => f = l ∨ f1 = l)) ∧ (∀(result3 : β), (match t with | (Tree.tree.Empty : Tree.tree α) => result3 = k (0 : ℤ) | Tree.tree.Node l _ r => result3 = o4 k r (Height.height l)) → result3 = k (Height.height t))
  := sorry
end tree_height_HeightCPS_height_cpsqtvc

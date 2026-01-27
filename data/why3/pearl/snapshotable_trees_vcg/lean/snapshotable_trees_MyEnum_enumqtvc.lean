import Why3.Base
import pearl.snapshotable_trees_vcg.lean.snapshotable_trees.Tree
open Classical
open Lean4Why3
namespace snapshotable_trees_MyEnum_enumqtvc
inductive enum where
  | Done : enum
  | Next : ℤ -> Tree.tree -> enum -> enum
axiom inhabited_axiom_enum : Inhabited enum
attribute [instance] inhabited_axiom_enum
noncomputable def enum_elements : enum -> List ℤ
  | enum.Done => ([] : List ℤ)
  | (enum.Next x r e1) => List.cons x (Tree.tree_elements r ++ enum_elements e1)
theorem enum'vc (t : Tree.tree) (e : enum) : (match t with | (Tree.tree.Empty : Tree.tree) => True | Tree.tree.Node l x r => (match t with | (Tree.tree.Empty : Tree.tree) => False | Tree.tree.Node f _ f1 => f = l ∨ f1 = l)) ∧ (∀(result : enum), (match t with | (Tree.tree.Empty : Tree.tree) => result = e | Tree.tree.Node l x r => enum_elements result = Tree.tree_elements l ++ enum_elements (enum.Next x r e)) → enum_elements result = Tree.tree_elements t ++ enum_elements e)
  := sorry
end snapshotable_trees_MyEnum_enumqtvc

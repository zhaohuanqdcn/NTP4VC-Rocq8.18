import Why3.Base
import pearl.snapshotable_trees_vcg.lean.snapshotable_trees.Tree
import pearl.snapshotable_trees_vcg.lean.snapshotable_trees.MyEnum
open Classical
open Lean4Why3
namespace snapshotable_trees_Iterator_create_iteratorqtvc
structure iterator where
  it : MyEnum.enum
axiom inhabited_axiom_iterator : Inhabited iterator
attribute [instance] inhabited_axiom_iterator
noncomputable def elements (i : iterator) := MyEnum.enum_elements (iterator.it i)
theorem create_iterator'vc (o1 : MyEnum.enum) (t : Tree.tree) (fact0 : MyEnum.enum_elements o1 = Tree.tree_elements t ++ MyEnum.enum_elements MyEnum.enum.Done) : elements (iterator.mk o1) = Tree.tree_elements t
  := sorry
end snapshotable_trees_Iterator_create_iteratorqtvc

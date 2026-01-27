import Why3.Base
import pearl.snapshotable_trees_vcg.lean.snapshotable_trees.Tree
import pearl.snapshotable_trees_vcg.lean.snapshotable_trees.MyEnum
open Classical
open Lean4Why3
namespace snapshotable_trees_Iterator_nextqtvc
structure iterator where
  it : MyEnum.enum
axiom inhabited_axiom_iterator : Inhabited iterator
attribute [instance] inhabited_axiom_iterator
noncomputable def elements (i : iterator) := MyEnum.enum_elements (iterator.it i)
noncomputable def hasNext (i : iterator) := ¬iterator.it i = MyEnum.enum.Done
theorem next'vc (i : MyEnum.enum) : let i1 : iterator := iterator.mk i; hasNext i1 → (match i with | MyEnum.enum.Done => False | MyEnum.enum.Next x r e => (∀(o1 : MyEnum.enum), MyEnum.enum_elements o1 = Tree.tree_elements r ++ MyEnum.enum_elements e → elements i1 = List.cons x (elements (iterator.mk o1))))
  := sorry
end snapshotable_trees_Iterator_nextqtvc

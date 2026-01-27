import Why3.Base
import pearl.snapshotable_trees_vcg.lean.snapshotable_trees.Tree
import pearl.snapshotable_trees_vcg.lean.snapshotable_trees.MyEnum
open Classical
open Lean4Why3
namespace Iterator
structure iterator where
  it : MyEnum.enum
axiom inhabited_axiom_iterator : Inhabited iterator
attribute [instance] inhabited_axiom_iterator
noncomputable def elements (i : iterator) := MyEnum.enum_elements (iterator.it i)
noncomputable def hasNext (i : iterator) := ¬iterator.it i = MyEnum.enum.Done
end Iterator

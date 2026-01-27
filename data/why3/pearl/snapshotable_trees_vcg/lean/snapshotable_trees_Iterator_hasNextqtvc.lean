import Why3.Base
import pearl.snapshotable_trees_vcg.lean.snapshotable_trees.Tree
import pearl.snapshotable_trees_vcg.lean.snapshotable_trees.MyEnum
open Classical
open Lean4Why3
namespace snapshotable_trees_Iterator_hasNextqtvc
structure iterator where
  it : MyEnum.enum
axiom inhabited_axiom_iterator : Inhabited iterator
attribute [instance] inhabited_axiom_iterator
noncomputable def elements (i : iterator) := MyEnum.enum_elements (iterator.it i)
noncomputable def hasNext (i : iterator) := ¬iterator.it i = MyEnum.enum.Done
theorem hasNext'vc (i : MyEnum.enum) (result : Bool) (fact0 : match i with | MyEnum.enum.Done => result = false | _ => result = true) : (result = true) = hasNext (iterator.mk i)
  := sorry
end snapshotable_trees_Iterator_hasNextqtvc

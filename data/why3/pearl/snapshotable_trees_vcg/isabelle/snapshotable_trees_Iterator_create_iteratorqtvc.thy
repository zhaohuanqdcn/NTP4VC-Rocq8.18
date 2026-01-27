theory snapshotable_trees_Iterator_create_iteratorqtvc
  imports "NTP4Verif.NTP4Verif" "./snapshotable_trees_Tree" "./snapshotable_trees_MyEnum"
begin
datatype  iterator = iterator'mk (it: "enum")
definition elements :: "iterator \<Rightarrow> int list"
  where "elements i = enum_elements (it i)" for i
theorem create_iterator'vc:
  fixes o1 :: "enum"
  fixes t :: "tree"
  assumes fact0: "enum_elements o1 = tree_elements t @ enum_elements Done"
  shows "elements (iterator'mk o1) = tree_elements t"
  sorry
end

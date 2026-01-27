theory snapshotable_trees_Iterator_nextqtvc
  imports "NTP4Verif.NTP4Verif" "./snapshotable_trees_Tree" "./snapshotable_trees_MyEnum"
begin
datatype  iterator = iterator'mk (it: "enum")
definition elements :: "iterator \<Rightarrow> int list"
  where "elements i = enum_elements (it i)" for i
definition hasNext :: "iterator \<Rightarrow> _"
  where "hasNext i \<longleftrightarrow> \<not>it i = Done" for i
theorem next'vc:
  fixes i :: "enum"
  shows "let i1 :: iterator = iterator'mk i in hasNext i1 \<longrightarrow> (case i of Done \<Rightarrow> False | Next x r e \<Rightarrow> (\<forall>(o1 :: enum). enum_elements o1 = tree_elements r @ enum_elements e \<longrightarrow> elements i1 = Cons x (elements (iterator'mk o1))))"
  sorry
end

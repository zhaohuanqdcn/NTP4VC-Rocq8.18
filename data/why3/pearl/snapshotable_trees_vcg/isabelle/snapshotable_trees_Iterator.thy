theory snapshotable_trees_Iterator
  imports "NTP4Verif.NTP4Verif" "./snapshotable_trees_Tree" "./snapshotable_trees_MyEnum"
begin
datatype  iterator = iterator'mk (it: "enum")
definition elements :: "iterator \<Rightarrow> int list"
  where "elements i = enum_elements (it i)" for i
definition hasNext :: "iterator \<Rightarrow> _"
  where "hasNext i \<longleftrightarrow> \<not>it i = Done" for i
end

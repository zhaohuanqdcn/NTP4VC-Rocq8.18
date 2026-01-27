theory snapshotable_trees_Iterator_hasNextqtvc
  imports "NTP4Verif.NTP4Verif" "./snapshotable_trees_Tree" "./snapshotable_trees_MyEnum"
begin
datatype  iterator = iterator'mk (it: "enum")
definition elements :: "iterator \<Rightarrow> int list"
  where "elements i = enum_elements (it i)" for i
definition hasNext :: "iterator \<Rightarrow> _"
  where "hasNext i \<longleftrightarrow> \<not>it i = Done" for i
theorem hasNext'vc:
  fixes i :: "enum"
  fixes result :: "bool"
  assumes fact0: "case i of Done \<Rightarrow> result = False | _ \<Rightarrow> result = True"
  shows "result = True \<longleftrightarrow> hasNext (iterator'mk i)"
  sorry
end

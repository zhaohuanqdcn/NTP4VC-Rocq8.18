theory snapshotable_trees_MyEnum
  imports "NTP4Verif.NTP4Verif" "./snapshotable_trees_Tree"
begin
datatype  enum = Done | Next "int" "tree" "enum"
fun enum_elements :: "enum \<Rightarrow> int list"
  where "enum_elements Done = (Nil :: int list)"
      | "enum_elements (Next x r e1) = Cons x (tree_elements r @ enum_elements e1)" for x r e1
end

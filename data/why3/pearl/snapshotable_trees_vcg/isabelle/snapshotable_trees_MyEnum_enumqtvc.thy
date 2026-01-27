theory snapshotable_trees_MyEnum_enumqtvc
  imports "NTP4Verif.NTP4Verif" "./snapshotable_trees_Tree"
begin
datatype  enum = Done | Next "int" "tree" "enum"
fun enum_elements :: "enum \<Rightarrow> int list"
  where "enum_elements Done = (Nil :: int list)"
      | "enum_elements (Next x r e1) = Cons x (tree_elements r @ enum_elements e1)" for x r e1
theorem enum'vc:
  fixes t :: "tree"
  fixes e :: "enum"
  shows "case t of (Empty :: tree) \<Rightarrow> True | Node l x r \<Rightarrow> (case t of (Empty :: tree) \<Rightarrow> False | Node f _ f1 \<Rightarrow> f = l \<or> f1 = l)"
  and "\<forall>(result :: enum). (case t of (Empty :: tree) \<Rightarrow> result = e | Node l x r \<Rightarrow> enum_elements result = tree_elements l @ enum_elements (Next x r e)) \<longrightarrow> enum_elements result = tree_elements t @ enum_elements e"
  sorry
end

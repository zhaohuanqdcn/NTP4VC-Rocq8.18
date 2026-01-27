theory same_fringe_SameFringe_enumqtvc
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  elt
datatype  tree = Empty | Node "tree" "elt" "tree"
fun elements :: "tree \<Rightarrow> elt list"
  where "elements (Empty :: tree) = (Nil :: elt list)"
      | "elements (Node l x r) = elements l @ Cons x (elements r)" for l x r
datatype  enum = Done | Next "elt" "tree" "enum"
fun enum_elements :: "enum \<Rightarrow> elt list"
  where "enum_elements Done = (Nil :: elt list)"
      | "enum_elements (Next x r e1) = Cons x (elements r @ enum_elements e1)" for x r e1
theorem enum'vc:
  fixes t :: "tree"
  fixes e :: "enum"
  shows "case t of (Empty :: tree) \<Rightarrow> True | Node l x r \<Rightarrow> (case t of (Empty :: tree) \<Rightarrow> False | Node f _ f1 \<Rightarrow> f = l \<or> f1 = l)"
  and "\<forall>(result :: enum). (case t of (Empty :: tree) \<Rightarrow> result = e | Node l x r \<Rightarrow> enum_elements result = elements l @ enum_elements (Next x r e)) \<longrightarrow> enum_elements result = elements t @ enum_elements e"
  sorry
end

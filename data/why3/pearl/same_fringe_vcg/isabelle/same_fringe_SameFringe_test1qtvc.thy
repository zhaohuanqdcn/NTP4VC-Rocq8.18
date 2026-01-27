theory same_fringe_SameFringe_test1qtvc
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
theorem test1'vc:
  shows "True"
  sorry
end

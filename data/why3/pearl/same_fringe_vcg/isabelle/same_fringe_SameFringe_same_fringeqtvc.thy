theory same_fringe_SameFringe_same_fringeqtvc
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
theorem same_fringe'vc:
  fixes o1 :: "enum"
  fixes t2 :: "tree"
  fixes o2 :: "enum"
  fixes t1 :: "tree"
  assumes fact0: "enum_elements o1 = elements t2 @ enum_elements Done"
  assumes fact1: "enum_elements o2 = elements t1 @ enum_elements Done"
  shows "enum_elements o2 = enum_elements o1 \<longleftrightarrow> elements t1 = elements t2"
  sorry
end

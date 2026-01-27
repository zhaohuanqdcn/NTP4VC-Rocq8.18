theory same_fringe_Test_test1qtvc
  imports "NTP4Verif.NTP4Verif"
begin
datatype  tree = Empty | Node "tree" "int" "tree"
fun elements :: "tree \<Rightarrow> int list"
  where "elements (Empty :: tree) = (Nil :: int list)"
      | "elements (Node l x r) = elements l @ Cons x (elements r)" for l x r
datatype  enum = Done | Next "int" "tree" "enum"
fun enum_elements :: "enum \<Rightarrow> int list"
  where "enum_elements Done = (Nil :: int list)"
      | "enum_elements (Next x r e1) = Cons x (elements r @ enum_elements e1)" for x r e1
consts a :: "int"
consts b :: "int"
theorem test1'vc:
  shows "True"
  sorry
end

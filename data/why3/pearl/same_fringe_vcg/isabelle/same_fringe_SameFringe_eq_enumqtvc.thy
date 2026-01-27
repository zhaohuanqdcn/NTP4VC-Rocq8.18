theory same_fringe_SameFringe_eq_enumqtvc
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
theorem eq_enum'vc:
  fixes e2 :: "enum"
  fixes e1 :: "enum"
  shows "case e2 of Done \<Rightarrow> (case e1 of Done \<Rightarrow> True | _ \<Rightarrow> True) | Next x x1 x2 \<Rightarrow> (case e1 of Next x3 x4 x5 \<Rightarrow> x3 = x \<longrightarrow> (\<forall>(o1 :: enum). enum_elements o1 = elements x1 @ enum_elements x2 \<longrightarrow> (\<forall>(o2 :: enum). enum_elements o2 = elements x4 @ enum_elements x5 \<longrightarrow> (0 :: int) \<le> int (length (enum_elements e1)) \<and> length (enum_elements o2) < length (enum_elements e1))) | _ \<Rightarrow> True)"
  and "\<forall>(result :: bool). (case e2 of Done \<Rightarrow> (case e1 of Done \<Rightarrow> result = True | _ \<Rightarrow> result = False) | Next x x1 x2 \<Rightarrow> (case e1 of Next x3 x4 x5 \<Rightarrow> (if x3 = x then \<exists>(o1 :: enum). enum_elements o1 = elements x1 @ enum_elements x2 \<and> (\<exists>(o2 :: enum). enum_elements o2 = elements x4 @ enum_elements x5 \<and> result = (if enum_elements o2 = enum_elements o1 then True else False)) else result = False) | _ \<Rightarrow> result = False)) \<longrightarrow> result = True \<longleftrightarrow> enum_elements e1 = enum_elements e2"
  sorry
end

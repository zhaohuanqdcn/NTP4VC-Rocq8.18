theory pqueue_PqueueNoDup
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  elt
consts le :: "elt \<Rightarrow> elt \<Rightarrow> bool"
axiomatization where Refl:   "le x x"
  for x :: "elt"
axiomatization where Trans:   "le x z"
 if "le x y"
 and "le y z"
  for x :: "elt"
  and y :: "elt"
  and z :: "elt"
axiomatization where Total:   "le x y \<or> le y x"
  for x :: "elt"
  and y :: "elt"
typedecl  t
consts elts :: "t \<Rightarrow> elt fset"
definition minimal_elt :: "elt \<Rightarrow> elt fset \<Rightarrow> _"
  where "minimal_elt x s \<longleftrightarrow> x |\<in>| s \<and> (\<forall>(e :: elt). e |\<in>| s \<longrightarrow> le x e)" for x s
end

theory verifythis_2016_tree_traversal_Memory
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  loc
consts eq :: "loc \<Rightarrow> loc \<Rightarrow> bool"
axiomatization where eq'spec:   "eq x y \<longleftrightarrow> x = y"
  for x :: "loc"
  and y :: "loc"
datatype  kind = Parent | Left | Right
typedecl  pmem
typedecl  memory
consts accessor :: "memory \<Rightarrow> kind \<Rightarrow> loc \<Rightarrow> loc"
consts mark :: "memory \<Rightarrow> loc \<Rightarrow> bool"
consts null :: "loc"
typedecl  non_det_magic
typedecl  non_det
consts non_det_field :: "non_det \<Rightarrow> non_det_magic"
end

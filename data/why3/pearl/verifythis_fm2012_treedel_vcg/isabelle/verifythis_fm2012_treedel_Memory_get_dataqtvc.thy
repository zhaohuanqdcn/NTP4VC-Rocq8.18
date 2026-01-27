theory verifythis_fm2012_treedel_Memory_get_dataqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
typedecl  loc
consts null :: "loc"
consts eq_loc :: "loc \<Rightarrow> loc \<Rightarrow> bool"
axiomatization where eq_loc'spec:   "eq_loc x y \<longleftrightarrow> x = y"
  for x :: "loc"
  and y :: "loc"
datatype  node = node'mk (left1: "loc") (right1: "loc") (data: "int")
typedecl  memory
theorem get_data'vc:
  shows "True"
  sorry
end

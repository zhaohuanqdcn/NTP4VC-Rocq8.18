theory coincidence_count_list_CoincidenceCountAnyType_eqqtrefnqtvc
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  t
consts eq :: "t \<Rightarrow> t \<Rightarrow> bool"
axiomatization where eq'spec:   "eq x y \<longleftrightarrow> x = y"
  for x :: "t"
  and y :: "t"
theorem eq'refn'vc:
  shows "True"
  sorry
end

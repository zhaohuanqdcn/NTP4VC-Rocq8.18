theory imp_Svar_eqqtrefnqtvc
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  svar
consts eq :: "svar \<Rightarrow> svar \<Rightarrow> bool"
axiomatization where eq'spec:   "eq v1 v2 \<longleftrightarrow> v1 = v2"
  for v1 :: "svar"
  and v2 :: "svar"
theorem eq'refn'vc:
  shows "True"
  sorry
end

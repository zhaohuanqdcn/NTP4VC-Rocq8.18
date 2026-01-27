theory koda_ruskey_KodaRuskey_Spec_eq_colorqtvc
  imports "NTP4Verif.NTP4Verif"
begin
datatype  color = White | Black
theorem eq_color'vc:
  fixes c2 :: "color"
  fixes c1 :: "color"
  fixes result :: "bool"
  assumes fact0: "case c2 of White \<Rightarrow> (case c1 of White \<Rightarrow> result = True | _ \<Rightarrow> result = False) | Black \<Rightarrow> (case c1 of Black \<Rightarrow> result = True | _ \<Rightarrow> result = False)"
  shows "result = True \<longleftrightarrow> c1 = c2"
  sorry
end

theory flag2_Flag_eq_colorqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
datatype  color = Blue | White | Red
theorem eq_color'vc:
  fixes c2 :: "color"
  fixes c1 :: "color"
  fixes result :: "bool"
  assumes fact0: "case c2 of Blue \<Rightarrow> (case c1 of Blue \<Rightarrow> result = True | _ \<Rightarrow> result = False) | Red \<Rightarrow> (case c1 of Red \<Rightarrow> result = True | _ \<Rightarrow> result = False) | White \<Rightarrow> (case c1 of White \<Rightarrow> result = True | _ \<Rightarrow> result = False)"
  shows "result = True \<longleftrightarrow> c1 = c2"
  sorry
end

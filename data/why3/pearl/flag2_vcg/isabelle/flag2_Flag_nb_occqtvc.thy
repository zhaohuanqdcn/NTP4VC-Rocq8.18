theory flag2_Flag_nb_occqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
datatype  color = Blue | White | Red
definition monochrome :: "(int \<Rightarrow> color) \<Rightarrow> int \<Rightarrow> int \<Rightarrow> color \<Rightarrow> _"
  where "monochrome a i j c \<longleftrightarrow> (\<forall>(k :: int). i \<le> k \<and> k < j \<longrightarrow> a k = c)" for a i j c
theorem nb_occ'vc:
  fixes j :: "int"
  fixes i :: "int"
  assumes fact0: "\<not>j \<le> i"
  shows "(0 :: int) \<le> j - i"
  and "j - (1 :: int) - i < j - i"
  sorry
end

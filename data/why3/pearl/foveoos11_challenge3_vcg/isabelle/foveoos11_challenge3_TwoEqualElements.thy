theory foveoos11_challenge3_TwoEqualElements
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
definition appear_twice :: "int list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "appear_twice a v u \<longleftrightarrow> (\<exists>(i :: int). ((0 :: int) \<le> i \<and> i < u) \<and> a ! nat i = v \<and> (\<exists>(j :: int). ((0 :: int) \<le> j \<and> j < u) \<and> \<not>j = i \<and> a ! nat j = v))" for a v u
end

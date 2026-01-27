theory verifythis_2015_dancing_links_DancingLinks_dllqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
theorem dll'vc:
  shows "(0 :: int) \<le> (0 :: int)"
  and "\<forall>(o1 :: int list). (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < (0 :: int) \<longrightarrow> o1 ! nat i = (0 :: int)) \<and> int (length o1) = (0 :: int) \<longrightarrow> (0 :: int) \<le> (0 :: int) \<and> (\<forall>(o2 :: int list). (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < (0 :: int) \<longrightarrow> o2 ! nat i = (0 :: int)) \<and> int (length o2) = (0 :: int) \<longrightarrow> length o2 = length o1 \<and> int (length o1) = (0 :: int))"
  sorry
end

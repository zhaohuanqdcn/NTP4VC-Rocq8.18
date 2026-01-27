theory rac_ArrayList_mainqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem main'vc:
  shows "(0 :: int) \<le> (4 :: int)"
  and "\<forall>(f :: int list). (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < (4 :: int) \<longrightarrow> f ! nat i = (0 :: int)) \<and> int (length f) = (4 :: int) \<longrightarrow> (0 :: int) \<le> (0 :: int) \<and> (4 :: int) \<le> int (length f)"
  sorry
end

theory rac_Arrays_test1qtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem test1'vc:
  shows "(0 :: int) \<le> (10 :: int)"
  and "\<forall>(a :: int list). (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < (10 :: int) \<longrightarrow> a ! nat i = (0 :: int)) \<and> int (length a) = (10 :: int) \<longrightarrow> (0 :: int) \<le> (1 :: int) \<and> (1 :: int) < int (length a)"
  sorry
end

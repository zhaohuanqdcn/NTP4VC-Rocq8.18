theory mccarthy_vc_sp_McCarthy91Mach_f91qtvc
  imports "NTP4Verif.NTP4Verif"
begin
definition spec :: "int \<Rightarrow> int"
  where "spec x = (if x \<le> (100 :: int) then 91 :: int else x - (10 :: int))" for x
theorem f91'vc:
  fixes n :: "63 word"
  shows "if sint n \<le> (100 :: int) then int'63_in_bounds (sint n + (11 :: int)) \<and> (\<forall>(o1 :: 63 word). sint o1 = sint n + (11 :: int) \<longrightarrow> ((0 :: int) \<le> (101 :: int) - sint n \<and> (101 :: int) - sint o1 < (101 :: int) - sint n) \<and> (\<forall>(o2 :: 63 word). sint o2 = spec (sint o1) \<longrightarrow> (0 :: int) \<le> (101 :: int) - sint n \<and> (101 :: int) - sint o2 < (101 :: int) - sint n)) else int'63_in_bounds (sint n - (10 :: int))"
  and "\<forall>(result :: 63 word). (if sint n \<le> (100 :: int) then \<exists>(o1 :: 63 word). sint o1 = sint n + (11 :: int) \<and> (\<exists>(o2 :: 63 word). sint o2 = spec (sint o1) \<and> sint result = spec (sint o2)) else sint result = sint n - (10 :: int)) \<longrightarrow> sint result = spec (sint n)"
  sorry
end

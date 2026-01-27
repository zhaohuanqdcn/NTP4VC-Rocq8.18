theory mutual_recursion_Top_mqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem m'vc:
  fixes n :: "int"
  assumes fact0: "(0 :: int) \<le> n"
  shows "\<not>n = (0 :: int) \<longrightarrow> (let o1 :: int = n - (1 :: int) in (((0 :: int) \<le> n \<and> o1 < n) \<and> (0 :: int) \<le> o1) \<and> (\<forall>(o2 :: int). (if o1 = (0 :: int) then o2 = (0 :: int) else (0 :: int) \<le> o2 \<and> o2 < o1) \<longrightarrow> ((0 :: int) \<le> n \<and> o2 < n \<or> n = o2 \<and> (0 :: int) \<le> (0 :: int) \<and> (1 :: int) < (0 :: int)) \<and> (0 :: int) \<le> o2))"
  and "\<forall>(result :: int). (if n = (0 :: int) then result = (0 :: int) else let o1 :: int = n - (1 :: int) in \<exists>(o2 :: int). (if o1 = (0 :: int) then o2 = (0 :: int) else (0 :: int) \<le> o2 \<and> o2 < o1) \<and> (\<exists>(o3 :: int). (if o2 = (0 :: int) then o3 = (1 :: int) else (1 :: int) \<le> o3 \<and> o3 \<le> o2) \<and> result = n - o3)) \<longrightarrow> (if n = (0 :: int) then result = (0 :: int) else (0 :: int) \<le> result \<and> result < n)"
  sorry
end

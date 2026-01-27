theory search_Dfs_dfs_maxqtvc
  imports "NTP4Verif.NTP4Verif" "./search_Path"
begin
theorem dfs_max'vc:
  fixes m :: "int"
  assumes fact0: "(0 :: int) \<le> m"
  shows "let o1 :: state = start in ((0 :: int) \<le> (0 :: int) \<and> (0 :: int) \<le> m + (1 :: int)) \<and> (\<forall>(o2 :: outcome). (case o2 of NoSolution \<Rightarrow> (\<forall>(t :: state) (n :: int). (0 :: int) \<le> n \<and> n \<le> m - (0 :: int) \<longrightarrow> success t \<longrightarrow> \<not>path o1 t n) | Solution t n \<Rightarrow> path o1 t n \<and> success t \<and> (0 :: int) \<le> n \<and> n \<le> m - (0 :: int)) \<longrightarrow> (case o2 of NoSolution \<Rightarrow> (\<forall>(t :: state) (n :: int). (0 :: int) \<le> n \<and> n \<le> m \<longrightarrow> success t \<longrightarrow> \<not>path start t n) | Solution t n \<Rightarrow> path start t n \<and> n \<le> m))"
  sorry
end

theory mccarthy_McCarthyWithGhostMonitor_mccarthy2qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
definition spec :: "int \<Rightarrow> int"
  where "spec x = (if x \<le> (100 :: int) then 91 :: int else x - (10 :: int))" for x
theorem mccarthy2'vc:
  fixes n :: "int"
  fixes r :: "int"
  fixes e :: "int"
  assumes fact0: "(0 :: int) \<le> n"
  shows "(0 :: int) \<le> (0 :: int)"
  and "(0 :: int) < (3 :: int)"
  and "((0 :: int) = (1 :: int) \<and> (100 :: int) < r \<longrightarrow> (1 :: int) = (2 :: int) \<and> n = r - (10 :: int) \<and> (1 :: int) = e - (1 :: int)) \<and> ((0 :: int) = (1 :: int) \<and> r \<le> (100 :: int) \<longrightarrow> n = r + (11 :: int) \<and> (1 :: int) = e + (1 :: int)) \<and> ((0 :: int) = (2 :: int) \<and> e = (0 :: int) \<longrightarrow> (1 :: int) = (3 :: int) \<and> n = r \<and> (1 :: int) = e) \<and> ((0 :: int) = (2 :: int) \<and> \<not>e = (0 :: int) \<longrightarrow> n = r \<and> (1 :: int) = e) \<longrightarrow> (0 :: int) < (1 :: int) \<and> ((0 :: int) \<le> (2 :: int) \<and> (2 :: int) < (3 :: int)) \<and> (\<forall>(r1 :: int) (e1 :: int) (pc :: int). ((2 :: int) = (0 :: int) \<longrightarrow> pc = (1 :: int) \<and> e1 = (1 :: int) \<and> r1 = n) \<and> ((2 :: int) = (1 :: int) \<and> (100 :: int) < spec n \<longrightarrow> pc = (2 :: int) \<and> r1 = spec n - (10 :: int) \<and> e1 = (1 :: int) - (1 :: int) - (1 :: int)) \<and> ((2 :: int) = (1 :: int) \<and> spec n \<le> (100 :: int) \<longrightarrow> pc = (1 :: int) \<and> r1 = spec n + (11 :: int) \<and> e1 = (1 :: int) - (1 :: int) + (1 :: int)) \<and> ((1 :: int) - (1 :: int) = (0 :: int) \<longrightarrow> pc = (3 :: int) \<and> r1 = spec n \<and> e1 = (1 :: int) - (1 :: int)) \<and> (\<not>(1 :: int) - (1 :: int) = (0 :: int) \<longrightarrow> pc = (1 :: int) \<and> r1 = spec n \<and> e1 = (1 :: int) - (1 :: int)) \<longrightarrow> pc = (3 :: int) \<and> r1 = spec n)"
  sorry
end

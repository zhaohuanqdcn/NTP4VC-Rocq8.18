theory mccarthy_McCarthyWithGhostMonitor_monitor2qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
definition spec :: "int \<Rightarrow> int"
  where "spec x = (if x \<le> (100 :: int) then 91 :: int else x - (10 :: int))" for x
theorem monitor2'vc:
  fixes e :: "int"
  fixes n :: "int"
  fixes r1 :: "int"
  assumes fact0: "(0 :: int) < e"
  shows "(0 :: int) \<le> (1 :: int)"
  and "(1 :: int) < (3 :: int)"
  and "\<forall>(r :: int) (e1 :: int) (pc :: int). ((1 :: int) = (0 :: int) \<longrightarrow> pc = (1 :: int) \<and> e1 = (1 :: int) \<and> r = n) \<and> ((100 :: int) < r1 \<longrightarrow> pc = (2 :: int) \<and> r = r1 - (10 :: int) \<and> e1 = e - (1 :: int)) \<and> (r1 \<le> (100 :: int) \<longrightarrow> pc = (1 :: int) \<and> r = r1 + (11 :: int) \<and> e1 = e + (1 :: int)) \<and> ((1 :: int) = (2 :: int) \<and> e = (0 :: int) \<longrightarrow> pc = (3 :: int) \<and> r = r1 \<and> e1 = e) \<and> ((1 :: int) = (2 :: int) \<and> \<not>e = (0 :: int) \<longrightarrow> pc = (1 :: int) \<and> r = r1 \<and> e1 = e) \<longrightarrow> (if \<not>pc = (2 :: int) then (((0 :: int) \<le> (101 :: int) - r1 \<and> (101 :: int) - r < (101 :: int) - r1) \<and> pc = (1 :: int) \<and> (0 :: int) < e1) \<and> ((0 :: int) \<le> (2 :: int) \<and> (2 :: int) < (3 :: int)) \<and> (\<forall>(r2 :: int) (e2 :: int) (pc1 :: int). ((2 :: int) = (0 :: int) \<longrightarrow> pc1 = (1 :: int) \<and> e2 = (1 :: int) \<and> r2 = n) \<and> ((2 :: int) = (1 :: int) \<and> (100 :: int) < spec r \<longrightarrow> pc1 = (2 :: int) \<and> r2 = spec r - (10 :: int) \<and> e2 = e1 - (1 :: int) - (1 :: int)) \<and> ((2 :: int) = (1 :: int) \<and> spec r \<le> (100 :: int) \<longrightarrow> pc1 = (1 :: int) \<and> r2 = spec r + (11 :: int) \<and> e2 = e1 - (1 :: int) + (1 :: int)) \<and> (e1 - (1 :: int) = (0 :: int) \<longrightarrow> pc1 = (3 :: int) \<and> r2 = spec r \<and> e2 = e1 - (1 :: int)) \<and> (\<not>e1 - (1 :: int) = (0 :: int) \<longrightarrow> pc1 = (1 :: int) \<and> r2 = spec r \<and> e2 = e1 - (1 :: int)) \<longrightarrow> (((0 :: int) \<le> (101 :: int) - r1 \<and> (101 :: int) - r2 < (101 :: int) - r1) \<and> pc1 = (1 :: int) \<and> (0 :: int) < e2) \<and> spec r2 = spec r1 \<and> e2 - (1 :: int) = e - (1 :: int)) else pc = (2 :: int) \<and> r = spec r1 \<and> e1 = e - (1 :: int))"
  sorry
end

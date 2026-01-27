theory mccarthy_vc_sp_McCarthy91_f91_pseudorecqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.int_Iter"
begin
definition spec :: "int \<Rightarrow> int"
  where "spec x = (if x \<le> (100 :: int) then 91 :: int else x - (10 :: int))" for x
theorem f91_pseudorec'vc:
  fixes n0 :: "int"
  shows "\<forall>(e :: int). (0 :: int) \<le> e \<longrightarrow> \<not>(0 :: int) < e \<longrightarrow> e = (0 :: int)"
  and "\<forall>(e :: int) (n :: int). (0 :: int) < e \<longrightarrow> ((0 :: int) \<le> e \<and> (\<forall>(e1 :: int) (n1 :: int). ((0 :: int) < e \<and> (if (100 :: int) < n then n1 = n - (10 :: int) \<and> e1 = e - (1 :: int) else n1 = n + (11 :: int) \<and> e1 = e + (1 :: int)) \<longrightarrow> n \<le> (100 :: int) \<longrightarrow> (((0 :: int) \<le> (101 :: int) - n \<and> (101 :: int) - n1 < (101 :: int) - n) \<and> (0 :: int) < e1) \<and> ((0 :: int) \<le> (101 :: int) - n \<and> (101 :: int) - spec n1 < (101 :: int) - n) \<and> (0 :: int) < e1 - (1 :: int)) \<and> \<not>((e1 = e \<and> e = (0 :: int)) \<and> n1 = n))) \<and> (\<forall>(e1 :: int) (n1 :: int). (\<exists>(e2 :: int) (n2 :: int). ((0 :: int) < e \<and> (if (100 :: int) < n then n2 = n - (10 :: int) \<and> e2 = e - (1 :: int) else n2 = n + (11 :: int) \<and> e2 = e + (1 :: int))) \<and> (if n \<le> (100 :: int) then e1 = e2 - (1 :: int) - (1 :: int) \<and> n1 = spec (spec n2) else e1 = e2 \<and> n1 = n2)) \<longrightarrow> e1 = e - (1 :: int) \<and> n1 = spec n)"
  and "(0 :: int) < (1 :: int)"
  and "(0 :: int) \<le> (1 :: int) - (1 :: int)"
  and "\<forall>(e :: int) (n :: int). \<not>((0 :: int) < (1 :: int) - (1 :: int) \<and> (if (100 :: int) < spec n0 then n = spec n0 - (10 :: int) \<and> e = (1 :: int) - (1 :: int) - (1 :: int) else n = spec n0 + (11 :: int) \<and> e = (1 :: int) - (1 :: int) + (1 :: int))) \<and> ((e = (1 :: int) - (1 :: int) \<and> (1 :: int) - (1 :: int) = (0 :: int)) \<and> n = spec n0 \<longrightarrow> n = spec n0)"
  sorry
end

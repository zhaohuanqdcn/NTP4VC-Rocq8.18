theory mccarthy_vc_sp_McCarthy91_f91_nonrecqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.int_Iter"
begin
definition spec :: "int \<Rightarrow> int"
  where "spec x = (if x \<le> (100 :: int) then 91 :: int else x - (10 :: int))" for x
consts spec_closure :: "int \<Rightarrow> int"
axiomatization where spec_closure_def:   "spec_closure y = spec y"
  for y :: "int"
theorem f91_nonrec'vc:
  fixes n0 :: "int"
  shows "(0 :: int) \<le> (1 :: int)"
  and "iter spec_closure (1 :: int) n0 = spec n0"
  and "\<forall>(e :: int) (n :: int). (0 :: int) \<le> e \<and> iter spec_closure e n = spec n0 \<longrightarrow> (if (0 :: int) < e then \<forall>(e1 :: int) (n1 :: int). (if (100 :: int) < n then n1 = n - (10 :: int) \<and> e1 = e - (1 :: int) else n1 = n + (11 :: int) \<and> e1 = e + (1 :: int)) \<longrightarrow> ((0 :: int) \<le> (101 :: int) - n + (10 :: int) * e \<and> (101 :: int) - n1 + (10 :: int) * e1 < (101 :: int) - n + (10 :: int) * e \<or> (101 :: int) - n + (10 :: int) * e = (101 :: int) - n1 + (10 :: int) * e1 \<and> (0 :: int) \<le> e \<and> e1 < e) \<and> (0 :: int) \<le> e1 \<and> iter spec_closure e1 n1 = spec n0 else n = spec n0)"
  sorry
end

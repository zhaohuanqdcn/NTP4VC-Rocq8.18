theory mccarthy_McCarthy91_f91_nonrecqtvc
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
  and "\<forall>(n :: int) (e :: int). (0 :: int) \<le> e \<and> iter spec_closure e n = spec n0 \<longrightarrow> (if (0 :: int) < e then if (100 :: int) < n then ((0 :: int) \<le> (101 :: int) - n + (10 :: int) * e \<and> (101 :: int) - (n - (10 :: int)) + (10 :: int) * (e - (1 :: int)) < (101 :: int) - n + (10 :: int) * e \<or> (101 :: int) - n + (10 :: int) * e = (101 :: int) - (n - (10 :: int)) + (10 :: int) * (e - (1 :: int)) \<and> (0 :: int) \<le> e \<and> e - (1 :: int) < e) \<and> (0 :: int) \<le> e - (1 :: int) \<and> iter spec_closure (e - (1 :: int)) (n - (10 :: int)) = spec n0 else ((0 :: int) \<le> (101 :: int) - n + (10 :: int) * e \<and> (101 :: int) - (n + (11 :: int)) + (10 :: int) * (e + (1 :: int)) < (101 :: int) - n + (10 :: int) * e \<or> (101 :: int) - n + (10 :: int) * e = (101 :: int) - (n + (11 :: int)) + (10 :: int) * (e + (1 :: int)) \<and> (0 :: int) \<le> e \<and> e + (1 :: int) < e) \<and> (0 :: int) \<le> e + (1 :: int) \<and> iter spec_closure (e + (1 :: int)) (n + (11 :: int)) = spec n0 else n = spec n0)"
  sorry
end

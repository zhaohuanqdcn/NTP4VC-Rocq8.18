theory mccarthy_vc_sp_McCarthy91Mach_f91_nonrecqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.int_Iter"
begin
definition spec :: "int \<Rightarrow> int"
  where "spec x = (if x \<le> (100 :: int) then 91 :: int else x - (10 :: int))" for x
consts spec_closure :: "int \<Rightarrow> int"
axiomatization where spec_closure_def:   "spec_closure y = spec y"
  for y :: "int"
theorem f91_nonrec'vc:
  fixes n0 :: "63 word"
  shows "(0 :: int) \<le> int (1 :: nat)"
  and "iter spec_closure (int (1 :: nat)) (sint n0) = spec (sint n0)"
  and "\<forall>(e :: nat) (n :: 63 word). (0 :: int) \<le> int e \<and> iter spec_closure (int e) (sint n) = spec (sint n0) \<longrightarrow> (if (0 :: nat) < e then (if (100 :: int) < sint n then int'63_in_bounds (sint n - (10 :: int)) else int'63_in_bounds (sint n + (11 :: int))) \<and> (\<forall>(e1 :: nat) (n1 :: 63 word). (if (100 :: int) < sint n then sint n1 = sint n - (10 :: int) \<and> int e1 = int e - (1 :: int) else sint n1 = sint n + (11 :: int) \<and> int e1 = int e + (1 :: int)) \<longrightarrow> ((0 :: int) \<le> (101 :: int) - sint n + (10 :: int) * int e \<and> (101 :: int) - sint n1 + (10 :: int) * int e1 < (101 :: int) - sint n + (10 :: int) * int e \<or> (101 :: int) - sint n + (10 :: int) * int e = (101 :: int) - sint n1 + (10 :: int) * int e1 \<and> (0 :: int) \<le> int e \<and> e1 < e) \<and> (0 :: int) \<le> int e1 \<and> iter spec_closure (int e1) (sint n1) = spec (sint n0)) else sint n = spec (sint n0))"
  sorry
end

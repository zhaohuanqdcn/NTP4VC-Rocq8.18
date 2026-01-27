theory assigning_meanings_to_programs_Sum_sumqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.int_Sum"
begin
theorem sum'vc:
  fixes n :: "int"
  fixes a :: "int list"
  assumes fact0: "(0 :: int) \<le> n"
  assumes fact1: "n < int (length a)"
  shows "(1 :: int) \<le> (1 :: int)"
  and "(1 :: int) \<le> n + (1 :: int)"
  and "(0 :: int) = sum_list (drop (1 :: nat) (take ((1 :: nat) - (1 :: nat)) a))"
  and "\<forall>(i :: int). (1 :: int) \<le> i \<and> i \<le> n + (1 :: int) \<longrightarrow> (if i \<le> n then ((0 :: int) \<le> i \<and> i < int (length a)) \<and> ((0 :: int) \<le> n - i \<and> n - (i + (1 :: int)) < n - i) \<and> ((1 :: int) \<le> i + (1 :: int) \<and> i + (1 :: int) \<le> n + (1 :: int)) \<and> sum_list (drop (1 :: nat) (take (nat i - (1 :: nat)) a)) + a ! nat i = sum_list (drop (1 :: nat) (take (nat (i + (1 :: int)) - (1 :: nat)) a)) else sum_list (drop (1 :: nat) (take (nat i - (1 :: nat)) a)) = sum_list (drop (1 :: nat) (take (nat (n + (1 :: int)) - (1 :: nat)) a)))"
  sorry
end

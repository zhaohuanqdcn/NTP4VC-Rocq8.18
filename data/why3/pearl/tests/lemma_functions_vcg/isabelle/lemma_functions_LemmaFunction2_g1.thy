theory lemma_functions_LemmaFunction2_g1
  imports "NTP4Verif.NTP4Verif" "Why3STD.int_Sum"
begin
theorem g1:
  fixes a :: "int list"
  assumes fact0: "\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length a) \<longrightarrow> (0 :: int) \<le> a ! nat i"
  shows "(0 :: int) \<le> sum_list (drop (0 :: nat) (take (length a - (0 :: nat)) a))"
  sorry
end

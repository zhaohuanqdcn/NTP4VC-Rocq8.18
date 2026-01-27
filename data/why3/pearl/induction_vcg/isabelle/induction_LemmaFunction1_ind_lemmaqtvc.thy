theory induction_LemmaFunction1_ind_lemmaqtvc
  imports "NTP4Verif.NTP4Verif" "./induction_Hyps"
begin
theorem ind_lemma'vc:
  fixes n :: "int"
  assumes fact0: "(0 :: int) \<le> n"
  shows "p n"
  sorry
end

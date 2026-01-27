theory induction_LemmaFunction1_G
  imports "NTP4Verif.NTP4Verif" "./induction_Hyps"
begin
theorem G:
  fixes n :: "int"
  assumes fact0: "(0 :: int) \<le> n"
  shows "p n"
  sorry
end

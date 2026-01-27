theory induction_LemmaFunction3_G
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "./induction_Hyps"
begin
theorem G:
  fixes n :: "int"
  assumes fact0: "(0 :: int) \<le> n"
  shows "p n"
  sorry
end

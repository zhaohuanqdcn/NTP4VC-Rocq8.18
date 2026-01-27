theory binary_search_Complexity_log2qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
theorem log2'vc:
  fixes n :: "int"
  assumes fact0: "\<not>n \<le> (1 :: int)"
  shows "\<not>(2 :: int) = (0 :: int)"
  and "(0 :: int) \<le> n"
  and "n cdiv (2 :: int) < n"
  sorry
end

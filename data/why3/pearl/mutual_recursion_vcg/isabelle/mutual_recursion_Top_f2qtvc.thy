theory mutual_recursion_Top_f2qtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem f2'vc:
  fixes n :: "int"
  assumes fact0: "(1 :: int) \<le> n"
  shows "let o1 :: int = n - (1 :: int) in ((0 :: int) \<le> n \<and> o1 < n \<or> n = o1 \<and> (0 :: int) \<le> (0 :: int) \<and> (1 :: int) < (0 :: int)) \<and> (0 :: int) \<le> o1"
  sorry
end

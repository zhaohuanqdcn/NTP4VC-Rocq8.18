theory nistonacci_Top_nistqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem nist'vc:
  fixes n :: "int"
  assumes fact0: "(0 :: int) \<le> n"
  assumes fact1: "\<not>n < (2 :: int)"
  shows "let o1 :: int = n - (1 :: int) in (((0 :: int) \<le> n \<and> o1 < n) \<and> (0 :: int) \<le> o1) \<and> (let o2 :: int = n - (2 :: int) in ((0 :: int) \<le> n \<and> o2 < n) \<and> (0 :: int) \<le> o2)"
  sorry
end

theory euler001_DivModHints_mod_div_uniqueqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem mod_div_unique'vc:
  fixes q :: "int"
  fixes y :: "int"
  fixes r :: "int"
  assumes fact0: "(0 :: int) \<le> q * y + r"
  assumes fact1: "(0 :: int) < y"
  assumes fact2: "(0 :: int) \<le> r"
  assumes fact3: "r < y"
  shows "q = (q * y + r) cdiv y"
  and "r = (q * y + r) cmod y"
  sorry
end

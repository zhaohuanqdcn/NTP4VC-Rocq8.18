theory assigning_meanings_to_programs_Division_divisionqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
theorem division'vc:
  fixes x :: "int"
  fixes y :: "int"
  assumes fact0: "(0 :: int) \<le> x"
  assumes fact1: "(0 :: int) < y"
  shows "(0 :: int) \<le> x"
  and "x = (0 :: int) * y + x"
  and "\<forall>(r :: int) (q :: int). (0 :: int) \<le> r \<and> x = q * y + r \<longrightarrow> (if y \<le> r then ((0 :: int) \<le> r \<and> r - y < r) \<and> (0 :: int) \<le> r - y \<and> x = (q + (1 :: int)) * y + (r - y) else ((0 :: int) \<le> r \<and> r < y) \<and> x = q * y + r)"
  sorry
end

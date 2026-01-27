theory division_Division_divisionqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
theorem division'vc:
  fixes a :: "int"
  fixes b :: "int"
  assumes fact0: "(0 :: int) \<le> a"
  assumes fact1: "(0 :: int) < b"
  shows "(0 :: int) * b + a = a"
  and "(0 :: int) \<le> a"
  and "\<forall>(r :: int) (q :: int). q * b + r = a \<and> (0 :: int) \<le> r \<longrightarrow> (if b \<le> r then ((0 :: int) \<le> r \<and> r - b < r) \<and> (q + (1 :: int)) * b + (r - b) = a \<and> (0 :: int) \<le> r - b else \<exists>(r1 :: int). q * b + r1 = a \<and> (0 :: int) \<le> r1 \<and> r1 < b)"
  sorry
end

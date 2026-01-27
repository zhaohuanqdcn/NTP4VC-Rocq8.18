theory verifythis_2015_parallel_gcd_ParallelGCD_parallel_gcdqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
theorem parallel_gcd'vc:
  fixes a0 :: "int"
  fixes b0 :: "int"
  assumes fact0: "(0 :: int) < a0"
  assumes fact1: "(0 :: int) < b0"
  shows "(0 :: int) < a0"
  and "a0 \<le> a0"
  and "(0 :: int) < b0"
  and "b0 \<le> b0"
  and "\<forall>(b :: int) (a :: int). (((0 :: int) < a \<and> a \<le> a0) \<and> (0 :: int) < b \<and> b \<le> b0) \<and> gcd a b = gcd a0 b0 \<longrightarrow> (if \<not>a = b then \<forall>(o1 :: bool). if o1 = True then if b < a then (((0 :: int) < a - b \<and> a - b \<le> a0) \<and> (0 :: int) < b \<and> b \<le> b0) \<and> gcd (a - b) b = gcd a0 b0 else (((0 :: int) < a \<and> a \<le> a0) \<and> (0 :: int) < b \<and> b \<le> b0) \<and> gcd a b = gcd a0 b0 else if a < b then (((0 :: int) < a \<and> a \<le> a0) \<and> (0 :: int) < b - a \<and> b - a \<le> b0) \<and> gcd a (b - a) = gcd a0 b0 else (((0 :: int) < a \<and> a \<le> a0) \<and> (0 :: int) < b \<and> b \<le> b0) \<and> gcd a b = gcd a0 b0 else a = gcd a0 b0)"
  sorry
end

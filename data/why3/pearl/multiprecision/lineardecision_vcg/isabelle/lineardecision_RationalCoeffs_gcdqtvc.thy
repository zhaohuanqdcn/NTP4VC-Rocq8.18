theory lineardecision_RationalCoeffs_gcdqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
typedecl  t
typedecl  rvars
definition rinterp :: "int \<times> int \<Rightarrow> (int \<Rightarrow> real) \<Rightarrow> real"
  where "rinterp t1 x_v = (case t1 of (n, d) \<Rightarrow> real_of_int n / real_of_int d)" for t1 x_v
theorem gcd'vc:
  fixes x :: "int"
  fixes y :: "int"
  assumes fact0: "(0 :: int) < x"
  assumes fact1: "(0 :: int) < y"
  shows "(0 :: int) \<le> x"
  and "(0 :: int) \<le> y"
  and "\<forall>(y1 :: int) (x1 :: int). ((0 :: int) \<le> x1 \<and> (0 :: int) \<le> y1) \<and> gcd x1 y1 = gcd x y \<and> ((0 :: int) < x \<longrightarrow> (0 :: int) < x1) \<longrightarrow> (if (0 :: int) < y1 then \<not>y1 = (0 :: int) \<and> \<not>y1 = (0 :: int) \<and> ((0 :: int) \<le> y1 \<and> x1 cmod y1 < y1) \<and> ((0 :: int) \<le> y1 \<and> (0 :: int) \<le> x1 cmod y1) \<and> gcd y1 (x1 cmod y1) = gcd x y \<and> ((0 :: int) < x \<longrightarrow> (0 :: int) < y1) else x1 = gcd x y \<and> (0 :: int) < x1)"
  sorry
end

theory gcd_bezout_GcdBezout_gcdqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
theorem gcd'vc:
  fixes x :: "int"
  fixes y :: "int"
  assumes fact0: "(0 :: int) \<le> x"
  assumes fact1: "(0 :: int) \<le> y"
  shows "(0 :: int) \<le> x"
  and "(0 :: int) \<le> y"
  and "(1 :: int) * x + (0 :: int) * y = x"
  and "(0 :: int) * x + (1 :: int) * y = y"
  and "\<forall>(d :: int) (c :: int) (b :: int) (a :: int). ((0 :: int) \<le> a * x + b * y \<and> (0 :: int) \<le> c * x + d * y) \<and> gcd (a * x + b * y) (c * x + d * y) = gcd x y \<longrightarrow> (if (0 :: int) < c * x + d * y then \<not>c * x + d * y = (0 :: int) \<and> \<not>c * x + d * y = (0 :: int) \<and> (let q :: int = (a * x + b * y) cdiv (c * x + d * y) in ((0 :: int) \<le> c * x + d * y \<and> (a * x + b * y) cmod (c * x + d * y) < c * x + d * y) \<and> ((0 :: int) \<le> c * x + d * y \<and> (0 :: int) \<le> (a * x + b * y) cmod (c * x + d * y)) \<and> gcd (c * x + d * y) ((a * x + b * y) cmod (c * x + d * y)) = gcd x y \<and> (a - c * q) * x + (b - d * q) * y = (a * x + b * y) cmod (c * x + d * y)) else a * x + b * y = gcd x y)"
  sorry
end

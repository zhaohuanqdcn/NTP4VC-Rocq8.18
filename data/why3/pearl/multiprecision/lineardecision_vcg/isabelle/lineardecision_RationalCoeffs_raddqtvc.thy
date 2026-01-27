theory lineardecision_RationalCoeffs_raddqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
typedecl  t
typedecl  rvars
definition rinterp :: "int \<times> int \<Rightarrow> (int \<Rightarrow> real) \<Rightarrow> real"
  where "rinterp t1 x_v = (case t1 of (n, d) \<Rightarrow> real_of_int n / real_of_int d)" for t1 x_v
theorem radd'vc:
  fixes a :: "int"
  fixes b :: "int"
  fixes result :: "int"
  fixes result1 :: "int"
  fixes a1 :: "int"
  fixes b1 :: "int"
  assumes fact0: "\<not>(\<not>a = (0 :: int) \<longrightarrow> b = (0 :: int))"
  shows "let result2 :: int \<times> int = (result, result1) in (\<forall>(v :: int \<Rightarrow> real). rinterp result2 v = rinterp (a1 * b + b1 * a, a * b) v) \<longrightarrow> (\<forall>(y :: int \<Rightarrow> real). rinterp result2 y = rinterp (a1, a) y + rinterp (b1, b) y)"
  sorry
end

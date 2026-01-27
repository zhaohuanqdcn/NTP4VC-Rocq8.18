theory lineardecision_RationalCoeffs_crossqtvc
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  t
typedecl  rvars
definition rinterp :: "int \<times> int \<Rightarrow> (int \<Rightarrow> real) \<Rightarrow> real"
  where "rinterp t1 x_v = (case t1 of (n, d) \<Rightarrow> real_of_int n / real_of_int d)" for t1 x_v
theorem cross'vc:
  fixes d1 :: "int"
  fixes d2 :: "int"
  fixes n1 :: "int"
  fixes n2 :: "int"
  assumes fact0: "\<not>d1 = (0 :: int)"
  assumes fact1: "\<not>d2 = (0 :: int)"
  shows "n1 * d2 = n2 * d1 \<longleftrightarrow> (\<forall>(v :: int \<Rightarrow> real). rinterp (n1, d1) v = rinterp (n2, d2) v)"
  sorry
end

theory lineardecision_RationalCoeffs_prod_compat_eqqtvc
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  t
typedecl  rvars
definition rinterp :: "int \<times> int \<Rightarrow> (int \<Rightarrow> real) \<Rightarrow> real"
  where "rinterp t1 x_v = (case t1 of (n, d) \<Rightarrow> real_of_int n / real_of_int d)" for t1 x_v
theorem prod_compat_eq'vc:
  fixes c :: "real"
  fixes a :: "real"
  fixes b :: "real"
  assumes fact0: "\<not>c = (0 :: Real.real)"
  assumes fact1: "a * c = b * c"
  shows "a = b"
  sorry
end

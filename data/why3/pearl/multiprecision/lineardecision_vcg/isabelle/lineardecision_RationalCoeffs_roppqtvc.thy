theory lineardecision_RationalCoeffs_roppqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
typedecl  t
typedecl  rvars
definition rinterp :: "int \<times> int \<Rightarrow> (int \<Rightarrow> real) \<Rightarrow> real"
  where "rinterp t1 x_v = (case t1 of (n, d) \<Rightarrow> real_of_int n / real_of_int d)" for t1 x_v
theorem ropp'vc:
  fixes n :: "int"
  fixes d :: "int"
  fixes y :: "int \<Rightarrow> real"
  shows "rinterp (-n, d) y = -rinterp (n, d) y"
  sorry
end

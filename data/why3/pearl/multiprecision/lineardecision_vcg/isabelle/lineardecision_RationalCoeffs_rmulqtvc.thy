theory lineardecision_RationalCoeffs_rmulqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
typedecl  t
typedecl  rvars
definition rinterp :: "int \<times> int \<Rightarrow> (int \<Rightarrow> real) \<Rightarrow> real"
  where "rinterp t1 x_v = (case t1 of (n, d) \<Rightarrow> real_of_int n / real_of_int d)" for t1 x_v
theorem rmul'vc:
  fixes a :: "int"
  fixes o1 :: "bool"
  fixes b :: "int"
  fixes a1 :: "int"
  fixes b1 :: "int"
  fixes y :: "int \<Rightarrow> real"
  assumes fact0: "if a = (0 :: int) then o1 = True else o1 = (if b = (0 :: int) then True else False)"
  assumes fact1: "\<not>o1 = True"
  shows "rinterp (a1 * b1, a * b) y = rinterp (a1, a) y * rinterp (b1, b) y"
  sorry
end

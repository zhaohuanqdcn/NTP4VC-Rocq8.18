theory lineardecision_RationalCoeffs_reqqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
typedecl  t
typedecl  rvars
definition rinterp :: "int \<times> int \<Rightarrow> (int \<Rightarrow> real) \<Rightarrow> real"
  where "rinterp t1 x_v = (case t1 of (n, d) \<Rightarrow> real_of_int n / real_of_int d)" for t1 x_v
theorem req'vc:
  fixes a :: "int"
  fixes b :: "int"
  fixes a1 :: "int"
  fixes b1 :: "int"
  fixes y :: "int \<Rightarrow> real"
  assumes fact0: "\<exists>(o1 :: bool). (if a = b then o1 = (if a1 = b1 then True else False) else o1 = False) \<and> (if o1 = True then True else if \<not>a1 = (0 :: int) then if \<not>b1 = (0 :: int) then True = (if a * b1 = b * a1 then True else False) else True = False else True = False)"
  shows "rinterp (a, a1) y = rinterp (b, b1) y"
  sorry
end

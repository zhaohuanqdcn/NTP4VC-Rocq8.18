theory lineardecision_RationalCoeffs_simpqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
typedecl  t
typedecl  rvars
definition rinterp :: "int \<times> int \<Rightarrow> (int \<Rightarrow> real) \<Rightarrow> real"
  where "rinterp t1 x_v = (case t1 of (n, d) \<Rightarrow> real_of_int n / real_of_int d)" for t1 x_v
theorem simp'vc:
  fixes d :: "int"
  fixes n :: "int"
  shows "\<not>d = (0 :: int) \<longrightarrow> \<not>n = (0 :: int) \<longrightarrow> (let o1 :: int = abs d; o2 :: int = abs n in ((0 :: int) < o2 \<and> (0 :: int) < o1) \<and> (let g :: int = gcd o2 o1 in (0 :: int) < g \<longrightarrow> \<not>g = (0 :: int)))"
  and "\<forall>(result :: int) (result1 :: int). let result2 :: int \<times> int = (result, result1) in (if d = (0 :: int) then result = n \<and> result1 = d else if n = (0 :: int) then result2 = (0 :: int, 1 :: int) else let g :: int = gcd (abs n) (abs d) in (0 :: int) < g \<and> result = n cdiv g \<and> result1 = d cdiv g) \<longrightarrow> (\<forall>(v :: int \<Rightarrow> real). rinterp result2 v = rinterp (n, d) v)"
  sorry
end

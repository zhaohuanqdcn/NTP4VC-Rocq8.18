theory pigeonhole_Pigeonhole_belowqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
theorem below'vc:
  fixes n :: "int"
  assumes fact0: "(0 :: int) \<le> n"
  shows "\<not>n = (0 :: int) \<longrightarrow> (let o1 :: int = n - (1 :: int) in ((0 :: int) \<le> n \<and> o1 < n) \<and> (0 :: int) \<le> o1)"
  and "\<forall>(result :: int fset). (if n = (0 :: int) then result = fempty else let o1 :: int = n - (1 :: int) in \<exists>(o2 :: int fset). ((\<forall>(i :: int). i |\<in>| o2 \<longleftrightarrow> (0 :: int) \<le> i \<and> i < o1) \<and> int (fcard o2) = o1) \<and> result = finsert (n - (1 :: int)) o2) \<longrightarrow> (\<forall>(i :: int). i |\<in>| result \<longleftrightarrow> (0 :: int) \<le> i \<and> i < n) \<and> int (fcard result) = n"
  sorry
end

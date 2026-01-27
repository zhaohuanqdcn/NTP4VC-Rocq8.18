theory verifythis_fm2012_LRS_LCP_lcpqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
definition is_common_prefix :: "int list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "is_common_prefix a x y l \<longleftrightarrow> (0 :: int) \<le> l \<and> x + l \<le> int (length a) \<and> y + l \<le> int (length a) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < l \<longrightarrow> a ! nat (x + i) = a ! nat (y + i))" for a x y l
definition is_longest_common_prefix :: "int list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "is_longest_common_prefix a x y l \<longleftrightarrow> is_common_prefix a x y l \<and> (\<forall>(m :: int). l < m \<longrightarrow> \<not>is_common_prefix a x y m)" for a x y l
theorem lcp'vc:
  fixes x :: "int"
  fixes a :: "int list"
  fixes y :: "int"
  assumes fact0: "(0 :: int) \<le> x"
  assumes fact1: "x \<le> int (length a)"
  assumes fact2: "(0 :: int) \<le> y"
  assumes fact3: "y \<le> int (length a)"
  shows "let n :: int = int (length a) in is_common_prefix a x y (0 :: int) \<and> (\<forall>(l :: int). is_common_prefix a x y l \<longrightarrow> (let o1 :: int = x + l in (o1 < n \<longrightarrow> y + l < n \<longrightarrow> (let o2 :: int = y + l in ((0 :: int) \<le> o2 \<and> o2 < int (length a)) \<and> (let o3 :: int = x + l in (0 :: int) \<le> o3 \<and> o3 < int (length a)))) \<and> (\<forall>(o2 :: bool). (if o1 < n then if y + l < n then o2 = (if a ! nat (x + l) = a ! nat (y + l) then True else False) else o2 = False else o2 = False) \<longrightarrow> (if o2 = True then ((0 :: int) \<le> n - l \<and> n - (l + (1 :: int)) < n - l) \<and> is_common_prefix a x y (l + (1 :: int)) else is_longest_common_prefix a x y l))))"
  sorry
end

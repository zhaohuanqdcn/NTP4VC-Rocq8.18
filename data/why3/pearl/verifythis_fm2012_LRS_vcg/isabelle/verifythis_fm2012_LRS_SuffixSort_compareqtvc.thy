theory verifythis_fm2012_LRS_SuffixSort_compareqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "./verifythis_fm2012_LRS_LCP"
begin
definition lt :: "int list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "lt a x y \<longleftrightarrow> (let n :: int = int (length a) in ((0 :: int) \<le> x \<and> x \<le> n) \<and> ((0 :: int) \<le> y \<and> y \<le> n) \<and> (\<exists>(l :: int). is_common_prefix a x y l \<and> y + l < n \<and> (x + l = n \<or> a ! nat (x + l) < a ! nat (y + l))))" for a x y
theorem compare'vc:
  fixes x :: "int"
  fixes a :: "int list"
  fixes y :: "int"
  assumes fact0: "(0 :: int) \<le> x"
  assumes fact1: "x \<le> int (length a)"
  assumes fact2: "(0 :: int) \<le> y"
  assumes fact3: "y \<le> int (length a)"
  shows "\<not>x = y \<longrightarrow> (let n :: int = int (length a) in (((0 :: int) \<le> x \<and> x \<le> int (length a)) \<and> (0 :: int) \<le> y \<and> y \<le> int (length a)) \<and> (\<forall>(l :: int). is_longest_common_prefix a x y l \<longrightarrow> \<not>x + l = n \<longrightarrow> \<not>y + l = n \<longrightarrow> (let o1 :: int = y + l in ((0 :: int) \<le> o1 \<and> o1 < int (length a)) \<and> (let o2 :: int = x + l in ((0 :: int) \<le> o2 \<and> o2 < int (length a)) \<and> (\<not>a ! nat o2 < a ! nat o1 \<longrightarrow> (let o3 :: int = y + l in ((0 :: int) \<le> o3 \<and> o3 < int (length a)) \<and> (let o4 :: int = x + l in ((0 :: int) \<le> o4 \<and> o4 < int (length a)) \<and> a ! nat o3 < a ! nat o4)))))))"
  and "\<forall>(result :: int). (if x = y then result = (0 :: int) else let n :: int = int (length a) in \<exists>(l :: int). is_longest_common_prefix a x y l \<and> (if x + l = n then result = -(1 :: int) else if y + l = n then result = (1 :: int) else if a ! nat (x + l) < a ! nat (y + l) then result = -(1 :: int) else a ! nat (y + l) < a ! nat (x + l) \<and> result = (1 :: int))) \<longrightarrow> (result = (0 :: int) \<longrightarrow> x = y) \<and> (result < (0 :: int) \<longrightarrow> lt a x y) \<and> ((0 :: int) < result \<longrightarrow> lt a y x)"
  sorry
end

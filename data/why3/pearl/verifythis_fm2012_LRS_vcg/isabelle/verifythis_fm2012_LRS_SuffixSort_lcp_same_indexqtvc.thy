theory verifythis_fm2012_LRS_SuffixSort_lcp_same_indexqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.map_MapEq" "Why3STD.map_MapExchange" "Why3STD.map_MapPermut" "Why3STD.map_MapInjection" "./verifythis_fm2012_LRS_LCP"
begin
definition lt :: "int list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "lt a x y \<longleftrightarrow> (let n :: int = int (length a) in ((0 :: int) \<le> x \<and> x \<le> n) \<and> ((0 :: int) \<le> y \<and> y \<le> n) \<and> (\<exists>(l :: int). is_common_prefix a x y l \<and> y + l < n \<and> (x + l = n \<or> a ! nat (x + l) < a ! nat (y + l))))" for a x y
definition range :: "int list \<Rightarrow> _"
  where "range a \<longleftrightarrow> map_MapInjection.range (nth a o nat) (int (length a))" for a
definition le :: "int list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "le a x y \<longleftrightarrow> x = y \<or> lt a x y" for a x y
theorem lcp_same_index'vc:
  fixes x :: "int"
  fixes a :: "int list"
  assumes fact0: "(0 :: int) \<le> x"
  assumes fact1: "x \<le> int (length a)"
  shows "is_longest_common_prefix a x x (int (length a) - x)"
  sorry
end

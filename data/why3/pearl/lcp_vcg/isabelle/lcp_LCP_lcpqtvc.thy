theory lcp_LCP_lcpqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
definition eqseq :: "int list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "eqseq a x y len \<longleftrightarrow> (0 :: int) \<le> len \<and> x + len \<le> int (length a) \<and> y + len \<le> int (length a) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < len \<longrightarrow> a ! nat (x + i) = a ! nat (y + i))" for a x y len
theorem lcp'vc:
  fixes x :: "int"
  fixes a :: "int list"
  fixes y :: "int"
  assumes fact0: "(0 :: int) \<le> x"
  assumes fact1: "x < int (length a)"
  assumes fact2: "(0 :: int) \<le> y"
  assumes fact3: "y < int (length a)"
  shows "eqseq a x y (0 :: int)"
  and "\<forall>(l :: int). eqseq a x y l \<longrightarrow> (let o1 :: int = int (length a); o2 :: int = x + l in (o2 < o1 \<longrightarrow> y + l < int (length a) \<longrightarrow> (let o3 :: int = y + l in ((0 :: int) \<le> o3 \<and> o3 < int (length a)) \<and> (let o4 :: int = x + l in (0 :: int) \<le> o4 \<and> o4 < int (length a)))) \<and> (\<forall>(o3 :: bool). (if o2 < o1 then if y + l < int (length a) then o3 = (if a ! nat (x + l) = a ! nat (y + l) then True else False) else o3 = False else o3 = False) \<longrightarrow> (if o3 = True then ((0 :: int) \<le> int (length a) - l \<and> int (length a) - (l + (1 :: int)) < int (length a) - l) \<and> eqseq a x y (l + (1 :: int)) else eqseq a x y l \<and> (\<forall>(len :: int). l < len \<longrightarrow> \<not>eqseq a x y len))))"
  sorry
end

theory lcp_LCP_not_eqseqqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
definition eqseq :: "int list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "eqseq a x y len \<longleftrightarrow> (0 :: int) \<le> len \<and> x + len \<le> int (length a) \<and> y + len \<le> int (length a) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < len \<longrightarrow> a ! nat (x + i) = a ! nat (y + i))" for a x y len
theorem not_eqseq'vc:
  fixes i :: "int"
  fixes a :: "int list"
  fixes x :: "int"
  fixes y :: "int"
  fixes len :: "int"
  assumes fact0: "(0 :: int) \<le> i"
  assumes fact1: "\<not>a ! nat (x + i) = a ! nat (y + i)"
  assumes fact2: "i < len"
  shows "\<not>eqseq a x y len"
  sorry
end

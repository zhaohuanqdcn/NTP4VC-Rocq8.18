theory lcp_LCP
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
definition eqseq :: "int list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "eqseq a x y len \<longleftrightarrow> (0 :: int) \<le> len \<and> x + len \<le> int (length a) \<and> y + len \<le> int (length a) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < len \<longrightarrow> a ! nat (x + i) = a ! nat (y + i))" for a x y len
end

theory verifythis_fm2012_LRS_LCP
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
definition is_common_prefix :: "int list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "is_common_prefix a x y l \<longleftrightarrow> (0 :: int) \<le> l \<and> x + l \<le> int (length a) \<and> y + l \<le> int (length a) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < l \<longrightarrow> a ! nat (x + i) = a ! nat (y + i))" for a x y l
definition is_longest_common_prefix :: "int list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "is_longest_common_prefix a x y l \<longleftrightarrow> is_common_prefix a x y l \<and> (\<forall>(m :: int). l < m \<longrightarrow> \<not>is_common_prefix a x y m)" for a x y l
end

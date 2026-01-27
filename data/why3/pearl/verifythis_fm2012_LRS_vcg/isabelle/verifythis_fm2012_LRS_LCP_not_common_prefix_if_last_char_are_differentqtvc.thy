theory verifythis_fm2012_LRS_LCP_not_common_prefix_if_last_char_are_differentqtvc
  imports "NTP4Verif.NTP4Verif"
begin
definition is_common_prefix :: "int list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "is_common_prefix a x y l \<longleftrightarrow> (0 :: int) \<le> l \<and> x + l \<le> int (length a) \<and> y + l \<le> int (length a) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < l \<longrightarrow> a ! nat (x + i) = a ! nat (y + i))" for a x y l
theorem not_common_prefix_if_last_char_are_different'vc:
  fixes l :: "int"
  fixes x :: "int"
  fixes a :: "int list"
  fixes y :: "int"
  assumes fact0: "(0 :: int) \<le> l"
  assumes fact1: "x + l < int (length a)"
  assumes fact2: "y + l < int (length a)"
  assumes fact3: "\<not>a ! nat (x + l) = a ! nat (y + l)"
  shows "\<not>is_common_prefix a x y (l + (1 :: int))"
  sorry
end

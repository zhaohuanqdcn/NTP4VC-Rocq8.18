theory kmp_KnuthMorrisPratt_matches_contradiction_at_iqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
typedecl  char
definition matches1 :: "char list \<Rightarrow> int \<Rightarrow> char list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "matches1 a1 i1 a2 i2 n \<longleftrightarrow> ((0 :: int) \<le> i1 \<and> i1 \<le> int (length a1) - n) \<and> ((0 :: int) \<le> i2 \<and> i2 \<le> int (length a2) - n) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < n \<longrightarrow> a1 ! nat (i1 + i) = a2 ! nat (i2 + i))" for a1 i1 a2 i2 n
theorem matches_contradiction_at_i'vc:
  fixes n :: "int"
  fixes i :: "int"
  fixes a1 :: "char list"
  fixes i1 :: "int"
  fixes a2 :: "char list"
  fixes i2 :: "int"
  assumes fact0: "(0 :: int) < n"
  assumes fact1: "(0 :: int) \<le> i"
  assumes fact2: "i < n"
  assumes fact3: "\<not>a1 ! nat (i1 + i) = a2 ! nat (i2 + i)"
  shows "\<not>matches1 a1 i1 a2 i2 n"
  sorry
end

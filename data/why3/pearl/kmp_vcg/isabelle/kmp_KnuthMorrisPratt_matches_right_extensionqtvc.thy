theory kmp_KnuthMorrisPratt_matches_right_extensionqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
typedecl  char
definition matches1 :: "char list \<Rightarrow> int \<Rightarrow> char list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "matches1 a1 i1 a2 i2 n \<longleftrightarrow> ((0 :: int) \<le> i1 \<and> i1 \<le> int (length a1) - n) \<and> ((0 :: int) \<le> i2 \<and> i2 \<le> int (length a2) - n) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < n \<longrightarrow> a1 ! nat (i1 + i) = a2 ! nat (i2 + i))" for a1 i1 a2 i2 n
theorem matches_right_extension'vc:
  fixes a1 :: "char list"
  fixes i1 :: "int"
  fixes a2 :: "char list"
  fixes i2 :: "int"
  fixes n :: "int"
  assumes fact0: "matches1 a1 i1 a2 i2 n"
  assumes fact1: "i1 \<le> int (length a1) - n - (1 :: int)"
  assumes fact2: "i2 \<le> int (length a2) - n - (1 :: int)"
  assumes fact3: "a1 ! nat (i1 + n) = a2 ! nat (i2 + n)"
  shows "matches1 a1 i1 a2 i2 (n + (1 :: int))"
  sorry
end

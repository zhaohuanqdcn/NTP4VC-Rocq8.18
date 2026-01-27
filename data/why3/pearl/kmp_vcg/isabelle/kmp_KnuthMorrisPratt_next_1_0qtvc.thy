theory kmp_KnuthMorrisPratt_next_1_0qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
typedecl  char
definition matches1 :: "char list \<Rightarrow> int \<Rightarrow> char list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "matches1 a1 i1 a2 i2 n \<longleftrightarrow> ((0 :: int) \<le> i1 \<and> i1 \<le> int (length a1) - n) \<and> ((0 :: int) \<le> i2 \<and> i2 \<le> int (length a2) - n) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < n \<longrightarrow> a1 ! nat (i1 + i) = a2 ! nat (i2 + i))" for a1 i1 a2 i2 n
definition is_next :: "char list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "is_next p j n \<longleftrightarrow> ((0 :: int) \<le> n \<and> n < j) \<and> matches1 p (j - n) p (0 :: int) n \<and> (\<forall>(z :: int). n < z \<and> z < j \<longrightarrow> \<not>matches1 p (j - z) p (0 :: int) z)" for p j n
theorem next_1_0'vc:
  fixes p :: "char list"
  assumes fact0: "(1 :: int) \<le> int (length p)"
  shows "is_next p (1 :: int) (0 :: int)"
  sorry
end

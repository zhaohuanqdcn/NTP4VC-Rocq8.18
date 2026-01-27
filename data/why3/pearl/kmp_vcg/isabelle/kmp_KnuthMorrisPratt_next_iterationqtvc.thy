theory kmp_KnuthMorrisPratt_next_iterationqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
typedecl  char
definition matches1 :: "char list \<Rightarrow> int \<Rightarrow> char list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "matches1 a1 i1 a2 i2 n \<longleftrightarrow> ((0 :: int) \<le> i1 \<and> i1 \<le> int (length a1) - n) \<and> ((0 :: int) \<le> i2 \<and> i2 \<le> int (length a2) - n) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < n \<longrightarrow> a1 ! nat (i1 + i) = a2 ! nat (i2 + i))" for a1 i1 a2 i2 n
definition is_next :: "char list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "is_next p j n \<longleftrightarrow> ((0 :: int) \<le> n \<and> n < j) \<and> matches1 p (j - n) p (0 :: int) n \<and> (\<forall>(z :: int). n < z \<and> z < j \<longrightarrow> \<not>matches1 p (j - z) p (0 :: int) z)" for p j n
theorem next_iteration'vc:
  fixes j :: "int"
  fixes p :: "char list"
  fixes i :: "int"
  fixes a :: "char list"
  fixes n :: "int"
  assumes fact0: "(0 :: int) < j"
  assumes fact1: "j < int (length p)"
  assumes fact2: "j \<le> i"
  assumes fact3: "i \<le> int (length a)"
  assumes fact4: "matches1 a (i - j) p (0 :: int) j"
  assumes fact5: "is_next p j n"
  shows "matches1 a (i - n) p (0 :: int) n"
  sorry
end

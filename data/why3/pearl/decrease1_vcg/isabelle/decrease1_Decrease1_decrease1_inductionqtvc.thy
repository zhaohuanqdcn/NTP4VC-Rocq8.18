theory decrease1_Decrease1_decrease1_inductionqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
definition decrease1 :: "int list \<Rightarrow> _"
  where "decrease1 a \<longleftrightarrow> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length a) - (1 :: int) \<longrightarrow> a ! nat i - (1 :: int) \<le> a ! nat (i + (1 :: int)))" for a
theorem decrease1_induction'vc:
  fixes a :: "int list"
  fixes i :: "int"
  fixes j :: "int"
  assumes fact0: "decrease1 a"
  assumes fact1: "(0 :: int) \<le> i"
  assumes fact2: "i \<le> j"
  assumes fact3: "j < int (length a)"
  shows "a ! nat i + i - j \<le> a ! nat j"
  sorry
end

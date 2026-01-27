theory pigeonhole_Pigeonhole_pigeonholeqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
theorem pigeonhole'vc:
  fixes m :: "int"
  fixes n :: "int"
  fixes f :: "int \<Rightarrow> int"
  assumes fact0: "(0 :: int) \<le> m"
  assumes fact1: "m < n"
  assumes fact2: "\<forall>(i :: int). (0 :: int) \<le> i \<and> i < n \<longrightarrow> (0 :: int) \<le> f i \<and> f i < m"
  shows "\<exists>(i1 :: int) (i2 :: int). ((0 :: int) \<le> i1 \<and> i1 < i2 \<and> i2 < n) \<and> f i1 = f i2"
  sorry
end

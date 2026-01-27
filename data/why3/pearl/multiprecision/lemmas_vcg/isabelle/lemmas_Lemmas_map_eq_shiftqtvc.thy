theory lemmas_Lemmas_map_eq_shiftqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.map_Const" "Why3STD.map_MapEq"
begin
definition map_eq_sub_shift :: "(int \<Rightarrow> 'a) \<Rightarrow> (int \<Rightarrow> 'a) \<Rightarrow> int \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "map_eq_sub_shift x y xi yi sz \<longleftrightarrow> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < sz \<longrightarrow> x (xi + i) = y (yi + i))" for x y xi yi sz
theorem map_eq_shift'vc:
  fixes x :: "int \<Rightarrow> 'a"
  fixes y :: "int \<Rightarrow> 'a"
  fixes xi :: "int"
  fixes yi :: "int"
  fixes sz :: "int"
  fixes k :: "int"
  assumes fact0: "map_eq_sub_shift x y xi yi sz"
  assumes fact1: "(0 :: int) \<le> k"
  assumes fact2: "k < sz"
  shows "x (xi + k) = y (yi + k)"
  sorry
end

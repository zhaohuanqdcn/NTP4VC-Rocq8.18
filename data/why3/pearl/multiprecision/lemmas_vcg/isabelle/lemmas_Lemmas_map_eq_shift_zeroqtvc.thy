theory lemmas_Lemmas_map_eq_shift_zeroqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.map_Const" "Why3STD.map_MapEq"
begin
definition map_eq_sub_shift :: "(int \<Rightarrow> 'a) \<Rightarrow> (int \<Rightarrow> 'a) \<Rightarrow> int \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "map_eq_sub_shift x y xi yi sz \<longleftrightarrow> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < sz \<longrightarrow> x (xi + i) = y (yi + i))" for x y xi yi sz
theorem map_eq_shift_zero'vc:
  fixes x :: "int \<Rightarrow> 'a"
  fixes y :: "int \<Rightarrow> 'a"
  fixes n :: "int"
  fixes m :: "int"
  assumes fact0: "map_eq_sub_shift x y n n (m - n)"
  shows "map_eq_sub x y n m"
  sorry
end

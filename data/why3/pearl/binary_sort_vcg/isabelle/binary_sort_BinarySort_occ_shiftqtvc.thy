theory binary_sort_BinarySort_occ_shiftqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.map_MapEq" "Why3STD.map_MapExchange" "Why3STD.map_MapPermut"
begin
theorem occ_shift'vc:
  fixes mid :: "int"
  fixes k :: "int"
  fixes m2 :: "int \<Rightarrow> 'a"
  fixes m1 :: "int \<Rightarrow> 'a"
  fixes x :: "'a"
  assumes fact0: "(0 :: int) \<le> mid"
  assumes fact1: "mid \<le> k"
  assumes fact2: "\<forall>(i :: int). mid < i \<and> i \<le> k \<longrightarrow> m2 i = m1 (i - (1 :: int))"
  assumes fact3: "m2 mid = m1 k"
  shows "map_occ x m1 mid (k + (1 :: int)) = map_occ x m2 mid (k + (1 :: int))"
  sorry
end

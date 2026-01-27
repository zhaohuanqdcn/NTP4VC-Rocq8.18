theory vstte10_queens_NQueens63_count_queensqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
definition is_board :: "63 word array63 \<Rightarrow> int \<Rightarrow> _"
  where "is_board board pos \<longleftrightarrow> (\<forall>(q :: int). (0 :: int) \<le> q \<and> q < pos \<longrightarrow> (0 :: int) \<le> sint (array63_elts board ! nat q) \<and> sint (array63_elts board ! nat q) < sint (array63_length board))" for board pos
theorem count_queens'vc:
  fixes n :: "63 word"
  assumes fact0: "(0 :: int) \<le> sint n"
  shows "(0 :: int) \<le> sint n"
  and "\<forall>(board :: 63 word array63). (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < sint n \<longrightarrow> array63_elts board ! nat i = (0 :: 63 word)) \<and> array63_length board = n \<longrightarrow> array63_length board = n \<and> ((0 :: int) \<le> (0 :: int) \<and> (0 :: int) \<le> sint n) \<and> is_board board (0 :: int)"
  sorry
end

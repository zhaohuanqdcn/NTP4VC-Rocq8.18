theory vstte10_queens_NQueens63_test_count_8qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
definition is_board :: "63 word array63 \<Rightarrow> int \<Rightarrow> _"
  where "is_board board pos \<longleftrightarrow> (\<forall>(q :: int). (0 :: int) \<le> q \<and> q < pos \<longrightarrow> (0 :: int) \<le> sint (array63_elts board ! nat q) \<and> sint (array63_elts board ! nat q) < sint (array63_length board))" for board pos
theorem test_count_8'vc:
  shows "(0 :: int) \<le> (8 :: int)"
  sorry
end

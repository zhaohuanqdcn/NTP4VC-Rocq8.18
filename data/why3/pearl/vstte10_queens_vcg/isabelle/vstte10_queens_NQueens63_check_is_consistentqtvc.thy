theory vstte10_queens_NQueens63_check_is_consistentqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
definition is_board :: "63 word array63 \<Rightarrow> int \<Rightarrow> _"
  where "is_board board pos \<longleftrightarrow> (\<forall>(q :: int). (0 :: int) \<le> q \<and> q < pos \<longrightarrow> (0 :: int) \<le> sint (array63_elts board ! nat q) \<and> sint (array63_elts board ! nat q) < sint (array63_length board))" for board pos
theorem check_is_consistent'vc:
  fixes pos :: "63 word"
  fixes board :: "63 word array63"
  assumes fact0: "(0 :: int) \<le> sint pos"
  assumes fact1: "sint pos < sint (array63_length board)"
  assumes fact2: "is_board board (sint pos + (1 :: int))"
  shows "(0 :: int) \<le> (0 :: int)"
  and "(0 :: int) \<le> sint pos"
  and "is_board board (sint pos + (1 :: int))"
  and "\<forall>(q :: 63 word). ((0 :: int) \<le> sint q \<and> sint q \<le> sint pos) \<and> is_board board (sint pos + (1 :: int)) \<longrightarrow> sint q < sint pos \<longrightarrow> ((0 :: int) \<le> sint q \<and> sint q < sint (array63_length board)) \<and> (let bq :: 63 word = array63_elts board ! nat (sint q) in ((0 :: int) \<le> sint pos \<and> sint pos < sint (array63_length board)) \<and> (let bpos :: 63 word = array63_elts board ! nat (sint pos) in (sint bq = sint bpos \<longrightarrow> bq = bpos) \<longrightarrow> \<not>bq = bpos \<longrightarrow> int'63_in_bounds (sint pos - sint q) \<and> (\<forall>(o1 :: 63 word). sint o1 = sint pos - sint q \<longrightarrow> int'63_in_bounds (sint bq - sint bpos) \<and> (\<forall>(o2 :: 63 word). sint o2 = sint bq - sint bpos \<longrightarrow> (sint o2 = sint o1 \<longrightarrow> o2 = o1) \<longrightarrow> \<not>o2 = o1 \<longrightarrow> int'63_in_bounds (sint pos - sint q) \<and> (\<forall>(o3 :: 63 word). sint o3 = sint pos - sint q \<longrightarrow> int'63_in_bounds (sint bpos - sint bq) \<and> (\<forall>(o4 :: 63 word). sint o4 = sint bpos - sint bq \<longrightarrow> (sint o4 = sint o3 \<longrightarrow> o4 = o3) \<longrightarrow> \<not>o4 = o3 \<longrightarrow> int'63_in_bounds (sint q + (1 :: int)) \<and> (\<forall>(o5 :: 63 word). sint o5 = sint q + (1 :: int) \<longrightarrow> ((0 :: int) \<le> sint pos - sint q \<and> sint pos - sint o5 < sint pos - sint q) \<and> ((0 :: int) \<le> sint o5 \<and> sint o5 \<le> sint pos) \<and> is_board board (sint pos + (1 :: int)))))))))"
  sorry
end

theory vstte10_queens_NQueens_count_queensqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
definition eq_board :: "int list \<Rightarrow> int list \<Rightarrow> int \<Rightarrow> _"
  where "eq_board b1 b2 pos \<longleftrightarrow> (\<forall>(q :: int). (0 :: int) \<le> q \<and> q < pos \<longrightarrow> b1 ! nat q = b2 ! nat q)" for b1 b2 pos
definition consistent_row :: "int list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "consistent_row board pos q \<longleftrightarrow> \<not>board ! nat q = board ! nat pos \<and> \<not>board ! nat q - board ! nat pos = pos - q \<and> \<not>board ! nat pos - board ! nat q = pos - q" for board pos q
definition is_consistent :: "int list \<Rightarrow> int \<Rightarrow> _"
  where "is_consistent board pos \<longleftrightarrow> (\<forall>(q :: int). (0 :: int) \<le> q \<and> q < pos \<longrightarrow> consistent_row board pos q)" for board pos
definition is_board :: "int list \<Rightarrow> int \<Rightarrow> _"
  where "is_board board pos \<longleftrightarrow> (\<forall>(q :: int). (0 :: int) \<le> q \<and> q < pos \<longrightarrow> (0 :: int) \<le> board ! nat q \<and> board ! nat q < int (length board))" for board pos
definition solution :: "int list \<Rightarrow> int \<Rightarrow> _"
  where "solution board pos \<longleftrightarrow> is_board board pos \<and> (\<forall>(q :: int). (0 :: int) \<le> q \<and> q < pos \<longrightarrow> is_consistent board q)" for board pos
theorem count_queens'vc:
  fixes board :: "int list"
  shows "(0 :: int) \<le> (0 :: int)"
  and "(0 :: int) \<le> int (length board)"
  and "solution board (0 :: int)"
  sorry
end

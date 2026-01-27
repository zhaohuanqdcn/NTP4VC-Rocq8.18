theory vstte10_queens_NQueens_count_bt_queensqtvc
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
theorem count_bt_queens'vc:
  fixes pos :: "int"
  fixes board :: "int list"
  assumes fact0: "(0 :: int) \<le> pos"
  assumes fact1: "pos \<le> int (length board)"
  assumes fact2: "solution board pos"
  shows "if pos = int (length board) then eq_board board board pos else let o1 :: int = int (length board) - (1 :: int) in ((0 :: int) \<le> o1 + (1 :: int) \<longrightarrow> eq_board board board pos \<and> (\<forall>(s :: int) (board1 :: int list). length board1 = length board \<longrightarrow> (\<forall>(i :: int). ((0 :: int) \<le> i \<and> i \<le> o1) \<and> eq_board board1 board pos \<longrightarrow> ((0 :: int) \<le> pos \<and> pos < int (length board1)) \<and> (length (board1[nat pos := i]) = length board1 \<longrightarrow> nth (board1[nat pos := i]) o nat = (nth board1 o nat)(pos := i) \<longrightarrow> ((0 :: int) \<le> pos \<and> pos < int (length (board1[nat pos := i]))) \<and> (if is_consistent (board1[nat pos := i]) pos then let o2 :: int = pos + (1 :: int) in (((0 :: int) \<le> int (length board) - pos \<and> int (length board) - o2 < int (length board) - pos) \<and> length (board1[nat pos := i]) = length board \<and> ((0 :: int) \<le> o2 \<and> o2 \<le> int (length board)) \<and> solution (board1[nat pos := i]) o2) \<and> (\<forall>(board2 :: int list). length board2 = length (board1[nat pos := i]) \<longrightarrow> (\<forall>(o3 :: int). eq_board board2 (board1[nat pos := i]) o2 \<longrightarrow> eq_board board2 board pos)) else eq_board (board1[nat pos := i]) board pos))))) \<and> (o1 + (1 :: int) < (0 :: int) \<longrightarrow> eq_board board board pos)"
  sorry
end

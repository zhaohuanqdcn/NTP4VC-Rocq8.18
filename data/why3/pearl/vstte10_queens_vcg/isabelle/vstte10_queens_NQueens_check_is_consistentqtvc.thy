theory vstte10_queens_NQueens_check_is_consistentqtvc
  imports "NTP4Verif.NTP4Verif"
begin
definition eq_board :: "int list \<Rightarrow> int list \<Rightarrow> int \<Rightarrow> _"
  where "eq_board b1 b2 pos \<longleftrightarrow> (\<forall>(q :: int). (0 :: int) \<le> q \<and> q < pos \<longrightarrow> b1 ! nat q = b2 ! nat q)" for b1 b2 pos
definition consistent_row :: "int list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "consistent_row board pos q \<longleftrightarrow> \<not>board ! nat q = board ! nat pos \<and> \<not>board ! nat q - board ! nat pos = pos - q \<and> \<not>board ! nat pos - board ! nat q = pos - q" for board pos q
definition is_consistent :: "int list \<Rightarrow> int \<Rightarrow> _"
  where "is_consistent board pos \<longleftrightarrow> (\<forall>(q :: int). (0 :: int) \<le> q \<and> q < pos \<longrightarrow> consistent_row board pos q)" for board pos
theorem check_is_consistent'vc:
  fixes pos :: "int"
  fixes board :: "int list"
  assumes fact0: "(0 :: int) \<le> pos"
  assumes fact1: "pos < int (length board)"
  shows "let o1 :: int = pos - (1 :: int) in ((0 :: int) \<le> o1 + (1 :: int) \<longrightarrow> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < (0 :: int) \<longrightarrow> consistent_row board pos j) \<and> (\<forall>(q :: int). ((0 :: int) \<le> q \<and> q \<le> o1) \<and> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < q \<longrightarrow> consistent_row board pos j) \<longrightarrow> ((0 :: int) \<le> q \<and> q < int (length board)) \<and> (let bq :: int = board ! nat q in ((0 :: int) \<le> pos \<and> pos < int (length board)) \<and> (let bpos :: int = board ! nat pos in if bq = bpos then \<not>is_consistent board pos else if bq - bpos = pos - q then \<not>is_consistent board pos else if bpos - bq = pos - q then \<not>is_consistent board pos else \<forall>(j :: int). (0 :: int) \<le> j \<and> j < q + (1 :: int) \<longrightarrow> consistent_row board pos j))) \<and> ((\<forall>(j :: int). (0 :: int) \<le> j \<and> j < o1 + (1 :: int) \<longrightarrow> consistent_row board pos j) \<longrightarrow> is_consistent board pos)) \<and> (o1 + (1 :: int) < (0 :: int) \<longrightarrow> is_consistent board pos)"
  sorry
end

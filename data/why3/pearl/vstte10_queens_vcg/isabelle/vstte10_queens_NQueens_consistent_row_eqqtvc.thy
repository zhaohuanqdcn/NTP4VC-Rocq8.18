theory vstte10_queens_NQueens_consistent_row_eqqtvc
  imports "NTP4Verif.NTP4Verif"
begin
definition eq_board :: "int list \<Rightarrow> int list \<Rightarrow> int \<Rightarrow> _"
  where "eq_board b1 b2 pos \<longleftrightarrow> (\<forall>(q :: int). (0 :: int) \<le> q \<and> q < pos \<longrightarrow> b1 ! nat q = b2 ! nat q)" for b1 b2 pos
definition consistent_row :: "int list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "consistent_row board pos q \<longleftrightarrow> \<not>board ! nat q = board ! nat pos \<and> \<not>board ! nat q - board ! nat pos = pos - q \<and> \<not>board ! nat pos - board ! nat q = pos - q" for board pos q
theorem consistent_row_eq'vc:
  fixes b1 :: "int list"
  fixes b2 :: "int list"
  fixes pos :: "int"
  fixes q :: "int"
  assumes fact0: "eq_board b1 b2 (pos + (1 :: int))"
  assumes fact1: "(0 :: int) \<le> q"
  assumes fact2: "q < pos"
  assumes fact3: "consistent_row b1 pos q"
  shows "consistent_row b2 pos q"
  sorry
end

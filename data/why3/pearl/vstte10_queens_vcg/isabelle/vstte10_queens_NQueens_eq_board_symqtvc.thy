theory vstte10_queens_NQueens_eq_board_symqtvc
  imports "NTP4Verif.NTP4Verif"
begin
definition eq_board :: "int list \<Rightarrow> int list \<Rightarrow> int \<Rightarrow> _"
  where "eq_board b1 b2 pos \<longleftrightarrow> (\<forall>(q :: int). (0 :: int) \<le> q \<and> q < pos \<longrightarrow> b1 ! nat q = b2 ! nat q)" for b1 b2 pos
theorem eq_board_sym'vc:
  fixes b1 :: "int list"
  fixes b2 :: "int list"
  fixes pos :: "int"
  assumes fact0: "eq_board b1 b2 pos"
  shows "eq_board b2 b1 pos"
  sorry
end

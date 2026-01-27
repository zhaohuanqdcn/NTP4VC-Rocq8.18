theory vstte10_queens_NQueens_eq_board_setqtvc
  imports "NTP4Verif.NTP4Verif"
begin
definition eq_board :: "int list \<Rightarrow> int list \<Rightarrow> int \<Rightarrow> _"
  where "eq_board b1 b2 pos \<longleftrightarrow> (\<forall>(q :: int). (0 :: int) \<le> q \<and> q < pos \<longrightarrow> b1 ! nat q = b2 ! nat q)" for b1 b2 pos
theorem eq_board_set'vc:
  fixes pos :: "int"
  fixes q :: "int"
  fixes b :: "int list"
  fixes i :: "int"
  assumes fact0: "pos \<le> q"
  shows "eq_board b (b[nat q := i]) pos"
  sorry
end

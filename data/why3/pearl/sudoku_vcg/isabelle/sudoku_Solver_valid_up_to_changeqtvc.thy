theory sudoku_Solver_valid_up_to_changeqtvc
  imports "NTP4Verif.NTP4Verif" "./sudoku_Grid"
begin
definition valid_chunk_up_to :: "(int \<Rightarrow> int) \<Rightarrow> int \<Rightarrow> int list \<Rightarrow> int list \<Rightarrow> int \<Rightarrow> _"
  where "valid_chunk_up_to g i start offsets off \<longleftrightarrow> (let s :: int = start ! nat i in \<forall>(o1 :: int) (o2 :: int). ((0 :: int) \<le> o1 \<and> o1 < off) \<and> ((0 :: int) \<le> o2 \<and> o2 < off) \<and> \<not>o1 = o2 \<longrightarrow> (let i1 :: int = s + offsets ! nat o1; i2 :: int = s + offsets ! nat o2 in ((1 :: int) \<le> g i1 \<and> g i1 \<le> (9 :: int)) \<and> (1 :: int) \<le> g i2 \<and> g i2 \<le> (9 :: int) \<longrightarrow> \<not>g i1 = g i2))" for g i start offsets off
definition valid_up_to :: "sudoku_chunks \<Rightarrow> (int \<Rightarrow> int) \<Rightarrow> int \<Rightarrow> _"
  where "valid_up_to s g i \<longleftrightarrow> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < i \<longrightarrow> valid_column s g j \<and> valid_row s g j \<and> valid_square s g j)" for s g i
definition full_up_to :: "(int \<Rightarrow> int) \<Rightarrow> int \<Rightarrow> _"
  where "full_up_to g i \<longleftrightarrow> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < i \<longrightarrow> (1 :: int) \<le> g j \<and> g j \<le> (9 :: int))" for g i
theorem valid_up_to_change'vc:
  fixes s :: "sudoku_chunks"
  fixes i :: "int"
  fixes g :: "int \<Rightarrow> int"
  fixes x :: "int"
  assumes fact0: "well_formed_sudoku s"
  assumes fact1: "is_index i"
  assumes fact2: "valid_up_to s g i"
  assumes fact3: "(1 :: int) \<le> x"
  assumes fact4: "x \<le> (9 :: int)"
  assumes fact5: "valid_column s (g(i := x)) i"
  assumes fact6: "valid_row s (g(i := x)) i"
  assumes fact7: "valid_square s (g(i := x)) i"
  shows "valid_up_to s (g(i := x)) (i + (1 :: int))"
  sorry
end

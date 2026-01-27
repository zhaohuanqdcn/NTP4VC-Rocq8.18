theory sudoku_Solver_solveqtvc
  imports "NTP4Verif.NTP4Verif" "./sudoku_Grid"
begin
definition valid_chunk_up_to :: "(int \<Rightarrow> int) \<Rightarrow> int \<Rightarrow> int list \<Rightarrow> int list \<Rightarrow> int \<Rightarrow> _"
  where "valid_chunk_up_to g i start offsets off \<longleftrightarrow> (let s :: int = start ! nat i in \<forall>(o1 :: int) (o2 :: int). ((0 :: int) \<le> o1 \<and> o1 < off) \<and> ((0 :: int) \<le> o2 \<and> o2 < off) \<and> \<not>o1 = o2 \<longrightarrow> (let i1 :: int = s + offsets ! nat o1; i2 :: int = s + offsets ! nat o2 in ((1 :: int) \<le> g i1 \<and> g i1 \<le> (9 :: int)) \<and> (1 :: int) \<le> g i2 \<and> g i2 \<le> (9 :: int) \<longrightarrow> \<not>g i1 = g i2))" for g i start offsets off
definition valid_up_to :: "sudoku_chunks \<Rightarrow> (int \<Rightarrow> int) \<Rightarrow> int \<Rightarrow> _"
  where "valid_up_to s g i \<longleftrightarrow> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < i \<longrightarrow> valid_column s g j \<and> valid_row s g j \<and> valid_square s g j)" for s g i
definition full_up_to :: "(int \<Rightarrow> int) \<Rightarrow> int \<Rightarrow> _"
  where "full_up_to g i \<longleftrightarrow> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < i \<longrightarrow> (1 :: int) \<le> g j \<and> g j \<le> (9 :: int))" for g i
theorem solve'vc:
  fixes s :: "sudoku_chunks"
  fixes g :: "int list"
  assumes fact0: "well_formed_sudoku s"
  assumes fact1: "int (length g) = (81 :: int)"
  assumes fact2: "valid_values (nth g o nat)"
  shows "well_formed_sudoku s"
  and "int (length g) = (81 :: int)"
  and "valid_values (nth g o nat)"
  and "(0 :: int) \<le> (0 :: int)"
  and "(0 :: int) \<le> (81 :: int)"
  and "valid_up_to s (nth g o nat) (0 :: int)"
  and "full_up_to (nth g o nat) (0 :: int)"
  and "\<forall>(g1 :: int list). length g1 = length g \<longrightarrow> grid_eq_sub (nth g o nat) (nth g1 o nat) (0 :: int) (81 :: int) \<and> (\<forall>(h :: int \<Rightarrow> int). included (nth g1 o nat) h \<and> full h \<longrightarrow> \<not>valid s h) \<longrightarrow> (\<forall>(h :: int \<Rightarrow> int). included (nth g1 o nat) h \<and> full h \<longrightarrow> \<not>valid s h)"
  sorry
end

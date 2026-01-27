theory sudoku_Solver_check_validqtvc
  imports "NTP4Verif.NTP4Verif" "./sudoku_Grid"
begin
definition valid_chunk_up_to :: "(int \<Rightarrow> int) \<Rightarrow> int \<Rightarrow> int list \<Rightarrow> int list \<Rightarrow> int \<Rightarrow> _"
  where "valid_chunk_up_to g i start offsets off \<longleftrightarrow> (let s :: int = start ! nat i in \<forall>(o1 :: int) (o2 :: int). ((0 :: int) \<le> o1 \<and> o1 < off) \<and> ((0 :: int) \<le> o2 \<and> o2 < off) \<and> \<not>o1 = o2 \<longrightarrow> (let i1 :: int = s + offsets ! nat o1; i2 :: int = s + offsets ! nat o2 in ((1 :: int) \<le> g i1 \<and> g i1 \<le> (9 :: int)) \<and> (1 :: int) \<le> g i2 \<and> g i2 \<le> (9 :: int) \<longrightarrow> \<not>g i1 = g i2))" for g i start offsets off
definition valid_up_to :: "sudoku_chunks \<Rightarrow> (int \<Rightarrow> int) \<Rightarrow> int \<Rightarrow> _"
  where "valid_up_to s g i \<longleftrightarrow> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < i \<longrightarrow> valid_column s g j \<and> valid_row s g j \<and> valid_square s g j)" for s g i
theorem check_valid'vc:
  fixes s :: "sudoku_chunks"
  fixes g :: "int list"
  assumes fact0: "well_formed_sudoku s"
  assumes fact1: "int (length g) = (81 :: int)"
  assumes fact2: "valid_values (nth g o nat)"
  shows "(0 :: int) \<le> (80 :: int) + (1 :: int) \<longrightarrow> valid_up_to s (nth g o nat) (0 :: int) \<and> (\<forall>(i :: int). ((0 :: int) \<le> i \<and> i \<le> (80 :: int)) \<and> valid_up_to s (nth g o nat) i \<longrightarrow> (let o1 :: int list = column_offsets s; o2 :: int list = column_start s in (int (length g) = (81 :: int) \<and> valid_values (nth g o nat) \<and> is_index i \<and> chunk_valid_indexes o2 o1) \<and> (valid_chunk (nth g o nat) i o2 o1 \<longrightarrow> (let o3 :: int list = row_offsets s; o4 :: int list = row_start s in (int (length g) = (81 :: int) \<and> valid_values (nth g o nat) \<and> is_index i \<and> chunk_valid_indexes o4 o3) \<and> (valid_chunk (nth g o nat) i o4 o3 \<longrightarrow> (let o5 :: int list = square_offsets s; o6 :: int list = square_start s in (int (length g) = (81 :: int) \<and> valid_values (nth g o nat) \<and> is_index i \<and> chunk_valid_indexes o6 o5) \<and> (valid_chunk (nth g o nat) i o6 o5 \<longrightarrow> valid_up_to s (nth g o nat) (i + (1 :: int))) \<and> (\<not>valid_chunk (nth g o nat) i o6 o5 \<longrightarrow> \<not>valid s (nth g o nat)))) \<and> (\<not>valid_chunk (nth g o nat) i o4 o3 \<longrightarrow> \<not>valid s (nth g o nat)))) \<and> (\<not>valid_chunk (nth g o nat) i o2 o1 \<longrightarrow> \<not>valid s (nth g o nat)))) \<and> (valid_up_to s (nth g o nat) ((80 :: int) + (1 :: int)) \<longrightarrow> valid s (nth g o nat))"
  and "(80 :: int) + (1 :: int) < (0 :: int) \<longrightarrow> valid s (nth g o nat)"
  sorry
end

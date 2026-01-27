theory sudoku_Grid_subset_valid_chunkqtvc
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  grid
definition is_index :: "int \<Rightarrow> _"
  where "is_index i \<longleftrightarrow> (0 :: int) \<le> i \<and> i < (81 :: int)" for i
definition valid_values :: "(int \<Rightarrow> int) \<Rightarrow> _"
  where "valid_values g \<longleftrightarrow> (\<forall>(i :: int). is_index i \<longrightarrow> (0 :: int) \<le> g i \<and> g i \<le> (9 :: int))" for g
definition grid_eq_sub :: "(int \<Rightarrow> int) \<Rightarrow> (int \<Rightarrow> int) \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "grid_eq_sub g1 g2 a b \<longleftrightarrow> (\<forall>(j :: int). a \<le> j \<and> j < b \<longrightarrow> g1 j = g2 j)" for g1 g2 a b
datatype  sudoku_chunks = sudoku_chunks'mk (column_start: "int list") (column_offsets: "int list") (row_start: "int list") (row_offsets: "int list") (square_start: "int list") (square_offsets: "int list")
definition chunk_valid_indexes :: "int list \<Rightarrow> int list \<Rightarrow> _"
  where "chunk_valid_indexes start offsets \<longleftrightarrow> int (length start) = (81 :: int) \<and> int (length offsets) = (9 :: int) \<and> (\<forall>(i :: int) (o1 :: int). is_index i \<and> (0 :: int) \<le> o1 \<and> o1 < (9 :: int) \<longrightarrow> is_index (start ! nat i + offsets ! nat o1))" for start offsets
definition disjoint_chunks :: "int list \<Rightarrow> int list \<Rightarrow> _"
  where "disjoint_chunks start offsets \<longleftrightarrow> int (length start) = (81 :: int) \<and> int (length offsets) = (9 :: int) \<and> (\<forall>(i1 :: int) (i2 :: int) (o1 :: int). is_index i1 \<and> is_index i2 \<and> (0 :: int) \<le> o1 \<and> o1 < (9 :: int) \<longrightarrow> (let s2 :: int = start ! nat i2 in \<not>start ! nat i1 = s2 \<longrightarrow> \<not>i1 = s2 + offsets ! nat o1))" for start offsets
definition well_formed_sudoku :: "sudoku_chunks \<Rightarrow> _"
  where "well_formed_sudoku s \<longleftrightarrow> chunk_valid_indexes (column_start s) (column_offsets s) \<and> chunk_valid_indexes (row_start s) (row_offsets s) \<and> chunk_valid_indexes (square_start s) (square_offsets s) \<and> disjoint_chunks (column_start s) (column_offsets s) \<and> disjoint_chunks (row_start s) (row_offsets s) \<and> disjoint_chunks (square_start s) (square_offsets s)" for s
definition valid_chunk :: "(int \<Rightarrow> int) \<Rightarrow> int \<Rightarrow> int list \<Rightarrow> int list \<Rightarrow> _"
  where "valid_chunk g i start offsets \<longleftrightarrow> (let s :: int = start ! nat i in \<forall>(o1 :: int) (o2 :: int). ((0 :: int) \<le> o1 \<and> o1 < (9 :: int)) \<and> ((0 :: int) \<le> o2 \<and> o2 < (9 :: int)) \<and> \<not>o1 = o2 \<longrightarrow> (let i1 :: int = s + offsets ! nat o1; i2 :: int = s + offsets ! nat o2 in ((1 :: int) \<le> g i1 \<and> g i1 \<le> (9 :: int)) \<and> (1 :: int) \<le> g i2 \<and> g i2 \<le> (9 :: int) \<longrightarrow> \<not>g i1 = g i2))" for g i start offsets
definition valid_column :: "sudoku_chunks \<Rightarrow> (int \<Rightarrow> int) \<Rightarrow> int \<Rightarrow> _"
  where "valid_column s g i \<longleftrightarrow> valid_chunk g i (column_start s) (column_offsets s)" for s g i
definition valid_row :: "sudoku_chunks \<Rightarrow> (int \<Rightarrow> int) \<Rightarrow> int \<Rightarrow> _"
  where "valid_row s g i \<longleftrightarrow> valid_chunk g i (row_start s) (row_offsets s)" for s g i
definition valid_square :: "sudoku_chunks \<Rightarrow> (int \<Rightarrow> int) \<Rightarrow> int \<Rightarrow> _"
  where "valid_square s g i \<longleftrightarrow> valid_chunk g i (square_start s) (square_offsets s)" for s g i
definition valid :: "sudoku_chunks \<Rightarrow> (int \<Rightarrow> int) \<Rightarrow> _"
  where "valid s g \<longleftrightarrow> (\<forall>(i :: int). is_index i \<longrightarrow> valid_column s g i \<and> valid_row s g i \<and> valid_square s g i)" for s g
definition full :: "(int \<Rightarrow> int) \<Rightarrow> _"
  where "full g \<longleftrightarrow> (\<forall>(i :: int). is_index i \<longrightarrow> (1 :: int) \<le> g i \<and> g i \<le> (9 :: int))" for g
definition included :: "(int \<Rightarrow> int) \<Rightarrow> (int \<Rightarrow> int) \<Rightarrow> _"
  where "included g1 g2 \<longleftrightarrow> (\<forall>(i :: int). is_index i \<and> (1 :: int) \<le> g1 i \<and> g1 i \<le> (9 :: int) \<longrightarrow> g2 i = g1 i)" for g1 g2
theorem subset_valid_chunk'vc:
  fixes g :: "int \<Rightarrow> int"
  fixes h :: "int \<Rightarrow> int"
  fixes i :: "int"
  fixes s :: "int list"
  fixes o1 :: "int list"
  assumes fact0: "included g h"
  assumes fact1: "is_index i"
  assumes fact2: "chunk_valid_indexes s o1"
  assumes fact3: "valid_chunk h i s o1"
  shows "valid_chunk g i s o1"
  sorry
end

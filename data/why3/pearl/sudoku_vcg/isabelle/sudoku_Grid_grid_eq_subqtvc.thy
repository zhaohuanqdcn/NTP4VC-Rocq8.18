theory sudoku_Grid_grid_eq_subqtvc
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  grid
definition is_index :: "int \<Rightarrow> _"
  where "is_index i \<longleftrightarrow> (0 :: int) \<le> i \<and> i < (81 :: int)" for i
definition valid_values :: "(int \<Rightarrow> int) \<Rightarrow> _"
  where "valid_values g \<longleftrightarrow> (\<forall>(i :: int). is_index i \<longrightarrow> (0 :: int) \<le> g i \<and> g i \<le> (9 :: int))" for g
definition grid_eq_sub :: "(int \<Rightarrow> int) \<Rightarrow> (int \<Rightarrow> int) \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "grid_eq_sub g1 g2 a b \<longleftrightarrow> (\<forall>(j :: int). a \<le> j \<and> j < b \<longrightarrow> g1 j = g2 j)" for g1 g2 a b
theorem grid_eq_sub'vc:
  fixes a :: "int"
  fixes b :: "int"
  fixes g1 :: "int \<Rightarrow> int"
  fixes g2 :: "int \<Rightarrow> int"
  assumes fact0: "(0 :: int) \<le> a"
  assumes fact1: "a \<le> (81 :: int)"
  assumes fact2: "(0 :: int) \<le> b"
  assumes fact3: "b \<le> (81 :: int)"
  assumes fact4: "grid_eq_sub g1 g2 (0 :: int) (81 :: int)"
  shows "grid_eq_sub g1 g2 a b"
  sorry
end

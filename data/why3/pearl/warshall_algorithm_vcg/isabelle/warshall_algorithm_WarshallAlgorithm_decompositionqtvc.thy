theory warshall_algorithm_WarshallAlgorithm_decompositionqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.matrix_Matrix"
begin
inductive path :: "bool matrix \<Rightarrow> int \<Rightarrow> int \<Rightarrow> int \<Rightarrow> bool" where
   Path_empty: "elts m i j = True \<Longrightarrow> path m i j k" for m :: "bool matrix" and i :: "int" and j :: "int" and k :: "int"
 | Path_cons: "(0 :: int) \<le> x \<Longrightarrow> x < k \<Longrightarrow> path m i x k \<Longrightarrow> path m x j k \<Longrightarrow> path m i j k" for x :: "int" and k :: "int" and m :: "bool matrix" and i :: "int" and j :: "int"
theorem decomposition'vc:
  fixes k :: "int"
  fixes m :: "bool matrix"
  fixes i :: "int"
  fixes j :: "int"
  assumes fact0: "(0 :: int) \<le> k"
  assumes fact1: "path m i j (k + (1 :: int))"
  shows "path m i j k \<or> path m i k k \<and> path m k j k"
  sorry
end

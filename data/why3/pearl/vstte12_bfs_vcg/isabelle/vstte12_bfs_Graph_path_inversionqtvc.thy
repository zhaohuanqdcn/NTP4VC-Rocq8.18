theory vstte12_bfs_Graph_path_inversionqtvc
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  vertex
consts eq :: "vertex \<Rightarrow> vertex \<Rightarrow> bool"
axiomatization where eq'spec:   "eq x y \<longleftrightarrow> x = y"
  for x :: "vertex"
  and y :: "vertex"
consts succ :: "vertex \<Rightarrow> vertex fset"
inductive path :: "vertex \<Rightarrow> vertex \<Rightarrow> int \<Rightarrow> bool" where
   path_empty: "path v v (0 :: int)" for v :: "vertex"
 | path_succ: "path v1 v2 n \<Longrightarrow> v3 |\<in>| succ v2 \<Longrightarrow> path v1 v3 (n + (1 :: int))" for v1 :: "vertex" and v2 :: "vertex" and n :: "int" and v3 :: "vertex"
theorem path_inversion'vc:
  fixes n :: "int"
  fixes v1 :: "vertex"
  fixes v3 :: "vertex"
  assumes fact0: "(0 :: int) \<le> n"
  assumes fact1: "path v1 v3 (n + (1 :: int))"
  shows "\<exists>(v2 :: vertex). path v1 v2 n \<and> v3 |\<in>| succ v2"
  sorry
end

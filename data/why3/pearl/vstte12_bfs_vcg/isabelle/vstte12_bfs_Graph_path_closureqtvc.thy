theory vstte12_bfs_Graph_path_closureqtvc
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
theorem path_closure'vc:
  fixes s :: "vertex fset"
  fixes v1 :: "vertex"
  fixes v2 :: "vertex"
  fixes n :: "int"
  assumes fact0: "\<forall>(x :: vertex). x |\<in>| s \<longrightarrow> (\<forall>(y :: vertex). y |\<in>| succ x \<longrightarrow> y |\<in>| s)"
  assumes fact1: "path v1 v2 n"
  assumes fact2: "v1 |\<in>| s"
  shows "v2 |\<in>| s"
  sorry
end

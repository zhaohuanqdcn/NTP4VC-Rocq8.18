theory vstte12_bfs_Graph
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
definition shortest_path :: "vertex \<Rightarrow> vertex \<Rightarrow> int \<Rightarrow> _"
  where "shortest_path v1 v2 n \<longleftrightarrow> path v1 v2 n \<and> (\<forall>(m :: int). m < n \<longrightarrow> \<not>path v1 v2 m)" for v1 v2 n
end

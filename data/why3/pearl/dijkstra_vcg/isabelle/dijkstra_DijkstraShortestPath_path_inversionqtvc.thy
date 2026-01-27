theory dijkstra_DijkstraShortestPath_path_inversionqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.map_Const"
begin
typedecl  vertex
typedecl  set
consts to_fset :: "set \<Rightarrow> vertex fset"
consts choose1 :: "set \<Rightarrow> vertex"
axiomatization where choose'spec:   "choose1 s |\<in>| to_fset s"
 if "\<not>to_fset s = fempty"
  for s :: "set"
typedecl 'a t
consts contents :: "'a t \<Rightarrow> vertex \<Rightarrow> 'a"
consts create :: "'a \<Rightarrow> 'a t"
axiomatization where create'spec:   "contents (create x) = (const :: 'a \<Rightarrow> vertex \<Rightarrow> 'a) x"
  for x :: "'a"
consts mixfix_lbrb :: "'a t \<Rightarrow> vertex \<Rightarrow> 'a"
axiomatization where mixfix_lbrb'spec:   "mixfix_lbrb m k = contents m k"
  for m :: "'a t"
  and k :: "vertex"
consts mixfix_lblsmnrb :: "'a t \<Rightarrow> vertex \<Rightarrow> 'a \<Rightarrow> 'a t"
axiomatization where mixfix_lblsmnrb'spec:   "contents (mixfix_lblsmnrb m k v) = (contents m)(k := v)"
  for m :: "'a t"
  and k :: "vertex"
  and v :: "'a"
consts v :: "vertex fset"
consts g_succ :: "vertex \<Rightarrow> vertex fset"
axiomatization where g_succ'spec:   "g_succ x_x |\<subseteq>| v"
  for x_x :: "vertex"
consts weight :: "vertex \<Rightarrow> vertex \<Rightarrow> int"
axiomatization where weight'spec:   "(0 :: int) \<le> weight x x_1"
  for x :: "vertex"
  and x_1 :: "vertex"
definition min :: "vertex \<Rightarrow> set \<Rightarrow> int t \<Rightarrow> _"
  where "min m q d \<longleftrightarrow> m |\<in>| to_fset q \<and> (\<forall>(x :: vertex). x |\<in>| to_fset q \<longrightarrow> mixfix_lbrb d m \<le> mixfix_lbrb d x)" for m q d
inductive path :: "vertex \<Rightarrow> vertex \<Rightarrow> int \<Rightarrow> bool" where
   Path_nil: "path x x (0 :: int)" for x :: "vertex"
 | Path_cons: "path x y d \<Longrightarrow> z |\<in>| g_succ y \<Longrightarrow> path x z (d + weight y z)" for x :: "vertex" and y :: "vertex" and d :: "int" and z :: "vertex"
definition shortest_path :: "vertex \<Rightarrow> vertex \<Rightarrow> int \<Rightarrow> _"
  where "shortest_path x y d \<longleftrightarrow> path x y d \<and> (\<forall>(d' :: int). path x y d' \<longrightarrow> d \<le> d')" for x y d
theorem path_inversion'vc:
  fixes src :: "vertex"
  fixes v1 :: "vertex"
  fixes d :: "int"
  assumes fact0: "path src v1 d"
  shows "v1 = src \<and> d = (0 :: int) \<or> (\<exists>(v' :: vertex). path src v' (d - weight v' v1) \<and> v1 |\<in>| g_succ v')"
  sorry
end

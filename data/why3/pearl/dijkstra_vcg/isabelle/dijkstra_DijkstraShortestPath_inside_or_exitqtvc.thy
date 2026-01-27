theory dijkstra_DijkstraShortestPath_inside_or_exitqtvc
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
definition inv_src :: "vertex \<Rightarrow> set \<Rightarrow> set \<Rightarrow> _"
  where "inv_src src s q \<longleftrightarrow> src |\<in>| to_fset s \<or> src |\<in>| to_fset q" for src s q
definition inv :: "vertex \<Rightarrow> set \<Rightarrow> set \<Rightarrow> int t \<Rightarrow> _"
  where "inv src s q d \<longleftrightarrow> inv_src src s q \<and> mixfix_lbrb d src = (0 :: int) \<and> to_fset s |\<subseteq>| v \<and> to_fset q |\<subseteq>| v \<and> (\<forall>(v1 :: vertex). v1 |\<in>| to_fset q \<longrightarrow> \<not>v1 |\<in>| to_fset s) \<and> (\<forall>(v1 :: vertex). v1 |\<in>| to_fset s \<longrightarrow> shortest_path src v1 (mixfix_lbrb d v1)) \<and> (\<forall>(v1 :: vertex). v1 |\<in>| to_fset q \<longrightarrow> path src v1 (mixfix_lbrb d v1))" for src s q d
definition inv_succ :: "vertex \<Rightarrow> set \<Rightarrow> set \<Rightarrow> int t \<Rightarrow> _"
  where "inv_succ x_src s q d \<longleftrightarrow> (\<forall>(x :: vertex). x |\<in>| to_fset s \<longrightarrow> (\<forall>(y :: vertex). y |\<in>| g_succ x \<longrightarrow> (y |\<in>| to_fset s \<or> y |\<in>| to_fset q) \<and> mixfix_lbrb d y \<le> mixfix_lbrb d x + weight x y))" for x_src s q d
definition inv_succ2 :: "vertex \<Rightarrow> set \<Rightarrow> set \<Rightarrow> int t \<Rightarrow> vertex \<Rightarrow> set \<Rightarrow> _"
  where "inv_succ2 x_src s q d u su \<longleftrightarrow> (\<forall>(x :: vertex). x |\<in>| to_fset s \<longrightarrow> (\<forall>(y :: vertex). y |\<in>| g_succ x \<longrightarrow> \<not>x = u \<or> x = u \<and> \<not>y |\<in>| to_fset su \<longrightarrow> (y |\<in>| to_fset s \<or> y |\<in>| to_fset q) \<and> mixfix_lbrb d y \<le> mixfix_lbrb d x + weight x y))" for x_src s q d u su
theorem inside_or_exit'vc:
  fixes src :: "vertex"
  fixes s :: "set"
  fixes v1 :: "vertex"
  fixes d :: "int"
  assumes fact0: "src |\<in>| to_fset s"
  assumes fact1: "path src v1 d"
  shows "v1 |\<in>| to_fset s \<or> (\<exists>(y :: vertex) (z :: vertex) (dy :: int). y |\<in>| to_fset s \<and> \<not>z |\<in>| to_fset s \<and> z |\<in>| g_succ y \<and> path src y dy \<and> dy + weight y z \<le> d)"
  sorry
end

theory bellman_ford_BellmanFord_inv2_pathqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.int_IntInf" "Why3STD.map_Const" "./bellman_ford_Graph"
begin
typedecl  set
consts to_fset :: "set \<Rightarrow> (vertex \<times> vertex) fset"
consts choose1 :: "set \<Rightarrow> vertex \<times> vertex"
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
typedecl  distmap
definition inv1 :: "int_IntInf.t t \<Rightarrow> int \<Rightarrow> (vertex \<times> vertex) fset \<Rightarrow> _"
  where "inv1 m pass via \<longleftrightarrow> (\<forall>(v :: vertex). v |\<in>| vertices \<longrightarrow> (case mixfix_lbrb m v of Finite n \<Rightarrow> (\<exists>(l :: vertex list). path s l v \<and> path_weight l v = n) \<and> (\<forall>(l :: vertex list). path s l v \<longrightarrow> int (length l) < pass \<longrightarrow> n \<le> path_weight l v) \<and> (\<forall>(u :: vertex) (l :: vertex list). path s l u \<longrightarrow> int (length l) < pass \<longrightarrow> (u, v) |\<in>| via \<longrightarrow> n \<le> path_weight l u + weight u v) | Infinite \<Rightarrow> (\<forall>(l :: vertex list). path s l v \<longrightarrow> pass \<le> int (length l)) \<and> (\<forall>(u :: vertex). (u, v) |\<in>| via \<longrightarrow> (\<forall>(lu :: vertex list). path s lu u \<longrightarrow> pass \<le> int (length lu)))))" for m pass via
definition inv2 :: "int_IntInf.t t \<Rightarrow> (vertex \<times> vertex) fset \<Rightarrow> _"
  where "inv2 m via \<longleftrightarrow> (\<forall>(u :: vertex) (v :: vertex). (u, v) |\<in>| via \<longrightarrow> le (mixfix_lbrb m v) (add (mixfix_lbrb m u) (Finite (weight u v))))" for m via
theorem inv2_path'vc:
  fixes m :: "int_IntInf.t t"
  fixes y :: "vertex"
  fixes l :: "vertex list"
  fixes z :: "vertex"
  assumes fact0: "inv2 m edges"
  assumes fact1: "path y l z"
  shows "le (mixfix_lbrb m z) (add (mixfix_lbrb m y) (Finite (path_weight l z)))"
  sorry
end

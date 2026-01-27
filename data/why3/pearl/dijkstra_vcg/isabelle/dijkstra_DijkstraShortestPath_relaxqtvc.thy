theory dijkstra_DijkstraShortestPath_relaxqtvc
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
theorem relax'vc:
  fixes v1 :: "vertex"
  fixes visited :: "set"
  fixes u :: "vertex"
  fixes d :: "int t"
  fixes q :: "set"
  shows "if \<not>v1 |\<in>| to_fset visited then let o1 :: int = weight u v1 in (0 :: int) \<le> o1 \<longrightarrow> (let o2 :: int = mixfix_lbrb d u in o2 = contents d u \<longrightarrow> (let x :: int = o2 + o1 in if v1 |\<in>| to_fset q then let o3 :: int = mixfix_lbrb d v1 in o3 = contents d v1 \<longrightarrow> (if x < o3 then v1 |\<in>| to_fset visited \<and> mixfix_lblsmnrb d v1 x = d \<or> v1 |\<in>| to_fset q \<and> mixfix_lbrb (mixfix_lblsmnrb d v1 x) v1 \<le> mixfix_lbrb (mixfix_lblsmnrb d v1 x) u + weight u v1 \<and> mixfix_lblsmnrb d v1 x = d \<or> v1 |\<in>| to_fset q \<and> mixfix_lbrb d u + weight u v1 < mixfix_lbrb d v1 \<and> mixfix_lblsmnrb d v1 x = mixfix_lblsmnrb d v1 (mixfix_lbrb d u + weight u v1) \<or> \<not>v1 |\<in>| to_fset visited \<and> \<not>v1 |\<in>| to_fset q \<and> to_fset q = finsert v1 (to_fset q) \<and> mixfix_lblsmnrb d v1 x = mixfix_lblsmnrb d v1 (mixfix_lbrb d u + weight u v1) else v1 |\<in>| to_fset visited \<or> v1 |\<in>| to_fset q \<and> mixfix_lbrb d v1 \<le> mixfix_lbrb d u + weight u v1 \<or> v1 |\<in>| to_fset q \<and> mixfix_lbrb d u + weight u v1 < mixfix_lbrb d v1 \<and> d = mixfix_lblsmnrb d v1 (mixfix_lbrb d u + weight u v1) \<or> \<not>v1 |\<in>| to_fset visited \<and> \<not>v1 |\<in>| to_fset q \<and> to_fset q = finsert v1 (to_fset q) \<and> d = mixfix_lblsmnrb d v1 (mixfix_lbrb d u + weight u v1)) else \<forall>(q1 :: set). to_fset q1 = finsert v1 (to_fset q) \<and> (if v1 |\<in>| to_fset q then fcard (to_fset q1) = fcard (to_fset q) else int (fcard (to_fset q1)) = int (fcard (to_fset q)) + (1 :: int)) \<longrightarrow> v1 |\<in>| to_fset visited \<and> q1 = q \<and> mixfix_lblsmnrb d v1 x = d \<or> v1 |\<in>| to_fset q1 \<and> mixfix_lbrb (mixfix_lblsmnrb d v1 x) v1 \<le> mixfix_lbrb (mixfix_lblsmnrb d v1 x) u + weight u v1 \<and> q1 = q \<and> mixfix_lblsmnrb d v1 x = d \<or> v1 |\<in>| to_fset q1 \<and> mixfix_lbrb d u + weight u v1 < mixfix_lbrb d v1 \<and> q1 = q \<and> mixfix_lblsmnrb d v1 x = mixfix_lblsmnrb d v1 (mixfix_lbrb d u + weight u v1) \<or> \<not>v1 |\<in>| to_fset visited \<and> \<not>v1 |\<in>| to_fset q \<and> to_fset q1 = finsert v1 (to_fset q) \<and> mixfix_lblsmnrb d v1 x = mixfix_lblsmnrb d v1 (mixfix_lbrb d u + weight u v1))) else v1 |\<in>| to_fset visited \<or> v1 |\<in>| to_fset q \<and> mixfix_lbrb d v1 \<le> mixfix_lbrb d u + weight u v1 \<or> v1 |\<in>| to_fset q \<and> mixfix_lbrb d u + weight u v1 < mixfix_lbrb d v1 \<and> d = mixfix_lblsmnrb d v1 (mixfix_lbrb d u + weight u v1) \<or> \<not>v1 |\<in>| to_fset visited \<and> \<not>v1 |\<in>| to_fset q \<and> to_fset q = finsert v1 (to_fset q) \<and> d = mixfix_lblsmnrb d v1 (mixfix_lbrb d u + weight u v1)"
  sorry
end

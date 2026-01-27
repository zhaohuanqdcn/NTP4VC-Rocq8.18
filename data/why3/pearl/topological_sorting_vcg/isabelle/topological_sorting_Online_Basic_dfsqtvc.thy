theory topological_sorting_Online_Basic_dfsqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.map_Const" "./topological_sorting_Graph" "./topological_sorting_Online_graph"
begin
typedecl  set
consts to_fset :: "set \<Rightarrow> vertex fset"
consts choose1 :: "set \<Rightarrow> vertex"
axiomatization where choose'spec:   "choose1 s |\<in>| to_fset s"
 if "\<not>to_fset s = fempty"
  for s :: "set"
typedecl  set1
consts to_fset1 :: "set1 \<Rightarrow> vertex fset"
consts mk :: "vertex fset \<Rightarrow> set1"
axiomatization where mk'spec:   "to_fset1 (mk s) = s"
  for s :: "vertex fset"
consts choose2 :: "set1 \<Rightarrow> vertex"
axiomatization where choose'spec1:   "choose2 s |\<in>| to_fset1 s"
 if "\<not>to_fset1 s = fempty"
  for s :: "set1"
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
datatype  t1 = t'mk (graph: "graph") ("values": "int t")
definition inv :: "t1 \<Rightarrow> _"
  where "inv g \<longleftrightarrow> sort (graph g) (contents (values g))" for g
theorem dfs'vc:
  fixes g :: "t1"
  fixes v :: "vertex"
  fixes seen :: "set1"
  fixes min_depth :: "int"
  assumes fact0: "inv g"
  assumes fact1: "v |\<in>| vertices (graph g)"
  assumes fact2: "to_fset1 seen |\<subseteq>| vertices (graph g)"
  assumes fact3: "\<not>v |\<in>| to_fset1 seen"
  shows "let o1 :: int t = values g; o2 :: int = mixfix_lbrb o1 v in o2 = contents o1 v \<longrightarrow> (if o2 < min_depth then \<forall>(p :: set). to_fset p = succs (graph g) v \<longrightarrow> (\<forall>(seen1 :: set1). to_fset1 seen1 = finsert v (to_fset1 seen) \<and> (if v |\<in>| to_fset1 seen then fcard (to_fset1 seen1) = fcard (to_fset1 seen) else int (fcard (to_fset1 seen1)) = int (fcard (to_fset1 seen)) + (1 :: int)) \<longrightarrow> (inv g \<and> (\<forall>(s :: vertex). s |\<in>| succs (graph g) v \<longrightarrow> \<not>s |\<in>| to_fset p \<longrightarrow> min_depth < mixfix_lbrb (values g) s) \<and> to_fset p |\<subseteq>| succs (graph g) v \<and> (\<forall>(x :: vertex). mixfix_lbrb (values g) x \<le> mixfix_lbrb (values g) x)) \<and> (\<forall>(p1 :: set) (g1 :: t1). g1 = t'mk (graph g) (values g1) \<longrightarrow> inv g1 \<and> (\<forall>(s :: vertex). s |\<in>| succs (graph g1) v \<longrightarrow> \<not>s |\<in>| to_fset p1 \<longrightarrow> min_depth < mixfix_lbrb (values g1) s) \<and> to_fset p1 |\<subseteq>| succs (graph g1) v \<and> (\<forall>(x :: vertex). x |\<in>| to_fset1 seen1 \<longrightarrow> mixfix_lbrb (values g1) x = mixfix_lbrb (values g) x) \<and> (\<forall>(x :: vertex). mixfix_lbrb (values g) x \<le> mixfix_lbrb (values g1) x) \<longrightarrow> (if \<not>to_fset p1 = fempty then \<not>to_fset p1 = fempty \<and> (\<forall>(p2 :: set). let u :: vertex = choose1 p1 in u |\<in>| to_fset p1 \<and> to_fset p2 = fset_remove u (to_fset p1) \<longrightarrow> (((0 :: int) \<le> int (fcard (vertices (graph g))) - int (fcard (to_fset1 seen)) \<and> int (fcard (vertices (graph g1))) - int (fcard (to_fset1 seen1)) < int (fcard (vertices (graph g))) - int (fcard (to_fset1 seen))) \<and> inv g1 \<and> u |\<in>| vertices (graph g1) \<and> to_fset1 seen1 |\<subseteq>| vertices (graph g1)) \<and> (\<forall>(g2 :: t1). g2 = t'mk (graph g1) (values g2) \<longrightarrow> min_depth + (1 :: int) \<le> mixfix_lbrb (values g2) u \<and> inv g2 \<and> (\<forall>(x :: vertex). x |\<in>| to_fset1 seen1 \<longrightarrow> mixfix_lbrb (values g2) x = mixfix_lbrb (values g1) x) \<and> (\<forall>(x :: vertex). mixfix_lbrb (values g1) x \<le> mixfix_lbrb (values g2) x) \<longrightarrow> ((0 :: int) \<le> int (fcard (to_fset p1)) \<and> fcard (to_fset p2) < fcard (to_fset p1)) \<and> inv g2 \<and> (\<forall>(s :: vertex). s |\<in>| succs (graph g2) v \<longrightarrow> \<not>s |\<in>| to_fset p2 \<longrightarrow> min_depth < mixfix_lbrb (values g2) s) \<and> to_fset p2 |\<subseteq>| succs (graph g2) v \<and> (\<forall>(x :: vertex). x |\<in>| to_fset1 seen1 \<longrightarrow> mixfix_lbrb (values g2) x = mixfix_lbrb (values g) x) \<and> (\<forall>(x :: vertex). mixfix_lbrb (values g) x \<le> mixfix_lbrb (values g2) x))) else \<forall>(g2 :: t1). g2 = t'mk (graph g1) (values g2) \<longrightarrow> values g2 = mixfix_lblsmnrb (values g1) v min_depth \<longrightarrow> min_depth \<le> mixfix_lbrb (values g2) v \<and> inv g2 \<and> (\<forall>(x :: vertex). x |\<in>| to_fset1 seen \<longrightarrow> mixfix_lbrb (values g2) x = mixfix_lbrb (values g) x) \<and> (\<forall>(x :: vertex). mixfix_lbrb (values g) x \<le> mixfix_lbrb (values g2) x)))) else min_depth \<le> mixfix_lbrb (values g) v \<and> inv g \<and> (\<forall>(x :: vertex). mixfix_lbrb (values g) x \<le> mixfix_lbrb (values g) x))"
  sorry
end

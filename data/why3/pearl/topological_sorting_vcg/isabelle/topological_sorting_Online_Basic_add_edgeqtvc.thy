theory topological_sorting_Online_Basic_add_edgeqtvc
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
theorem add_edge'vc:
  fixes g :: "t1"
  fixes x :: "vertex"
  fixes y :: "vertex"
  fixes seen :: "set1"
  fixes seen1 :: "set1"
  assumes fact0: "inv g"
  assumes fact1: "x |\<in>| vertices (graph g)"
  assumes fact2: "y |\<in>| vertices (graph g)"
  assumes fact3: "to_fset1 seen = fempty"
  assumes fact4: "int (fcard (to_fset1 seen)) = (0 :: int)"
  assumes fact5: "to_fset1 seen1 = finsert x (to_fset1 seen)"
  assumes fact6: "if x |\<in>| to_fset1 seen then fcard (to_fset1 seen1) = fcard (to_fset1 seen) else int (fcard (to_fset1 seen1)) = int (fcard (to_fset1 seen)) + (1 :: int)"
  shows "let o1 :: int t = values g; o2 :: int = mixfix_lbrb o1 x in o2 = contents o1 x \<longrightarrow> (inv g \<and> y |\<in>| vertices (graph g) \<and> to_fset1 seen1 |\<subseteq>| vertices (graph g)) \<and> (\<forall>(g1 :: t1). g1 = t'mk (graph g) (values g1) \<longrightarrow> o2 + (1 :: int) \<le> mixfix_lbrb (values g1) y \<and> inv g1 \<and> (\<forall>(x1 :: vertex). x1 |\<in>| to_fset1 seen1 \<longrightarrow> mixfix_lbrb (values g1) x1 = mixfix_lbrb (values g) x1) \<and> (\<forall>(x1 :: vertex). mixfix_lbrb (values g) x1 \<le> mixfix_lbrb (values g1) x1) \<longrightarrow> (let o3 :: graph = graph g1; o4 :: graph = add_edge o3 x y in (\<forall>(x1 :: vertex). preds o4 x1 = (if x1 = y then finsert x (preds o3 y) else preds o3 x1)) \<and> (\<forall>(x1 :: vertex). succs o4 x1 = (if x1 = x then finsert y (succs o3 x) else succs o3 x1)) \<longrightarrow> (\<forall>(g2 :: t1). graph g2 = o4 \<and> values g2 = values g1 \<longrightarrow> inv g2 \<and> graph g2 = add_edge (graph g) x y)))"
  sorry
end

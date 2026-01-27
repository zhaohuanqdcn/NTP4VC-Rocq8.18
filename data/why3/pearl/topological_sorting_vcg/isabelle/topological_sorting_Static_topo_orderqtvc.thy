theory topological_sorting_Static_topo_orderqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.map_Const" "./topological_sorting_Graph"
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
consts defined_sort :: "int t \<Rightarrow> vertex fset"
axiomatization where defined_sort'spec:   "v |\<in>| defined_sort m \<longleftrightarrow> (0 :: int) \<le> mixfix_lbrb m v"
  for v :: "vertex"
  and m :: "int t"
definition partial_sort :: "graph \<Rightarrow> int t \<Rightarrow> _"
  where "partial_sort g m \<longleftrightarrow> (\<forall>(v :: vertex) (u :: vertex). (u, v) |\<in>| edges g \<longrightarrow> (0 :: int) \<le> mixfix_lbrb m v \<longrightarrow> (0 :: int) \<le> mixfix_lbrb m u \<and> mixfix_lbrb m u < mixfix_lbrb m v)" for g m
definition inv :: "graph \<Rightarrow> int t \<Rightarrow> int \<Rightarrow> _"
  where "inv g m next \<longleftrightarrow> defined_sort m |\<subseteq>| vertices g \<and> (0 :: int) \<le> next \<and> partial_sort g m \<and> (\<forall>(v :: vertex). v |\<in>| defined_sort m \<longrightarrow> mixfix_lbrb m v < next)" for g m "next"
theorem topo_order'vc:
  fixes g :: "graph"
  shows "let values :: int t = create (-(1 :: int)) in contents values = (const :: int \<Rightarrow> vertex \<Rightarrow> int) (-(1 :: int)) \<longrightarrow> (\<forall>(p :: set). to_fset p = vertices g \<longrightarrow> (inv g values (0 :: int) \<and> to_fset p |\<subseteq>| vertices g \<and> vertices g |-| to_fset p |\<subseteq>| defined_sort values) \<and> (\<forall>(p1 :: set) (values1 :: int t) (next :: int). inv g values1 next \<and> to_fset p1 |\<subseteq>| vertices g \<and> vertices g |-| to_fset p1 |\<subseteq>| defined_sort values1 \<longrightarrow> (if \<not>to_fset p1 = fempty then \<not>to_fset p1 = fempty \<and> (\<forall>(p2 :: set). let u :: vertex = choose1 p1 in u |\<in>| to_fset p1 \<and> to_fset p2 = fset_remove u (to_fset p1) \<longrightarrow> (\<forall>(o1 :: set1). to_fset1 o1 = fempty \<and> int (fcard (to_fset1 o1)) = (0 :: int) \<longrightarrow> (inv g values1 next \<and> u |\<in>| vertices g \<and> to_fset1 o1 |\<subseteq>| vertices g) \<and> (\<forall>(values2 :: int t) (next1 :: int). defined_sort values1 |\<subseteq>| defined_sort values2 \<and> ((0 :: int) \<le> mixfix_lbrb values2 u \<and> mixfix_lbrb values2 u \<le> next1) \<and> inv g values2 next1 \<and> (\<forall>(x :: vertex). x |\<in>| to_fset1 o1 \<longrightarrow> mixfix_lbrb values1 x = mixfix_lbrb values2 x) \<longrightarrow> ((0 :: int) \<le> int (fcard (to_fset p1)) \<and> fcard (to_fset p2) < fcard (to_fset p1)) \<and> inv g values2 next1 \<and> to_fset p2 |\<subseteq>| vertices g \<and> vertices g |-| to_fset p2 |\<subseteq>| defined_sort values2))) else sort g (contents values1))))"
  sorry
end

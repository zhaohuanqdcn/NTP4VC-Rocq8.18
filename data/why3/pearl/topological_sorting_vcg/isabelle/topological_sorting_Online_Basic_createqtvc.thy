theory topological_sorting_Online_Basic_createqtvc
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
theorem create'vc:
  fixes g :: "graph"
  assumes fact0: "\<forall>(x :: vertex). preds g x = fempty"
  shows "let o1 :: int t = create (0 :: int) in contents o1 = (const :: int \<Rightarrow> vertex \<Rightarrow> int) (0 :: int) \<longrightarrow> inv (t'mk g o1)"
  sorry
end

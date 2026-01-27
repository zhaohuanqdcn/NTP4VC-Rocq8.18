theory topological_sorting_Graph
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  vertex
typedecl  graph
consts vertices :: "graph \<Rightarrow> vertex fset"
consts edges :: "graph \<Rightarrow> (vertex \<times> vertex) fset"
axiomatization where edges_use_vertices'0:   "x |\<in>| vertices g"
 if "(x, y) |\<in>| edges g"
  for x :: "vertex"
  and y :: "vertex"
  and g :: "graph"
axiomatization where edges_use_vertices'1:   "y |\<in>| vertices g"
 if "(x, y) |\<in>| edges g"
  for x :: "vertex"
  and y :: "vertex"
  and g :: "graph"
consts preds :: "graph \<Rightarrow> vertex \<Rightarrow> vertex fset"
axiomatization where preds_def:   "(u, v) |\<in>| edges g \<longleftrightarrow> u |\<in>| preds g v"
  for u :: "vertex"
  and v :: "vertex"
  and g :: "graph"
consts succs :: "graph \<Rightarrow> vertex \<Rightarrow> vertex fset"
axiomatization where succs_def:   "(u, v) |\<in>| edges g \<longleftrightarrow> v |\<in>| succs g u"
  for u :: "vertex"
  and v :: "vertex"
  and g :: "graph"
typedecl  msort
definition sort :: "graph \<Rightarrow> (vertex \<Rightarrow> int) \<Rightarrow> _"
  where "sort g m \<longleftrightarrow> (\<forall>(v :: vertex) (u :: vertex). (u, v) |\<in>| edges g \<longrightarrow> m u < m v)" for g m
end

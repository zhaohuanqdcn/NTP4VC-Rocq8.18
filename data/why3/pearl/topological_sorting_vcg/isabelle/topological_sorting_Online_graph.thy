theory topological_sorting_Online_graph
  imports "NTP4Verif.NTP4Verif" "./topological_sorting_Graph"
begin
consts add_edge :: "graph \<Rightarrow> vertex \<Rightarrow> vertex \<Rightarrow> graph"
axiomatization where add_edge'spec'0:   "preds (add_edge g u v) x = (if x = v then finsert u (preds g v) else preds g x)"
  for g :: "graph"
  and u :: "vertex"
  and v :: "vertex"
  and x :: "vertex"
axiomatization where add_edge'spec:   "succs (add_edge g u v) x = (if x = u then finsert v (succs g u) else succs g x)"
  for g :: "graph"
  and u :: "vertex"
  and v :: "vertex"
  and x :: "vertex"
end

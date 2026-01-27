import Why3.Base
import pearl.topological_sorting_vcg.lean.topological_sorting.Graph
open Classical
open Lean4Why3
namespace Online_graph
axiom add_edge : Graph.graph -> Graph.vertex -> Graph.vertex -> Graph.graph
axiom add_edge'spec'0 (g : Graph.graph) (u : Graph.vertex) (v : Graph.vertex) (x : Graph.vertex) : Graph.preds (add_edge g u v) x = (if x = v then insert u (Graph.preds g v) else Graph.preds g x)
axiom add_edge'spec (g : Graph.graph) (u : Graph.vertex) (v : Graph.vertex) (x : Graph.vertex) : Graph.succs (add_edge g u v) x = (if x = u then insert v (Graph.succs g u) else Graph.succs g x)
end Online_graph

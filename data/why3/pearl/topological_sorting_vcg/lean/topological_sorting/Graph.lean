import Why3.Base
open Classical
open Lean4Why3
namespace Graph
axiom vertex : Type
axiom inhabited_axiom_vertex : Inhabited vertex
attribute [instance] inhabited_axiom_vertex
axiom graph : Type
axiom inhabited_axiom_graph : Inhabited graph
attribute [instance] inhabited_axiom_graph
axiom vertices : graph -> Finset vertex
axiom edges : graph -> Finset (vertex × vertex)
axiom edges_use_vertices (x : vertex) (y : vertex) (g : graph) (fact0 : (x, y) ∈ edges g) : x ∈ vertices g ∧ y ∈ vertices g
axiom preds : graph -> vertex -> Finset vertex
axiom preds_def (u : vertex) (v : vertex) (g : graph) : ((u, v) ∈ edges g) = (u ∈ preds g v)
axiom succs : graph -> vertex -> Finset vertex
axiom succs_def (u : vertex) (v : vertex) (g : graph) : ((u, v) ∈ edges g) = (v ∈ succs g u)
axiom msort : Type
axiom inhabited_axiom_msort : Inhabited msort
attribute [instance] inhabited_axiom_msort
noncomputable def sort (g : graph) (m : vertex -> ℤ) := ∀(v : vertex) (u : vertex), (u, v) ∈ edges g → m u < m v
end Graph

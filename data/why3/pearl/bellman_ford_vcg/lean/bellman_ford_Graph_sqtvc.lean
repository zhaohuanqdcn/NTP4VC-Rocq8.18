import Why3.Base
open Classical
open Lean4Why3
namespace bellman_ford_Graph_sqtvc
axiom vertex : Type
axiom inhabited_axiom_vertex : Inhabited vertex
attribute [instance] inhabited_axiom_vertex
axiom vertices : Finset vertex
axiom edges : Finset (vertex × vertex)
noncomputable def edge (x : vertex) (y : vertex) := (x, y) ∈ edges
axiom edges_def (x : vertex) (y : vertex) (fact0 : (x, y) ∈ edges) : x ∈ vertices ∧ y ∈ vertices
theorem s'vc : True
  := sorry
end bellman_ford_Graph_sqtvc

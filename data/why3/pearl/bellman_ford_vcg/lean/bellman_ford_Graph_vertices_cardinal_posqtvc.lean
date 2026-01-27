import Why3.Base
open Classical
open Lean4Why3
namespace bellman_ford_Graph_vertices_cardinal_posqtvc
axiom vertex : Type
axiom inhabited_axiom_vertex : Inhabited vertex
attribute [instance] inhabited_axiom_vertex
axiom vertices : Finset vertex
axiom edges : Finset (vertex × vertex)
noncomputable def edge (x : vertex) (y : vertex) := (x, y) ∈ edges
axiom edges_def (x : vertex) (y : vertex) (fact0 : (x, y) ∈ edges) : x ∈ vertices ∧ y ∈ vertices
axiom s : vertex
axiom s'def : s ∈ vertices
theorem vertices_cardinal_pos'vc : (0 : ℤ) < Int.ofNat (Finset.card vertices)
  := sorry
end bellman_ford_Graph_vertices_cardinal_posqtvc

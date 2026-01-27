import Why3.Base
open Classical
open Lean4Why3
namespace bellman_ford_Graph_path_in_verticesqtvc
axiom vertex : Type
axiom inhabited_axiom_vertex : Inhabited vertex
attribute [instance] inhabited_axiom_vertex
axiom vertices : Finset vertex
axiom edges : Finset (vertex × vertex)
noncomputable def edge (x : vertex) (y : vertex) := (x, y) ∈ edges
axiom edges_def (x : vertex) (y : vertex) (fact0 : (x, y) ∈ edges) : x ∈ vertices ∧ y ∈ vertices
axiom s : vertex
axiom s'def : s ∈ vertices
inductive path : vertex -> List vertex -> vertex -> Prop where
 | Path_empty (x : vertex) : path x ([] : List vertex) x
 | Path_cons (x : vertex) (y : vertex) (l : List vertex) (z : vertex) : edge x y → path y l z → path x (List.cons x l) z
axiom path_right_extension (x : vertex) (l : List vertex) (y : vertex) (z : vertex) (fact0 : path x l y) (fact1 : edge y z) : path x (l ++ List.cons y ([] : List vertex)) z
axiom path_right_inversion (x : vertex) (l : List vertex) (z : vertex) (fact0 : path x l z) : x = z ∧ l = ([] : List vertex) ∨ (∃(y : vertex) (l' : List vertex), path x l' y ∧ edge y z ∧ l = l' ++ List.cons y ([] : List vertex))
axiom path_trans (x : vertex) (l1 : List vertex) (y : vertex) (l2 : List vertex) (z : vertex) (fact0 : path x l1 y) (fact1 : path y l2 z) : path x (l1 ++ l2) z
axiom empty_path (x : vertex) (y : vertex) (fact0 : path x ([] : List vertex) y) : x = y
axiom path_decomposition (x : vertex) (l1 : List vertex) (y : vertex) (l2 : List vertex) (z : vertex) (fact0 : path x (l1 ++ List.cons y l2) z) : path x l1 y ∧ path y (List.cons y l2) z
axiom weight : vertex -> vertex -> ℤ
noncomputable def path_weight : List vertex -> vertex -> ℤ
  | ([] : List vertex), dst => (0 : ℤ)
  | (List.cons x ([] : List vertex)), dst => weight x dst
  | (List.cons x (List.cons y x0)), dst => weight x y + path_weight (List.cons y x0) dst
axiom path_weight_right_extension (l : List vertex) (x : vertex) (y : vertex) : path_weight (l ++ List.cons x ([] : List vertex)) y = path_weight l x + weight x y
axiom path_weight_decomposition (l1 : List vertex) (y : vertex) (l2 : List vertex) (z : vertex) : path_weight (l1 ++ List.cons y l2) z = path_weight l1 y + path_weight (List.cons y l2) z
theorem path_in_vertices'vc (v1 : vertex) (l : List vertex) (v2 : vertex) (fact0 : v1 ∈ vertices) (fact1 : path v1 l v2) : v2 ∈ vertices
  := sorry
end bellman_ford_Graph_path_in_verticesqtvc

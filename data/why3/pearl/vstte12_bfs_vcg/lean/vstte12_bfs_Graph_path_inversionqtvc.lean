import Why3.Base
open Classical
open Lean4Why3
namespace vstte12_bfs_Graph_path_inversionqtvc
axiom vertex : Type
axiom inhabited_axiom_vertex : Inhabited vertex
attribute [instance] inhabited_axiom_vertex
axiom eq : vertex -> vertex -> Prop
axiom eq'spec (x : vertex) (y : vertex) : eq x y = (x = y)
axiom succ : vertex -> Finset vertex
inductive path : vertex -> vertex -> ℤ -> Prop where
 | path_empty (v : vertex) : path v v (0 : ℤ)
 | path_succ (v1 : vertex) (v2 : vertex) (n : ℤ) (v3 : vertex) : path v1 v2 n → v3 ∈ succ v2 → path v1 v3 (n + (1 : ℤ))
theorem path_inversion'vc (n : ℤ) (v1 : vertex) (v3 : vertex) (fact0 : (0 : ℤ) ≤ n) (fact1 : path v1 v3 (n + (1 : ℤ))) : ∃(v2 : vertex), path v1 v2 n ∧ v3 ∈ succ v2
  := sorry
end vstte12_bfs_Graph_path_inversionqtvc

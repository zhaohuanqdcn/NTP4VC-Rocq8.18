import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.IntInf
import Why3.map.Const
import pearl.bellman_ford_vcg.lean.bellman_ford.Graph
open Classical
open Lean4Why3
namespace bellman_ford_BellmanFord_inv2_pathqtvc
axiom set : Type
axiom inhabited_axiom_set : Inhabited set
attribute [instance] inhabited_axiom_set
axiom to_fset : set -> Finset (Graph.vertex × Graph.vertex)
axiom choose1 : set -> Graph.vertex × Graph.vertex
axiom choose'spec (s : set) (fact0 : ¬to_fset s = ∅) : choose1 s ∈ to_fset s
axiom t : Type -> Type
axiom inhabited_axiom_t {α : Type} [Inhabited α] : Inhabited (t α)
attribute [instance] inhabited_axiom_t
axiom contents :  {α : Type} -> [Inhabited α] -> t α -> Graph.vertex -> α
axiom create :  {α : Type} -> [Inhabited α] -> α -> t α
axiom create'spec {α : Type} [Inhabited α] (x : α) : contents (create x) = Const.const x
axiom mixfix_lbrb :  {α : Type} -> [Inhabited α] -> t α -> Graph.vertex -> α
axiom mixfix_lbrb'spec {α : Type} [Inhabited α] (m : t α) (k : Graph.vertex) : mixfix_lbrb m k = contents m k
axiom mixfix_lblsmnrb :  {α : Type} -> [Inhabited α] -> t α -> Graph.vertex -> α -> t α
axiom mixfix_lblsmnrb'spec {α : Type} [Inhabited α] (m : t α) (k : Graph.vertex) (v : α) : contents (mixfix_lblsmnrb m k v) = Function.update (contents m) k v
axiom distmap : Type
axiom inhabited_axiom_distmap : Inhabited distmap
attribute [instance] inhabited_axiom_distmap
noncomputable def inv1 (m : t IntInf.t) (pass : ℤ) (via : Finset (Graph.vertex × Graph.vertex)) := ∀(v : Graph.vertex), v ∈ Graph.vertices → (match mixfix_lbrb m v with | IntInf.t.Finite n => (∃(l : List Graph.vertex), Graph.path Graph.s l v ∧ Graph.path_weight l v = n) ∧ (∀(l : List Graph.vertex), Graph.path Graph.s l v → Int.ofNat (List.length l) < pass → n ≤ Graph.path_weight l v) ∧ (∀(u : Graph.vertex) (l : List Graph.vertex), Graph.path Graph.s l u → Int.ofNat (List.length l) < pass → (u, v) ∈ via → n ≤ Graph.path_weight l u + Graph.weight u v) | IntInf.t.Infinite => (∀(l : List Graph.vertex), Graph.path Graph.s l v → pass ≤ Int.ofNat (List.length l)) ∧ (∀(u : Graph.vertex), (u, v) ∈ via → (∀(lu : List Graph.vertex), Graph.path Graph.s lu u → pass ≤ Int.ofNat (List.length lu))))
noncomputable def inv2 (m : t IntInf.t) (via : Finset (Graph.vertex × Graph.vertex)) := ∀(u : Graph.vertex) (v : Graph.vertex), (u, v) ∈ via → IntInf.le (mixfix_lbrb m v) (IntInf.add (mixfix_lbrb m u) (IntInf.t.Finite (Graph.weight u v)))
theorem inv2_path'vc (m : t IntInf.t) (y : Graph.vertex) (l : List Graph.vertex) (z : Graph.vertex) (fact0 : inv2 m Graph.edges) (fact1 : Graph.path y l z) : IntInf.le (mixfix_lbrb m z) (IntInf.add (mixfix_lbrb m y) (IntInf.t.Finite (Graph.path_weight l z)))
  := sorry
end bellman_ford_BellmanFord_inv2_pathqtvc

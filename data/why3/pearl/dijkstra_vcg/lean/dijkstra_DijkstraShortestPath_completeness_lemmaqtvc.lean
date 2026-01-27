import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.Const
open Classical
open Lean4Why3
namespace dijkstra_DijkstraShortestPath_completeness_lemmaqtvc
axiom vertex : Type
axiom inhabited_axiom_vertex : Inhabited vertex
attribute [instance] inhabited_axiom_vertex
axiom set : Type
axiom inhabited_axiom_set : Inhabited set
attribute [instance] inhabited_axiom_set
axiom to_fset : set -> Finset vertex
axiom choose1 : set -> vertex
axiom choose'spec (s : set) (fact0 : ¬to_fset s = ∅) : choose1 s ∈ to_fset s
axiom t : Type -> Type
axiom inhabited_axiom_t {α : Type} [Inhabited α] : Inhabited (t α)
attribute [instance] inhabited_axiom_t
axiom contents :  {α : Type} -> [Inhabited α] -> t α -> vertex -> α
axiom create :  {α : Type} -> [Inhabited α] -> α -> t α
axiom create'spec {α : Type} [Inhabited α] (x : α) : contents (create x) = Const.const x
axiom mixfix_lbrb :  {α : Type} -> [Inhabited α] -> t α -> vertex -> α
axiom mixfix_lbrb'spec {α : Type} [Inhabited α] (m : t α) (k : vertex) : mixfix_lbrb m k = contents m k
axiom mixfix_lblsmnrb :  {α : Type} -> [Inhabited α] -> t α -> vertex -> α -> t α
axiom mixfix_lblsmnrb'spec {α : Type} [Inhabited α] (m : t α) (k : vertex) (v : α) : contents (mixfix_lblsmnrb m k v) = Function.update (contents m) k v
axiom v : Finset vertex
axiom g_succ : vertex -> Finset vertex
axiom g_succ'spec (x_x : vertex) : g_succ x_x ⊆ v
axiom weight : vertex -> vertex -> ℤ
axiom weight'spec (x : vertex) (x_1 : vertex) : (0 : ℤ) ≤ weight x x_1
noncomputable def min (m : vertex) (q : set) (d : t ℤ) := m ∈ to_fset q ∧ (∀(x : vertex), x ∈ to_fset q → mixfix_lbrb d m ≤ mixfix_lbrb d x)
inductive path : vertex -> vertex -> ℤ -> Prop where
 | Path_nil (x : vertex) : path x x (0 : ℤ)
 | Path_cons (x : vertex) (y : vertex) (d : ℤ) (z : vertex) : path x y d → z ∈ g_succ y → path x z (d + weight y z)
noncomputable def shortest_path (x : vertex) (y : vertex) (d : ℤ) := path x y d ∧ (∀(d' : ℤ), path x y d' → d ≤ d')
theorem completeness_lemma'vc (s : set) (src : vertex) (dst : vertex) (d : ℤ) (fact0 : ∀(v1 : vertex), v1 ∈ to_fset s → (∀(w : vertex), w ∈ g_succ v1 → w ∈ to_fset s)) (fact1 : src ∈ to_fset s) (fact2 : path src dst d) : dst ∈ to_fset s
  := sorry
end dijkstra_DijkstraShortestPath_completeness_lemmaqtvc

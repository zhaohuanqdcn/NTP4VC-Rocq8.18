import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.Const
open Classical
open Lean4Why3
namespace dijkstra_DijkstraShortestPath_relaxqtvc
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
theorem relax'vc (v1 : vertex) (visited : set) (u : vertex) (d : t ℤ) (q : set) : if ¬v1 ∈ to_fset visited then let o1 : ℤ := weight u v1; (0 : ℤ) ≤ o1 → (let o2 : ℤ := mixfix_lbrb d u; o2 = contents d u → (let x : ℤ := o2 + o1; if v1 ∈ to_fset q then let o3 : ℤ := mixfix_lbrb d v1; o3 = contents d v1 → (if x < o3 then v1 ∈ to_fset visited ∧ mixfix_lblsmnrb d v1 x = d ∨ v1 ∈ to_fset q ∧ mixfix_lbrb (mixfix_lblsmnrb d v1 x) v1 ≤ mixfix_lbrb (mixfix_lblsmnrb d v1 x) u + weight u v1 ∧ mixfix_lblsmnrb d v1 x = d ∨ v1 ∈ to_fset q ∧ mixfix_lbrb d u + weight u v1 < mixfix_lbrb d v1 ∧ mixfix_lblsmnrb d v1 x = mixfix_lblsmnrb d v1 (mixfix_lbrb d u + weight u v1) ∨ ¬v1 ∈ to_fset visited ∧ ¬v1 ∈ to_fset q ∧ to_fset q = insert v1 (to_fset q) ∧ mixfix_lblsmnrb d v1 x = mixfix_lblsmnrb d v1 (mixfix_lbrb d u + weight u v1) else v1 ∈ to_fset visited ∨ v1 ∈ to_fset q ∧ mixfix_lbrb d v1 ≤ mixfix_lbrb d u + weight u v1 ∨ v1 ∈ to_fset q ∧ mixfix_lbrb d u + weight u v1 < mixfix_lbrb d v1 ∧ d = mixfix_lblsmnrb d v1 (mixfix_lbrb d u + weight u v1) ∨ ¬v1 ∈ to_fset visited ∧ ¬v1 ∈ to_fset q ∧ to_fset q = insert v1 (to_fset q) ∧ d = mixfix_lblsmnrb d v1 (mixfix_lbrb d u + weight u v1)) else ∀(q1 : set), to_fset q1 = insert v1 (to_fset q) ∧ (if v1 ∈ to_fset q then Finset.card (to_fset q1) = Finset.card (to_fset q) else Int.ofNat (Finset.card (to_fset q1)) = Int.ofNat (Finset.card (to_fset q)) + (1 : ℤ)) → v1 ∈ to_fset visited ∧ q1 = q ∧ mixfix_lblsmnrb d v1 x = d ∨ v1 ∈ to_fset q1 ∧ mixfix_lbrb (mixfix_lblsmnrb d v1 x) v1 ≤ mixfix_lbrb (mixfix_lblsmnrb d v1 x) u + weight u v1 ∧ q1 = q ∧ mixfix_lblsmnrb d v1 x = d ∨ v1 ∈ to_fset q1 ∧ mixfix_lbrb d u + weight u v1 < mixfix_lbrb d v1 ∧ q1 = q ∧ mixfix_lblsmnrb d v1 x = mixfix_lblsmnrb d v1 (mixfix_lbrb d u + weight u v1) ∨ ¬v1 ∈ to_fset visited ∧ ¬v1 ∈ to_fset q ∧ to_fset q1 = insert v1 (to_fset q) ∧ mixfix_lblsmnrb d v1 x = mixfix_lblsmnrb d v1 (mixfix_lbrb d u + weight u v1))) else v1 ∈ to_fset visited ∨ v1 ∈ to_fset q ∧ mixfix_lbrb d v1 ≤ mixfix_lbrb d u + weight u v1 ∨ v1 ∈ to_fset q ∧ mixfix_lbrb d u + weight u v1 < mixfix_lbrb d v1 ∧ d = mixfix_lblsmnrb d v1 (mixfix_lbrb d u + weight u v1) ∨ ¬v1 ∈ to_fset visited ∧ ¬v1 ∈ to_fset q ∧ to_fset q = insert v1 (to_fset q) ∧ d = mixfix_lblsmnrb d v1 (mixfix_lbrb d u + weight u v1)
  := sorry
end dijkstra_DijkstraShortestPath_relaxqtvc

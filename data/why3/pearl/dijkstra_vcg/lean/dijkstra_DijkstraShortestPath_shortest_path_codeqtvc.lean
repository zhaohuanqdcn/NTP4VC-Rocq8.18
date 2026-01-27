import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.Const
open Classical
open Lean4Why3
namespace dijkstra_DijkstraShortestPath_shortest_path_codeqtvc
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
noncomputable def inv_src (src : vertex) (s : set) (q : set) := src ∈ to_fset s ∨ src ∈ to_fset q
noncomputable def inv (src : vertex) (s : set) (q : set) (d : t ℤ) := inv_src src s q ∧ mixfix_lbrb d src = (0 : ℤ) ∧ to_fset s ⊆ v ∧ to_fset q ⊆ v ∧ (∀(v1 : vertex), v1 ∈ to_fset q → ¬v1 ∈ to_fset s) ∧ (∀(v1 : vertex), v1 ∈ to_fset s → shortest_path src v1 (mixfix_lbrb d v1)) ∧ (∀(v1 : vertex), v1 ∈ to_fset q → path src v1 (mixfix_lbrb d v1))
noncomputable def inv_succ (x_src : vertex) (s : set) (q : set) (d : t ℤ) := ∀(x : vertex), x ∈ to_fset s → (∀(y : vertex), y ∈ g_succ x → (y ∈ to_fset s ∨ y ∈ to_fset q) ∧ mixfix_lbrb d y ≤ mixfix_lbrb d x + weight x y)
noncomputable def inv_succ2 (x_src : vertex) (s : set) (q : set) (d : t ℤ) (u : vertex) (su : set) := ∀(x : vertex), x ∈ to_fset s → (∀(y : vertex), y ∈ g_succ x → ¬x = u ∨ x = u ∧ ¬y ∈ to_fset su → (y ∈ to_fset s ∨ y ∈ to_fset q) ∧ mixfix_lbrb d y ≤ mixfix_lbrb d x + weight x y)
theorem shortest_path_code'vc (src : vertex) (dst : vertex) (visited : set) (q : set) (d : t ℤ) (fact0 : src ∈ v) (fact1 : dst ∈ v) (fact2 : to_fset visited = ∅) (fact3 : to_fset q = insert src (∅ : Finset vertex)) : inv src visited q (mixfix_lblsmnrb d src (0 : ℤ)) ∧ inv_succ src visited q (mixfix_lblsmnrb d src (0 : ℤ)) ∧ (∀(m : vertex), min m q (mixfix_lblsmnrb d src (0 : ℤ)) → (∀(x : vertex) (dx : ℤ), path src x dx → dx < mixfix_lbrb (mixfix_lblsmnrb d src (0 : ℤ)) m → x ∈ to_fset visited)) ∧ (∀(q1 : set) (d1 : t ℤ) (visited1 : set), inv src visited1 q1 d1 ∧ inv_succ src visited1 q1 d1 ∧ (∀(m : vertex), min m q1 d1 → (∀(x : vertex) (dx : ℤ), path src x dx → dx < mixfix_lbrb d1 m → x ∈ to_fset visited1)) → (if ¬to_fset q1 = ∅ then ¬to_fset q1 = ∅ ∧ (∀(q2 : set) (u : vertex), min u q1 d1 ∧ to_fset q2 = Finset.erase (to_fset q1) u → (∀(visited2 : set), to_fset visited2 = insert u (to_fset visited1) ∧ (if u ∈ to_fset visited1 then Finset.card (to_fset visited2) = Finset.card (to_fset visited1) else Int.ofNat (Finset.card (to_fset visited2)) = Int.ofNat (Finset.card (to_fset visited1)) + (1 : ℤ)) → (∀(su : set), to_fset su = g_succ u → (to_fset su ⊆ g_succ u ∧ inv src visited2 q2 d1 ∧ inv_succ2 src visited2 q2 d1 u su) ∧ (∀(su1 : set) (q3 : set) (d2 : t ℤ), to_fset su1 ⊆ g_succ u ∧ inv src visited2 q3 d2 ∧ inv_succ2 src visited2 q3 d2 u su1 → (if ¬to_fset su1 = ∅ then ¬to_fset su1 = ∅ ∧ (∀(su2 : set), let v1 : vertex := choose1 su1; v1 ∈ to_fset su1 ∧ to_fset su2 = Finset.erase (to_fset su1) v1 → (∀(q4 : set) (d3 : t ℤ), v1 ∈ to_fset visited2 ∧ q4 = q3 ∧ d3 = d2 ∨ v1 ∈ to_fset q4 ∧ mixfix_lbrb d3 v1 ≤ mixfix_lbrb d3 u + weight u v1 ∧ q4 = q3 ∧ d3 = d2 ∨ v1 ∈ to_fset q4 ∧ mixfix_lbrb d2 u + weight u v1 < mixfix_lbrb d2 v1 ∧ q4 = q3 ∧ d3 = mixfix_lblsmnrb d2 v1 (mixfix_lbrb d2 u + weight u v1) ∨ ¬v1 ∈ to_fset visited2 ∧ ¬v1 ∈ to_fset q3 ∧ to_fset q4 = insert v1 (to_fset q3) ∧ d3 = mixfix_lblsmnrb d2 v1 (mixfix_lbrb d2 u + weight u v1) → ((0 : ℤ) ≤ Int.ofNat (Finset.card (to_fset su1)) ∧ Finset.card (to_fset su2) < Finset.card (to_fset su1)) ∧ to_fset su2 ⊆ g_succ u ∧ inv src visited2 q4 d3 ∧ inv_succ2 src visited2 q4 d3 u su2)) else ((0 : ℤ) ≤ Int.ofNat (Finset.card v) - Int.ofNat (Finset.card (to_fset visited1)) ∧ Int.ofNat (Finset.card v) - Int.ofNat (Finset.card (to_fset visited2)) < Int.ofNat (Finset.card v) - Int.ofNat (Finset.card (to_fset visited1))) ∧ inv src visited2 q3 d2 ∧ inv_succ src visited2 q3 d2 ∧ (∀(m : vertex), min m q3 d2 → (∀(x : vertex) (dx : ℤ), path src x dx → dx < mixfix_lbrb d2 m → x ∈ to_fset visited2))))))) else (∀(v1 : vertex), v1 ∈ to_fset visited1 → shortest_path src v1 (mixfix_lbrb d1 v1)) ∧ (∀(v1 : vertex), ¬v1 ∈ to_fset visited1 → (∀(dv : ℤ), ¬path src v1 dv))))
  := sorry
end dijkstra_DijkstraShortestPath_shortest_path_codeqtvc

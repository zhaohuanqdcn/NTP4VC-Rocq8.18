import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.Const
import pearl.topological_sorting_vcg.lean.topological_sorting.Graph
import pearl.topological_sorting_vcg.lean.topological_sorting.Online_graph
open Classical
open Lean4Why3
namespace topological_sorting_Online_Basic_dfsqtvc
axiom set : Type
axiom inhabited_axiom_set : Inhabited set
attribute [instance] inhabited_axiom_set
axiom to_fset : set -> Finset Graph.vertex
axiom choose1 : set -> Graph.vertex
axiom choose'spec (s : set) (fact0 : ¬to_fset s = ∅) : choose1 s ∈ to_fset s
axiom set1 : Type
axiom inhabited_axiom_set1 : Inhabited set1
attribute [instance] inhabited_axiom_set1
axiom to_fset1 : set1 -> Finset Graph.vertex
axiom mk : Finset Graph.vertex -> set1
axiom mk'spec (s : Finset Graph.vertex) : to_fset1 (mk s) = s
axiom choose2 : set1 -> Graph.vertex
axiom choose'spec1 (s : set1) (fact0 : ¬to_fset1 s = ∅) : choose2 s ∈ to_fset1 s
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
structure t1 where
  graph : Graph.graph
  values : t ℤ
axiom inhabited_axiom_t1 : Inhabited t1
attribute [instance] inhabited_axiom_t1
noncomputable def inv (g : t1) := Graph.sort (t1.graph g) (contents (t1.values g))
theorem dfs'vc (g : t1) (v : Graph.vertex) (seen : set1) (min_depth : ℤ) (fact0 : inv g) (fact1 : v ∈ Graph.vertices (t1.graph g)) (fact2 : to_fset1 seen ⊆ Graph.vertices (t1.graph g)) (fact3 : ¬v ∈ to_fset1 seen) : let o1 : t ℤ := t1.values g; let o2 : ℤ := mixfix_lbrb o1 v; o2 = contents o1 v → (if o2 < min_depth then ∀(p : set), to_fset p = Graph.succs (t1.graph g) v → (∀(seen1 : set1), to_fset1 seen1 = insert v (to_fset1 seen) ∧ (if v ∈ to_fset1 seen then Finset.card (to_fset1 seen1) = Finset.card (to_fset1 seen) else Int.ofNat (Finset.card (to_fset1 seen1)) = Int.ofNat (Finset.card (to_fset1 seen)) + (1 : ℤ)) → (inv g ∧ (∀(s : Graph.vertex), s ∈ Graph.succs (t1.graph g) v → ¬s ∈ to_fset p → min_depth < mixfix_lbrb (t1.values g) s) ∧ to_fset p ⊆ Graph.succs (t1.graph g) v ∧ (∀(x : Graph.vertex), mixfix_lbrb (t1.values g) x ≤ mixfix_lbrb (t1.values g) x)) ∧ (∀(p1 : set) (g1 : t1), g1 = t1.mk (t1.graph g) (t1.values g1) → inv g1 ∧ (∀(s : Graph.vertex), s ∈ Graph.succs (t1.graph g1) v → ¬s ∈ to_fset p1 → min_depth < mixfix_lbrb (t1.values g1) s) ∧ to_fset p1 ⊆ Graph.succs (t1.graph g1) v ∧ (∀(x : Graph.vertex), x ∈ to_fset1 seen1 → mixfix_lbrb (t1.values g1) x = mixfix_lbrb (t1.values g) x) ∧ (∀(x : Graph.vertex), mixfix_lbrb (t1.values g) x ≤ mixfix_lbrb (t1.values g1) x) → (if ¬to_fset p1 = ∅ then ¬to_fset p1 = ∅ ∧ (∀(p2 : set), let u : Graph.vertex := choose1 p1; u ∈ to_fset p1 ∧ to_fset p2 = Finset.erase (to_fset p1) u → (((0 : ℤ) ≤ Int.ofNat (Finset.card (Graph.vertices (t1.graph g))) - Int.ofNat (Finset.card (to_fset1 seen)) ∧ Int.ofNat (Finset.card (Graph.vertices (t1.graph g1))) - Int.ofNat (Finset.card (to_fset1 seen1)) < Int.ofNat (Finset.card (Graph.vertices (t1.graph g))) - Int.ofNat (Finset.card (to_fset1 seen))) ∧ inv g1 ∧ u ∈ Graph.vertices (t1.graph g1) ∧ to_fset1 seen1 ⊆ Graph.vertices (t1.graph g1)) ∧ (∀(g2 : t1), g2 = t1.mk (t1.graph g1) (t1.values g2) → min_depth + (1 : ℤ) ≤ mixfix_lbrb (t1.values g2) u ∧ inv g2 ∧ (∀(x : Graph.vertex), x ∈ to_fset1 seen1 → mixfix_lbrb (t1.values g2) x = mixfix_lbrb (t1.values g1) x) ∧ (∀(x : Graph.vertex), mixfix_lbrb (t1.values g1) x ≤ mixfix_lbrb (t1.values g2) x) → ((0 : ℤ) ≤ Int.ofNat (Finset.card (to_fset p1)) ∧ Finset.card (to_fset p2) < Finset.card (to_fset p1)) ∧ inv g2 ∧ (∀(s : Graph.vertex), s ∈ Graph.succs (t1.graph g2) v → ¬s ∈ to_fset p2 → min_depth < mixfix_lbrb (t1.values g2) s) ∧ to_fset p2 ⊆ Graph.succs (t1.graph g2) v ∧ (∀(x : Graph.vertex), x ∈ to_fset1 seen1 → mixfix_lbrb (t1.values g2) x = mixfix_lbrb (t1.values g) x) ∧ (∀(x : Graph.vertex), mixfix_lbrb (t1.values g) x ≤ mixfix_lbrb (t1.values g2) x))) else ∀(g2 : t1), g2 = t1.mk (t1.graph g1) (t1.values g2) → t1.values g2 = mixfix_lblsmnrb (t1.values g1) v min_depth → min_depth ≤ mixfix_lbrb (t1.values g2) v ∧ inv g2 ∧ (∀(x : Graph.vertex), x ∈ to_fset1 seen → mixfix_lbrb (t1.values g2) x = mixfix_lbrb (t1.values g) x) ∧ (∀(x : Graph.vertex), mixfix_lbrb (t1.values g) x ≤ mixfix_lbrb (t1.values g2) x)))) else min_depth ≤ mixfix_lbrb (t1.values g) v ∧ inv g ∧ (∀(x : Graph.vertex), mixfix_lbrb (t1.values g) x ≤ mixfix_lbrb (t1.values g) x))
  := sorry
end topological_sorting_Online_Basic_dfsqtvc

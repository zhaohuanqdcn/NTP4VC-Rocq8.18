import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.Const
import pearl.topological_sorting_vcg.lean.topological_sorting.Graph
import pearl.topological_sorting_vcg.lean.topological_sorting.Online_graph
open Classical
open Lean4Why3
namespace topological_sorting_Online_Basic_add_edgeqtvc
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
theorem add_edge'vc (g : t1) (x : Graph.vertex) (y : Graph.vertex) (seen : set1) (seen1 : set1) (fact0 : inv g) (fact1 : x ∈ Graph.vertices (t1.graph g)) (fact2 : y ∈ Graph.vertices (t1.graph g)) (fact3 : to_fset1 seen = (∅ : Finset Graph.vertex)) (fact4 : Int.ofNat (Finset.card (to_fset1 seen)) = (0 : ℤ)) (fact5 : to_fset1 seen1 = insert x (to_fset1 seen)) (fact6 : if x ∈ to_fset1 seen then Finset.card (to_fset1 seen1) = Finset.card (to_fset1 seen) else Int.ofNat (Finset.card (to_fset1 seen1)) = Int.ofNat (Finset.card (to_fset1 seen)) + (1 : ℤ)) : let o1 : t ℤ := t1.values g; let o2 : ℤ := mixfix_lbrb o1 x; o2 = contents o1 x → (inv g ∧ y ∈ Graph.vertices (t1.graph g) ∧ to_fset1 seen1 ⊆ Graph.vertices (t1.graph g)) ∧ (∀(g1 : t1), g1 = t1.mk (t1.graph g) (t1.values g1) → o2 + (1 : ℤ) ≤ mixfix_lbrb (t1.values g1) y ∧ inv g1 ∧ (∀(x1 : Graph.vertex), x1 ∈ to_fset1 seen1 → mixfix_lbrb (t1.values g1) x1 = mixfix_lbrb (t1.values g) x1) ∧ (∀(x1 : Graph.vertex), mixfix_lbrb (t1.values g) x1 ≤ mixfix_lbrb (t1.values g1) x1) → (let o3 : Graph.graph := t1.graph g1; let o4 : Graph.graph := Online_graph.add_edge o3 x y; (∀(x1 : Graph.vertex), Graph.preds o4 x1 = (if x1 = y then insert x (Graph.preds o3 y) else Graph.preds o3 x1)) ∧ (∀(x1 : Graph.vertex), Graph.succs o4 x1 = (if x1 = x then insert y (Graph.succs o3 x) else Graph.succs o3 x1)) → (∀(g2 : t1), t1.graph g2 = o4 ∧ t1.values g2 = t1.values g1 → inv g2 ∧ t1.graph g2 = Online_graph.add_edge (t1.graph g) x y)))
  := sorry
end topological_sorting_Online_Basic_add_edgeqtvc

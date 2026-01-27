import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.Const
import pearl.topological_sorting_vcg.lean.topological_sorting.Graph
open Classical
open Lean4Why3
namespace topological_sorting_Static_topo_orderqtvc
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
axiom defined_sort : t ℤ -> Finset Graph.vertex
axiom defined_sort'spec (v : Graph.vertex) (m : t ℤ) : (v ∈ defined_sort m) = ((0 : ℤ) ≤ mixfix_lbrb m v)
noncomputable def partial_sort (g : Graph.graph) (m : t ℤ) := ∀(v : Graph.vertex) (u : Graph.vertex), (u, v) ∈ Graph.edges g → (0 : ℤ) ≤ mixfix_lbrb m v → (0 : ℤ) ≤ mixfix_lbrb m u ∧ mixfix_lbrb m u < mixfix_lbrb m v
noncomputable def inv (g : Graph.graph) (m : t ℤ) (next : ℤ) := defined_sort m ⊆ Graph.vertices g ∧ (0 : ℤ) ≤ next ∧ partial_sort g m ∧ (∀(v : Graph.vertex), v ∈ defined_sort m → mixfix_lbrb m v < next)
theorem topo_order'vc (g : Graph.graph) : let values : t ℤ := create (-(1 : ℤ)); contents values = Const.const (-(1 : ℤ)) → (∀(p : set), to_fset p = Graph.vertices g → (inv g values (0 : ℤ) ∧ to_fset p ⊆ Graph.vertices g ∧ Graph.vertices g \ to_fset p ⊆ defined_sort values) ∧ (∀(p1 : set) (values1 : t ℤ) (next : ℤ), inv g values1 next ∧ to_fset p1 ⊆ Graph.vertices g ∧ Graph.vertices g \ to_fset p1 ⊆ defined_sort values1 → (if ¬to_fset p1 = ∅ then ¬to_fset p1 = ∅ ∧ (∀(p2 : set), let u : Graph.vertex := choose1 p1; u ∈ to_fset p1 ∧ to_fset p2 = Finset.erase (to_fset p1) u → (∀(o1 : set1), to_fset1 o1 = (∅ : Finset Graph.vertex) ∧ Int.ofNat (Finset.card (to_fset1 o1)) = (0 : ℤ) → (inv g values1 next ∧ u ∈ Graph.vertices g ∧ to_fset1 o1 ⊆ Graph.vertices g) ∧ (∀(values2 : t ℤ) (next1 : ℤ), defined_sort values1 ⊆ defined_sort values2 ∧ ((0 : ℤ) ≤ mixfix_lbrb values2 u ∧ mixfix_lbrb values2 u ≤ next1) ∧ inv g values2 next1 ∧ (∀(x : Graph.vertex), x ∈ to_fset1 o1 → mixfix_lbrb values1 x = mixfix_lbrb values2 x) → ((0 : ℤ) ≤ Int.ofNat (Finset.card (to_fset p1)) ∧ Finset.card (to_fset p2) < Finset.card (to_fset p1)) ∧ inv g values2 next1 ∧ to_fset p2 ⊆ Graph.vertices g ∧ Graph.vertices g \ to_fset p2 ⊆ defined_sort values2))) else Graph.sort g (contents values1))))
  := sorry
end topological_sorting_Static_topo_orderqtvc

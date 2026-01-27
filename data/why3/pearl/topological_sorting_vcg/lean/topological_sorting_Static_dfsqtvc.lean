import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.Const
import pearl.topological_sorting_vcg.lean.topological_sorting.Graph
open Classical
open Lean4Why3
namespace topological_sorting_Static_dfsqtvc
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
theorem dfs'vc (g : Graph.graph) (values : t ℤ) (next : ℤ) (v : Graph.vertex) (seen : set1) (fact0 : inv g values next) (fact1 : v ∈ Graph.vertices g) (fact2 : to_fset1 seen ⊆ Graph.vertices g) (fact3 : ¬v ∈ to_fset1 seen) : let o1 : ℤ := mixfix_lbrb values v; o1 = contents values v → (if o1 < (0 : ℤ) then ∀(p : set), to_fset p = Graph.preds g v → (∀(seen1 : set1), to_fset1 seen1 = insert v (to_fset1 seen) ∧ (if v ∈ to_fset1 seen then Finset.card (to_fset1 seen1) = Finset.card (to_fset1 seen) else Int.ofNat (Finset.card (to_fset1 seen1)) = Int.ofNat (Finset.card (to_fset1 seen)) + (1 : ℤ)) → (inv g values next ∧ Graph.preds g v \ to_fset p ⊆ defined_sort values ∧ defined_sort values ⊆ defined_sort values ∧ to_fset p ⊆ Graph.preds g v) ∧ (∀(p1 : set) (next1 : ℤ) (values1 : t ℤ), inv g values1 next1 ∧ Graph.preds g v \ to_fset p1 ⊆ defined_sort values1 ∧ defined_sort values ⊆ defined_sort values1 ∧ to_fset p1 ⊆ Graph.preds g v ∧ (∀(x : Graph.vertex), x ∈ to_fset1 seen1 → mixfix_lbrb values1 x = mixfix_lbrb values x) → (if ¬to_fset p1 = ∅ then ¬to_fset p1 = ∅ ∧ (∀(p2 : set), let u : Graph.vertex := choose1 p1; u ∈ to_fset p1 ∧ to_fset p2 = Finset.erase (to_fset p1) u → (((0 : ℤ) ≤ Int.ofNat (Finset.card (Graph.vertices g)) - Int.ofNat (Finset.card (to_fset1 seen)) ∧ Int.ofNat (Finset.card (Graph.vertices g)) - Int.ofNat (Finset.card (to_fset1 seen1)) < Int.ofNat (Finset.card (Graph.vertices g)) - Int.ofNat (Finset.card (to_fset1 seen))) ∧ inv g values1 next1 ∧ u ∈ Graph.vertices g ∧ to_fset1 seen1 ⊆ Graph.vertices g) ∧ (∀(next2 : ℤ) (values2 : t ℤ), defined_sort values1 ⊆ defined_sort values2 ∧ ((0 : ℤ) ≤ mixfix_lbrb values2 u ∧ mixfix_lbrb values2 u ≤ next2) ∧ inv g values2 next2 ∧ (∀(x : Graph.vertex), x ∈ to_fset1 seen1 → mixfix_lbrb values1 x = mixfix_lbrb values2 x) → ((0 : ℤ) ≤ Int.ofNat (Finset.card (to_fset p1)) ∧ Finset.card (to_fset p2) < Finset.card (to_fset p1)) ∧ inv g values2 next2 ∧ Graph.preds g v \ to_fset p2 ⊆ defined_sort values2 ∧ defined_sort values ⊆ defined_sort values2 ∧ to_fset p2 ⊆ Graph.preds g v ∧ (∀(x : Graph.vertex), x ∈ to_fset1 seen1 → mixfix_lbrb values2 x = mixfix_lbrb values x))) else defined_sort values ⊆ defined_sort (mixfix_lblsmnrb values1 v next1) ∧ ((0 : ℤ) ≤ mixfix_lbrb (mixfix_lblsmnrb values1 v next1) v ∧ mixfix_lbrb (mixfix_lblsmnrb values1 v next1) v ≤ next1 + (1 : ℤ)) ∧ inv g (mixfix_lblsmnrb values1 v next1) (next1 + (1 : ℤ)) ∧ (∀(x : Graph.vertex), x ∈ to_fset1 seen → mixfix_lbrb values x = mixfix_lbrb (mixfix_lblsmnrb values1 v next1) x)))) else defined_sort values ⊆ defined_sort values ∧ ((0 : ℤ) ≤ mixfix_lbrb values v ∧ mixfix_lbrb values v ≤ next) ∧ inv g values next)
  := sorry
end topological_sorting_Static_dfsqtvc

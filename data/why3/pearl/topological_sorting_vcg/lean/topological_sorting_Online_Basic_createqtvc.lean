import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.Const
import pearl.topological_sorting_vcg.lean.topological_sorting.Graph
import pearl.topological_sorting_vcg.lean.topological_sorting.Online_graph
open Classical
open Lean4Why3
namespace topological_sorting_Online_Basic_createqtvc
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
theorem create'vc (g : Graph.graph) (fact0 : ∀(x : Graph.vertex), Graph.preds g x = ∅) : let o1 : t ℤ := create (0 : ℤ); contents o1 = Const.const (0 : ℤ) → inv (t1.mk g o1)
  := sorry
end topological_sorting_Online_Basic_createqtvc

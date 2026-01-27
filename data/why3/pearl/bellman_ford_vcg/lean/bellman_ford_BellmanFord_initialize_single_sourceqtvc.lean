import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.IntInf
import Why3.map.Const
import pearl.bellman_ford_vcg.lean.bellman_ford.Graph
open Classical
open Lean4Why3
namespace bellman_ford_BellmanFord_initialize_single_sourceqtvc
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
theorem initialize_single_source'vc (s : Graph.vertex) : let o1 : IntInf.t := IntInf.t.Infinite; let m : t IntInf.t := create o1; contents m = Const.const o1 → mixfix_lblsmnrb m s (IntInf.t.Finite (0 : ℤ)) = mixfix_lblsmnrb (create IntInf.t.Infinite) s (IntInf.t.Finite (0 : ℤ))
  := sorry
end bellman_ford_BellmanFord_initialize_single_sourceqtvc

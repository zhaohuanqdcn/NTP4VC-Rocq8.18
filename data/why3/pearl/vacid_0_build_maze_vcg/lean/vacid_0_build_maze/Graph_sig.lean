import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace Graph_sig
axiom graph : Type
axiom inhabited_axiom_graph : Inhabited graph
attribute [instance] inhabited_axiom_graph
inductive path : graph -> ℤ -> ℤ -> Prop where
 | Path_refl (g : graph) (x : ℤ) : path g x x
 | Path_sym (g : graph) (x : ℤ) (y : ℤ) : path g x y → path g y x
 | Path_trans (g : graph) (x : ℤ) (y : ℤ) (z : ℤ) : path g x y → path g y z → path g x z
end Graph_sig

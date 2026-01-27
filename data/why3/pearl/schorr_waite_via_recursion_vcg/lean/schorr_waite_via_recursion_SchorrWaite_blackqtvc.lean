import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.Const
import pearl.schorr_waite_via_recursion_vcg.lean.schorr_waite_via_recursion.Memory
import pearl.schorr_waite_via_recursion_vcg.lean.schorr_waite_via_recursion.GraphShape
open Classical
open Lean4Why3
namespace schorr_waite_via_recursion_SchorrWaite_blackqtvc
theorem black'vc (l : Memory.loc) (memo : Memory.memory) (fact0 : ¬l = Memory.null) : ¬l = Memory.null ∧ (∀(result : Bool), (match Memory.colors memo l with | Memory.color.White => result = false | _ => result = true) → (result = true) = GraphShape.black (Memory.colors memo l))
  := sorry
end schorr_waite_via_recursion_SchorrWaite_blackqtvc

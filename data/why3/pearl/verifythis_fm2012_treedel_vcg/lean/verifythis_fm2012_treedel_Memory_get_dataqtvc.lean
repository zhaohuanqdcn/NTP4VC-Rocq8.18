import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace verifythis_fm2012_treedel_Memory_get_dataqtvc
axiom loc : Type
axiom inhabited_axiom_loc : Inhabited loc
attribute [instance] inhabited_axiom_loc
axiom null : loc
axiom eq_loc : loc -> loc -> Prop
axiom eq_loc'spec (x : loc) (y : loc) : eq_loc x y = (x = y)
structure node where
  left1 : loc
  right1 : loc
  data : ℤ
axiom inhabited_axiom_node : Inhabited node
attribute [instance] inhabited_axiom_node
axiom memory : Type
axiom inhabited_axiom_memory : Inhabited memory
attribute [instance] inhabited_axiom_memory
theorem get_data'vc : True
  := sorry
end verifythis_fm2012_treedel_Memory_get_dataqtvc

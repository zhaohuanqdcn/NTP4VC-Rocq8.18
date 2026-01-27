import Why3.Base
open Classical
open Lean4Why3
namespace space_saving_Top_sqtvc
axiom elt : Type
axiom inhabited_axiom_elt : Inhabited elt
attribute [instance] inhabited_axiom_elt
axiom dummy : elt
theorem s'vc : True
  := sorry
end space_saving_Top_sqtvc

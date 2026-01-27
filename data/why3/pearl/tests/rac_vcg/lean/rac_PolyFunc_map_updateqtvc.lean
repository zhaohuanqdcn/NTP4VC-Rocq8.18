import Why3.Base
open Classical
open Lean4Why3
namespace rac_PolyFunc_map_updateqtvc
structure t (α : Type) where
  f : ℤ -> α
axiom inhabited_axiom_t {α : Type} [Inhabited α] : Inhabited (t α)
attribute [instance] inhabited_axiom_t
theorem map_update'vc : True
  := sorry
end rac_PolyFunc_map_updateqtvc

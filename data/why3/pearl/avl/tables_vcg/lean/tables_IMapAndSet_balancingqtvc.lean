import Why3.Base
open Classical
open Lean4Why3
namespace tables_IMapAndSet_balancingqtvc
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
theorem balancing'vc : True
  := sorry
end tables_IMapAndSet_balancingqtvc

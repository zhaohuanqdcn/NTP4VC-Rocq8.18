import Why3.Base
open Classical
open Lean4Why3
namespace tables_IMapAndSet_compareqtvc
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom balancing : ℕ
axiom balancing'def : Int.ofNat balancing = Int.ofNat (0 : ℕ) + (1 : ℤ)
theorem compare'vc : True
  := sorry
end tables_IMapAndSet_compareqtvc

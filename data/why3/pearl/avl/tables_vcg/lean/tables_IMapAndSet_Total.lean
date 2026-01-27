import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace tables_IMapAndSet_Total
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom balancing : ℕ
axiom balancing'def : Int.ofNat balancing = Int.ofNat (0 : ℕ) + (1 : ℤ)
theorem Total (x : ℤ) (y : ℤ) : x ≤ y ∨ y ≤ x
  := sorry
end tables_IMapAndSet_Total

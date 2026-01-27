import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace tables_IMapAndSet_Trans
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom balancing : ℕ
axiom balancing'def : Int.ofNat balancing = Int.ofNat (0 : ℕ) + (1 : ℤ)
theorem Trans (x : ℤ) (y : ℤ) (z : ℤ) (fact0 : x ≤ y) (fact1 : y ≤ z) : x ≤ z
  := sorry
end tables_IMapAndSet_Trans

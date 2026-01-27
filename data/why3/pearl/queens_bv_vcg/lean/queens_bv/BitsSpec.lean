import Why3.Base
import Why3.why3.WellFounded.WellFounded
import Why3.why3.Ref.Ref
import pearl.queens_bv_vcg.lean.queens_bv.S
open Classical
open Lean4Why3
namespace BitsSpec
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom mdl : t -> Finset ℤ
axiom t'invariant (i : ℤ) (self : t) (fact0 : i ∈ mdl self) : (0 : ℤ) ≤ i ∧ i < (32 : ℤ)
end BitsSpec

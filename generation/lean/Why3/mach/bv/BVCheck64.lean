import Why3.Base
import Why3.why3.WellFounded.WellFounded
open Classical
open Lean4Why3
namespace BVCheck64
axiom not_greater_than_64 : (64 : ℤ) ≤ (64 : ℤ)
end BVCheck64

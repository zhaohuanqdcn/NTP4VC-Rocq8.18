import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.Sum
open Classical
open Lean4Why3
namespace hillel_challenge_FulcrumNoOverflow_bigqtvc
theorem big'vc : -((2147483647 : ℤ) + (1 : ℤ)) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (2147483647 : ℤ) + (1 : ℤ) - (1 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (2147483647 : ℤ) + (1 : ℤ) - (1 : ℤ) ∧ (0 : ℤ) = (0 : ℤ) * ((2147483647 : ℤ) + (1 : ℤ)) + (0 : ℤ)
  := sorry
end hillel_challenge_FulcrumNoOverflow_bigqtvc

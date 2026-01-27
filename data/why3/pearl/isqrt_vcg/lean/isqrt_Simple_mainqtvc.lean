import Why3.Base
import Why3.why3.Ref.Ref
import pearl.isqrt_vcg.lean.isqrt.Square
open Classical
open Lean4Why3
namespace isqrt_Simple_mainqtvc
theorem main'vc : (0 : ℤ) ≤ (17 : ℤ) ∧ (∀(result : ℤ), Square.isqrt_spec (17 : ℤ) result → result = (4 : ℤ))
  := sorry
end isqrt_Simple_mainqtvc

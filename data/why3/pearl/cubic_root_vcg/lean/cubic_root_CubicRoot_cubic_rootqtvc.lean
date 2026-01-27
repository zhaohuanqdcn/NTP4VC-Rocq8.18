import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace cubic_root_CubicRoot_cubic_rootqtvc
noncomputable def cube (x : ℤ) := x * x * x
theorem cubic_root'vc (x : ℤ) (fact0 : (0 : ℤ) ≤ x) : cube ((1 : ℤ) - (1 : ℤ)) ≤ x ∧ (1 : ℤ) = cube (1 : ℤ) ∧ (1 : ℤ) = (1 : ℤ) * (1 : ℤ) ∧ (∀(b : ℤ), cube (b - (1 : ℤ)) ≤ x → (if cube b ≤ x then ((0 : ℤ) ≤ x - cube b ∧ x - (cube b + (3 : ℤ) * (b * b) + (3 : ℤ) * b + (1 : ℤ)) < x - cube b) ∧ cube (b + (1 : ℤ) - (1 : ℤ)) ≤ x ∧ cube b + (3 : ℤ) * (b * b) + (3 : ℤ) * b + (1 : ℤ) = cube (b + (1 : ℤ)) ∧ b * b + (2 : ℤ) * b + (1 : ℤ) = (b + (1 : ℤ)) * (b + (1 : ℤ)) else cube (b - (1 : ℤ)) ≤ x ∧ x < cube b))
  := sorry
end cubic_root_CubicRoot_cubic_rootqtvc

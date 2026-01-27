import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace gcd_bezout_vc_sp_GcdBezout_gcdqtvc
theorem gcd'vc (x : ℤ) (y : ℤ) (fact0 : (0 : ℤ) ≤ x) (fact1 : (0 : ℤ) ≤ y) : (0 : ℤ) ≤ x ∧ (0 : ℤ) ≤ y ∧ (1 : ℤ) * x + (0 : ℤ) * y = x ∧ (0 : ℤ) * x + (1 : ℤ) * y = y ∧ (∀(a : ℤ) (b : ℤ) (c : ℤ) (d : ℤ), ((0 : ℤ) ≤ a * x + b * y ∧ (0 : ℤ) ≤ c * x + d * y) ∧ Int.gcd (a * x + b * y) (c * x + d * y) = Int.gcd x y → (if (0 : ℤ) < c * x + d * y then ¬c * x + d * y = (0 : ℤ) ∧ ¬c * x + d * y = (0 : ℤ) ∧ (let q : ℤ := Int.tdiv (a * x + b * y) (c * x + d * y); ((0 : ℤ) ≤ c * x + d * y ∧ Int.tmod (a * x + b * y) (c * x + d * y) < c * x + d * y) ∧ ((0 : ℤ) ≤ c * x + d * y ∧ (0 : ℤ) ≤ Int.tmod (a * x + b * y) (c * x + d * y)) ∧ Int.gcd (c * x + d * y) (Int.tmod (a * x + b * y) (c * x + d * y)) = Int.gcd x y ∧ (a - c * q) * x + (b - d * q) * y = Int.tmod (a * x + b * y) (c * x + d * y)) else a * x + b * y = Int.ofNat (Int.gcd x y) ∧ (∃(a1 : ℤ) (b1 : ℤ), a1 * x + b1 * y = a * x + b * y)))
  := sorry
end gcd_bezout_vc_sp_GcdBezout_gcdqtvc

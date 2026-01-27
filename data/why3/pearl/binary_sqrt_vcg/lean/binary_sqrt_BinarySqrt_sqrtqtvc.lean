import Why3.Base
import Why3.real.Truncate
open Classical
open Lean4Why3
namespace binary_sqrt_BinarySqrt_sqrtqtvc
theorem sqrt'vc (r : ℝ) (eps0 : ℝ) (n : ℤ) (o1 : Bool) (fact0 : (0 : ℝ) ≤ r) (fact1 : (0 : ℝ) < eps0) (fact2 : (1 : ℤ) ≤ n) (fact3 : if r < Int.to_Real n * eps0 then o1 = (if (1 : ℝ) < Int.to_Real n * eps0 then true else false) else o1 = false) : (¬o1 = true → (let o2 : ℤ := (2 : ℤ) * n; ((0 : ℤ) ≤ Truncate.ceil (max r (1 : ℝ) / eps0) - n ∧ Truncate.ceil (max r (1 : ℝ) / eps0) - o2 < Truncate.ceil (max r (1 : ℝ) / eps0) - n) ∧ (0 : ℝ) ≤ r ∧ ((0 : ℝ) < eps0 ∧ (1 : ℤ) ≤ o2) ∧ (2 : ℝ) * (Int.to_Real n * eps0) = Int.to_Real o2 * eps0)) ∧ (∀(result : ℝ), (if o1 = true then result = (0 : ℝ) else let o2 : ℝ := (2 : ℝ) * (Int.to_Real n * eps0); ∃(r' : ℝ), (r' * r' ≤ r ∧ r < (r' + o2) * (r' + o2)) ∧ (if (r' + Int.to_Real n * eps0) * (r' + Int.to_Real n * eps0) ≤ r then result = r' + Int.to_Real n * eps0 else result = r')) → result * result ≤ r ∧ r < (result + Int.to_Real n * eps0) * (result + Int.to_Real n * eps0))
  := sorry
end binary_sqrt_BinarySqrt_sqrtqtvc

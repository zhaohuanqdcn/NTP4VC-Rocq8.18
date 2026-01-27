import Why3.Base
open Classical
open Lean4Why3
namespace gcd_vc_sp_EuclideanAlgorithm_euclidqtvc
theorem euclid'vc (u : ℤ) (v : ℤ) (fact0 : (0 : ℤ) ≤ u) (fact1 : (0 : ℤ) ≤ v) : (¬v = (0 : ℤ) → ¬v = (0 : ℤ) ∧ (let o1 : ℤ := Int.tmod u v; ((0 : ℤ) ≤ v ∧ o1 < v) ∧ (0 : ℤ) ≤ v ∧ (0 : ℤ) ≤ o1)) ∧ (∀(result : ℤ), (if v = (0 : ℤ) then result = u else result = Int.ofNat (Int.gcd v (Int.tmod u v))) → result = Int.ofNat (Int.gcd u v))
  := sorry
end gcd_vc_sp_EuclideanAlgorithm_euclidqtvc

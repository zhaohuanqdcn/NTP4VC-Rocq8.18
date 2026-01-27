import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace gcd_vc_sp_EuclideanAlgorithmIterative_euclidqtvc
theorem euclid'vc (u0 : ℤ) (v0 : ℤ) (fact0 : (0 : ℤ) ≤ u0) (fact1 : (0 : ℤ) ≤ v0) : (0 : ℤ) ≤ u0 ∧ (0 : ℤ) ≤ v0 ∧ (∀(u : ℤ) (v : ℤ), ((0 : ℤ) ≤ u ∧ (0 : ℤ) ≤ v) ∧ Int.gcd u v = Int.gcd u0 v0 → (if ¬v = (0 : ℤ) then ¬v = (0 : ℤ) ∧ ((0 : ℤ) ≤ v ∧ Int.tmod u v < v) ∧ ((0 : ℤ) ≤ v ∧ (0 : ℤ) ≤ Int.tmod u v) ∧ Int.gcd v (Int.tmod u v) = Int.gcd u0 v0 else u = Int.ofNat (Int.gcd u0 v0)))
  := sorry
end gcd_vc_sp_EuclideanAlgorithmIterative_euclidqtvc

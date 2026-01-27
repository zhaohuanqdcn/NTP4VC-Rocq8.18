import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace verifythis_2015_parallel_gcd_ParallelGCD_parallel_gcdqtvc
theorem parallel_gcd'vc (a0 : ℤ) (b0 : ℤ) (fact0 : (0 : ℤ) < a0) (fact1 : (0 : ℤ) < b0) : (0 : ℤ) < a0 ∧ a0 ≤ a0 ∧ (0 : ℤ) < b0 ∧ b0 ≤ b0 ∧ (∀(b : ℤ) (a : ℤ), (((0 : ℤ) < a ∧ a ≤ a0) ∧ (0 : ℤ) < b ∧ b ≤ b0) ∧ Int.gcd a b = Int.gcd a0 b0 → (if ¬a = b then ∀(o1 : Bool), if o1 = true then if b < a then (((0 : ℤ) < a - b ∧ a - b ≤ a0) ∧ (0 : ℤ) < b ∧ b ≤ b0) ∧ Int.gcd (a - b) b = Int.gcd a0 b0 else (((0 : ℤ) < a ∧ a ≤ a0) ∧ (0 : ℤ) < b ∧ b ≤ b0) ∧ Int.gcd a b = Int.gcd a0 b0 else if a < b then (((0 : ℤ) < a ∧ a ≤ a0) ∧ (0 : ℤ) < b - a ∧ b - a ≤ b0) ∧ Int.gcd a (b - a) = Int.gcd a0 b0 else (((0 : ℤ) < a ∧ a ≤ a0) ∧ (0 : ℤ) < b ∧ b ≤ b0) ∧ Int.gcd a b = Int.gcd a0 b0 else a = Int.ofNat (Int.gcd a0 b0)))
  := sorry
end verifythis_2015_parallel_gcd_ParallelGCD_parallel_gcdqtvc

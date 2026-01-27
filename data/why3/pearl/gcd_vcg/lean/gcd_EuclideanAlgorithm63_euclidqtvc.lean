import Why3.Base
open Classical
open Lean4Why3
namespace gcd_EuclideanAlgorithm63_euclidqtvc
theorem euclid'vc (u : BitVec 63) (v : BitVec 63) (fact0 : (0 : ℤ) ≤ BitVec.toInt u) (fact1 : (0 : ℤ) ≤ BitVec.toInt v) (fact2 : BitVec.toInt v = (0 : ℤ) → v = (0 : BitVec 63)) : (¬v = (0 : BitVec 63) → (¬BitVec.toInt v = (0 : ℤ) ∧ int'63_in_bounds (Int.tmod (BitVec.toInt u) (BitVec.toInt v))) ∧ (∀(o1 : BitVec 63), BitVec.toInt o1 = Int.tmod (BitVec.toInt u) (BitVec.toInt v) → ((0 : ℤ) ≤ BitVec.toInt v ∧ BitVec.toInt o1 < BitVec.toInt v) ∧ (0 : ℤ) ≤ BitVec.toInt v ∧ (0 : ℤ) ≤ BitVec.toInt o1)) ∧ (∀(result : BitVec 63), (if v = (0 : BitVec 63) then result = u else ∃(o1 : BitVec 63), BitVec.toInt o1 = Int.tmod (BitVec.toInt u) (BitVec.toInt v) ∧ BitVec.toInt result = Int.ofNat (Int.gcd (BitVec.toInt v) (BitVec.toInt o1))) → BitVec.toInt result = Int.ofNat (Int.gcd (BitVec.toInt u) (BitVec.toInt v)))
  := sorry
end gcd_EuclideanAlgorithm63_euclidqtvc

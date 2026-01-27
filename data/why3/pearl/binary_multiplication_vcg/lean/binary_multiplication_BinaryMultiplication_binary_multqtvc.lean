import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace binary_multiplication_BinaryMultiplication_binary_multqtvc
theorem binary_mult'vc (b : ℤ) (a : ℤ) (fact0 : (0 : ℤ) ≤ b) : (0 : ℤ) ≤ b ∧ (0 : ℤ) + a * b = a * b ∧ (∀(z : ℤ) (y : ℤ) (x : ℤ), (0 : ℤ) ≤ y ∧ z + x * y = a * b → (if ¬y = (0 : ℤ) then ¬(2 : ℤ) = (0 : ℤ) ∧ (if Int.tmod y (2 : ℤ) = (1 : ℤ) then ¬(2 : ℤ) = (0 : ℤ) ∧ ((0 : ℤ) ≤ y ∧ Int.tdiv y (2 : ℤ) < y) ∧ (0 : ℤ) ≤ Int.tdiv y (2 : ℤ) ∧ z + x + (2 : ℤ) * x * Int.tdiv y (2 : ℤ) = a * b else ¬(2 : ℤ) = (0 : ℤ) ∧ ((0 : ℤ) ≤ y ∧ Int.tdiv y (2 : ℤ) < y) ∧ (0 : ℤ) ≤ Int.tdiv y (2 : ℤ) ∧ z + (2 : ℤ) * x * Int.tdiv y (2 : ℤ) = a * b) else z = a * b))
  := sorry
end binary_multiplication_BinaryMultiplication_binary_multqtvc

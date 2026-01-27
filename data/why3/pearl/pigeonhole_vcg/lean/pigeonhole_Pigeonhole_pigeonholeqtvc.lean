import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace pigeonhole_Pigeonhole_pigeonholeqtvc
theorem pigeonhole'vc (m : ℤ) (n : ℤ) (f : ℤ -> ℤ) (fact0 : (0 : ℤ) ≤ m) (fact1 : m < n) (fact2 : ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < n → (0 : ℤ) ≤ f i ∧ f i < m) : ∃(i1 : ℤ) (i2 : ℤ), ((0 : ℤ) ≤ i1 ∧ i1 < i2 ∧ i2 < n) ∧ f i1 = f i2
  := sorry
end pigeonhole_Pigeonhole_pigeonholeqtvc

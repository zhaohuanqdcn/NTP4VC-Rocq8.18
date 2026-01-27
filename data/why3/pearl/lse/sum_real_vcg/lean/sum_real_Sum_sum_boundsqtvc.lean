import Why3.Base
open Classical
open Lean4Why3
namespace sum_real_Sum_sum_boundsqtvc
axiom sum : (ℤ -> ℝ) -> ℤ -> ℤ -> ℝ
axiom sum'def (b : ℤ) (a : ℤ) (f : ℤ -> ℝ) : if b ≤ a then sum f a b = (0 : ℝ) else sum f a b = sum f a (b - (1 : ℤ)) + f (b - (1 : ℤ))
axiom abs_fun : (ℤ -> ℝ) -> ℤ -> ℝ
axiom abs_fun'def (f : ℤ -> ℝ) (i : ℤ) : abs_fun f i = abs (f i)
theorem sum_bounds'vc (a : ℤ) (b : ℤ) (min : ℝ) (f : ℤ -> ℝ) (max : ℝ) (fact0 : a ≤ b) (fact1 : ∀(i : ℤ), a ≤ i ∧ i < b → min ≤ f i ∧ f i ≤ max) : Int.to_Real (b - a) * min ≤ sum f a b ∧ sum f a b ≤ Int.to_Real (b - a) * max
  := sorry
end sum_real_Sum_sum_boundsqtvc

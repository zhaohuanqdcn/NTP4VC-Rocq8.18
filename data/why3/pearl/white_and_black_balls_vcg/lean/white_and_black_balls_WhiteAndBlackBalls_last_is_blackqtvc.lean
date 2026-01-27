import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace white_and_black_balls_WhiteAndBlackBalls_last_is_blackqtvc
theorem last_is_black'vc (b0 : ℤ) (w0 : ℤ) (fact0 : (0 : ℤ) ≤ b0) (fact1 : (0 : ℤ) ≤ w0) (fact2 : (1 : ℤ) ≤ b0 + w0) : (0 : ℤ) ≤ b0 ∧ (0 : ℤ) ≤ w0 ∧ (1 : ℤ) ≤ b0 + w0 ∧ (∀(w : ℤ) (b : ℤ), ((0 : ℤ) ≤ b ∧ (0 : ℤ) ≤ w ∧ (1 : ℤ) ≤ b + w) ∧ Odd b = Odd b0 → (if (2 : ℤ) ≤ b + w then (∃(x : ℤ) (y : ℤ), (0 : ℤ) ≤ x ∧ (0 : ℤ) ≤ y ∧ x + y = (2 : ℤ) ∧ x ≤ b ∧ y ≤ w) ∧ (∀(x : ℤ) (y : ℤ), (0 : ℤ) ≤ x ∧ (0 : ℤ) ≤ y ∧ x + y = (2 : ℤ) ∧ x ≤ b ∧ y ≤ w → (∀(o1 : Bool), (if x = (0 : ℤ) then o1 = true else o1 = (if y = (0 : ℤ) then true else false)) → (if o1 = true then ((0 : ℤ) ≤ b + w ∧ b - x + (w - y + (1 : ℤ)) < b + w) ∧ ((0 : ℤ) ≤ b - x ∧ (0 : ℤ) ≤ w - y + (1 : ℤ) ∧ (1 : ℤ) ≤ b - x + (w - y + (1 : ℤ))) ∧ Odd (b - x) = Odd b0 else ((0 : ℤ) ≤ b + w ∧ b - x + (1 : ℤ) + (w - y) < b + w) ∧ ((0 : ℤ) ≤ b - x + (1 : ℤ) ∧ (0 : ℤ) ≤ w - y ∧ (1 : ℤ) ≤ b - x + (1 : ℤ) + (w - y)) ∧ Odd (b - x + (1 : ℤ)) = Odd b0))) else ((0 : ℤ) < b) = Odd b0))
  := sorry
end white_and_black_balls_WhiteAndBlackBalls_last_is_blackqtvc

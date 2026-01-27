import Why3.Base
import Why3.why3.Ref.Ref
import pearl.isqrt_vcg.lean.isqrt.Square
open Classical
open Lean4Why3
namespace isqrt_NewtonMethod_sqrtqtvc
theorem sqrt'vc (x : ℤ) (fact0 : (0 : ℤ) ≤ x) : if x = (0 : ℤ) then Square.isqrt_spec x (0 : ℤ) else if x ≤ (3 : ℤ) then Square.isqrt_spec x (1 : ℤ) else ¬(2 : ℤ) = (0 : ℤ) ∧ (let o1 : ℤ := Int.tdiv ((1 : ℤ) + x) (2 : ℤ); ((0 : ℤ) < o1 ∧ (0 : ℤ) < x ∧ o1 = Int.tdiv (Int.tdiv x x + x) (2 : ℤ) ∧ x < Square.sqr (x + (1 : ℤ)) ∧ x < Square.sqr (o1 + (1 : ℤ))) ∧ (∀(y : ℤ), (0 : ℤ) < Int.tdiv (Int.tdiv x y + y) (2 : ℤ) ∧ (0 : ℤ) < y ∧ x < Square.sqr (y + (1 : ℤ)) ∧ x < Square.sqr (Int.tdiv (Int.tdiv x y + y) (2 : ℤ) + (1 : ℤ)) → (if Int.tdiv (Int.tdiv x y + y) (2 : ℤ) < y then ¬Int.tdiv (Int.tdiv x y + y) (2 : ℤ) = (0 : ℤ) ∧ ¬(2 : ℤ) = (0 : ℤ) ∧ ((0 : ℤ) ≤ y ∧ Int.tdiv (Int.tdiv x y + y) (2 : ℤ) < y) ∧ (0 : ℤ) < Int.tdiv (Int.tdiv x (Int.tdiv (Int.tdiv x y + y) (2 : ℤ)) + Int.tdiv (Int.tdiv x y + y) (2 : ℤ)) (2 : ℤ) ∧ (0 : ℤ) < Int.tdiv (Int.tdiv x y + y) (2 : ℤ) ∧ x < Square.sqr (Int.tdiv (Int.tdiv x y + y) (2 : ℤ) + (1 : ℤ)) ∧ x < Square.sqr (Int.tdiv (Int.tdiv x (Int.tdiv (Int.tdiv x y + y) (2 : ℤ)) + Int.tdiv (Int.tdiv x y + y) (2 : ℤ)) (2 : ℤ) + (1 : ℤ)) else Square.isqrt_spec x y)))
  := sorry
end isqrt_NewtonMethod_sqrtqtvc

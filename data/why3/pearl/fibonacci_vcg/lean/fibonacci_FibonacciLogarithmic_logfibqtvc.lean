import Why3.Base
import Why3.int.Fibonacci
import pearl.fibonacci_vcg.lean.fibonacci.Mat22
open Classical
open Lean4Why3
namespace fibonacci_FibonacciLogarithmic_logfibqtvc
theorem logfib'vc (n : ℤ) (fact0 : (0 : ℤ) ≤ n) : (¬n = (0 : ℤ) → ¬(2 : ℤ) = (0 : ℤ) ∧ (let o1 : ℤ := Int.tdiv n (2 : ℤ); (((0 : ℤ) ≤ n ∧ o1 < n) ∧ (0 : ℤ) ≤ o1) ∧ (∀(a : ℤ) (b : ℤ), Mat22.power (Mat22.t.mk (1 : ℤ) (1 : ℤ) (1 : ℤ) (0 : ℤ)) o1 = Mat22.t.mk (a + b) b b a → ¬(2 : ℤ) = (0 : ℤ)))) ∧ (∀(a : ℤ) (b : ℤ), (if n = (0 : ℤ) then a = (1 : ℤ) ∧ b = (0 : ℤ) else ∃(a1 : ℤ) (b1 : ℤ), Mat22.power (Mat22.t.mk (1 : ℤ) (1 : ℤ) (1 : ℤ) (0 : ℤ)) (Int.tdiv n (2 : ℤ)) = Mat22.t.mk (a1 + b1) b1 b1 a1 ∧ (let c : ℤ := a1 + b1; if Int.tmod n (2 : ℤ) = (0 : ℤ) then a = a1 * a1 + b1 * b1 ∧ b = b1 * (a1 + c) else a = b1 * (a1 + c) ∧ b = c * c + b1 * b1)) → Mat22.power (Mat22.t.mk (1 : ℤ) (1 : ℤ) (1 : ℤ) (0 : ℤ)) n = Mat22.t.mk (a + b) b b a)
  := sorry
end fibonacci_FibonacciLogarithmic_logfibqtvc

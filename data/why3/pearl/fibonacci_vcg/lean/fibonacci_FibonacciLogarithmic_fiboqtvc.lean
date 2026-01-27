import Why3.Base
import Why3.int.Fibonacci
import pearl.fibonacci_vcg.lean.fibonacci.Mat22
open Classical
open Lean4Why3
namespace fibonacci_FibonacciLogarithmic_fiboqtvc
theorem fibo'vc (n : ℤ) (fact0 : (0 : ℤ) ≤ n) : (0 : ℤ) ≤ n ∧ (∀(o1 : ℤ) (o2 : ℤ), Mat22.power (Mat22.t.mk (1 : ℤ) (1 : ℤ) (1 : ℤ) (0 : ℤ)) n = Mat22.t.mk (o1 + o2) o2 o2 o1 → o2 = Fibonacci.fib n)
  := sorry
end fibonacci_FibonacciLogarithmic_fiboqtvc

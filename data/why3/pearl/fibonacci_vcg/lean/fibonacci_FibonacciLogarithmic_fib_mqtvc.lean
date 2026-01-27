import Why3.Base
import Why3.int.Fibonacci
import pearl.fibonacci_vcg.lean.fibonacci.Mat22
open Classical
open Lean4Why3
namespace fibonacci_FibonacciLogarithmic_fib_mqtvc
theorem fib_m'vc (n : ℤ) (fact0 : (0 : ℤ) ≤ n) : let p : Mat22.t := Mat22.power (Mat22.t.mk (1 : ℤ) (1 : ℤ) (1 : ℤ) (0 : ℤ)) n; Fibonacci.fib (n + (1 : ℤ)) = Mat22.t.a11 p ∧ Fibonacci.fib n = Mat22.t.a21 p
  := sorry
end fibonacci_FibonacciLogarithmic_fib_mqtvc

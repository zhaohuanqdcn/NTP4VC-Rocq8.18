import Why3.Base
import Why3.int.Fibonacci
open Classical
open Lean4Why3
namespace fibonacci_FibRecGhost_fibqtvc
theorem fib'vc (n : ℤ) (fact0 : (0 : ℤ) ≤ n) : (0 : ℤ) ≤ n ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) = Fibonacci.fib (0 : ℤ) ∧ (1 : ℤ) = Fibonacci.fib ((0 : ℤ) + (1 : ℤ)) ∧ Fibonacci.fib ((0 : ℤ) + n) = Fibonacci.fib n
  := sorry
end fibonacci_FibRecGhost_fibqtvc

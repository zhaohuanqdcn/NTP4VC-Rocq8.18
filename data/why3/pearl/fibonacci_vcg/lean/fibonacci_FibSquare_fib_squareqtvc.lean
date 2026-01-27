import Why3.Base
import Why3.int.Fibonacci
open Classical
open Lean4Why3
namespace fibonacci_FibSquare_fib_squareqtvc
theorem fib_square'vc (n : ℤ) (fact0 : (0 : ℤ) ≤ n) : (Fibonacci.fib n = n * n) = (n = (0 : ℤ) ∨ n = (1 : ℤ) ∨ n = (12 : ℤ))
  := sorry
end fibonacci_FibSquare_fib_squareqtvc

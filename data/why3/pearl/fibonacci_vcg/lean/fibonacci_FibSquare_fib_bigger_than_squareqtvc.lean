import Why3.Base
import Why3.int.Fibonacci
open Classical
open Lean4Why3
namespace fibonacci_FibSquare_fib_bigger_than_squareqtvc
theorem fib_bigger_than_square'vc (n : ℤ) (fact0 : (12 : ℤ) < n) : n * n < Fibonacci.fib n
  := sorry
end fibonacci_FibSquare_fib_bigger_than_squareqtvc

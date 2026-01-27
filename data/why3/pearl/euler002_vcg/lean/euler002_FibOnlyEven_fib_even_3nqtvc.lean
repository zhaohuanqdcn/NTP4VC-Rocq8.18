import Why3.Base
import Why3.int.Fibonacci
open Classical
open Lean4Why3
namespace euler002_FibOnlyEven_fib_even_3nqtvc
theorem fib_even_3n'vc (n : ℤ) (fact0 : (0 : ℤ) ≤ n) : (Int.tmod (Fibonacci.fib n) (2 : ℤ) = (0 : ℤ)) = (Int.tmod n (3 : ℤ) = (0 : ℤ))
  := sorry
end euler002_FibOnlyEven_fib_even_3nqtvc

import Why3.Base
import Why3.int.Fibonacci
open Classical
open Lean4Why3
namespace fibonacci_FibonacciTest_not_isfib_2_2qtvc
theorem not_isfib_2_2'vc : ¬Fibonacci.fib (2 : ℤ) = (2 : ℤ)
  := sorry
end fibonacci_FibonacciTest_not_isfib_2_2qtvc

import Why3.Base
import Why3.int.Fibonacci
open Classical
open Lean4Why3
namespace euler002_FibOnlyEven_fib_evennqtvc
noncomputable def fib_even (n : ℤ) := Fibonacci.fib ((3 : ℤ) * n)
theorem fib_evenn'vc (n : ℤ) (fact0 : (2 : ℤ) ≤ n) : fib_even n = (4 : ℤ) * fib_even (n - (1 : ℤ)) + fib_even (n - (2 : ℤ))
  := sorry
end euler002_FibOnlyEven_fib_evennqtvc

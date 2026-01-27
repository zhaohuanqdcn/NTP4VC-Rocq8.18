import Why3.Base
import Why3.int.Fibonacci
open Classical
open Lean4Why3
namespace euler002_FibOnlyEven_fib_even1qtvc
noncomputable def fib_even (n : ℤ) := Fibonacci.fib ((3 : ℤ) * n)
theorem fib_even1'vc : fib_even (1 : ℤ) = (2 : ℤ)
  := sorry
end euler002_FibOnlyEven_fib_even1qtvc

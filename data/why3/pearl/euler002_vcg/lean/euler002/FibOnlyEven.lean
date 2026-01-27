import Why3.Base
import Why3.int.Fibonacci
open Classical
open Lean4Why3
namespace FibOnlyEven
noncomputable def fib_even (n : ℤ) := Fibonacci.fib ((3 : ℤ) * n)
end FibOnlyEven

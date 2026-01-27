import Why3.Base
open Classical
open Lean4Why3
namespace Fibonacci
axiom fib : ℤ -> ℤ
axiom fib'def (n : ℤ) (fact0 : (0 : ℤ) ≤ n) : if n = (0 : ℤ) then fib n = (0 : ℤ) else if n = (1 : ℤ) then fib n = (1 : ℤ) else fib n = fib (n - (1 : ℤ)) + fib (n - (2 : ℤ))
end Fibonacci

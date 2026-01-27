import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.Fibonacci
open Classical
open Lean4Why3
namespace fibonacci_FibonacciLinear_fibqtvc
theorem fib'vc (n : ℤ) (fact0 : (0 : ℤ) ≤ n) : let o1 : ℤ := n - (1 : ℤ); ((0 : ℤ) ≤ o1 + (1 : ℤ) → (((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ n) ∧ Fibonacci.fib ((0 : ℤ) + (1 : ℤ)) = (1 : ℤ) ∧ Fibonacci.fib (0 : ℤ) = (0 : ℤ)) ∧ (∀(x : ℤ) (y : ℤ), (∀(i : ℤ), ((0 : ℤ) ≤ i ∧ i ≤ o1) ∧ ((0 : ℤ) ≤ i ∧ i ≤ n) ∧ Fibonacci.fib (i + (1 : ℤ)) = x ∧ Fibonacci.fib i = y → ((0 : ℤ) ≤ i + (1 : ℤ) ∧ i + (1 : ℤ) ≤ n) ∧ Fibonacci.fib (i + (1 : ℤ) + (1 : ℤ)) = x + y ∧ Fibonacci.fib (i + (1 : ℤ)) = x) ∧ (((0 : ℤ) ≤ o1 + (1 : ℤ) ∧ o1 + (1 : ℤ) ≤ n) ∧ Fibonacci.fib (o1 + (1 : ℤ) + (1 : ℤ)) = x ∧ Fibonacci.fib (o1 + (1 : ℤ)) = y → Fibonacci.fib n = y))) ∧ (o1 + (1 : ℤ) < (0 : ℤ) → Fibonacci.fib n = (0 : ℤ))
  := sorry
end fibonacci_FibonacciLinear_fibqtvc

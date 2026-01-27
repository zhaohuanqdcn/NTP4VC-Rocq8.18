import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.Fibonacci
open Classical
open Lean4Why3
namespace fibonacci_SmallestFibAbove_smallest_fib_aboveqtvc
theorem smallest_fib_above'vc (x : ℤ) (fact0 : (0 : ℤ) ≤ x) : (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) = Fibonacci.fib (0 : ℤ) ∧ Fibonacci.fib (0 : ℤ) ≤ x ∧ (1 : ℤ) = Fibonacci.fib ((0 : ℤ) + (1 : ℤ)) ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (1 : ℤ) ≤ (1 : ℤ) ∧ (∀(k : ℤ), ((0 : ℤ) ≤ k ∧ Fibonacci.fib k ≤ x) ∧ (0 : ℤ) ≤ Fibonacci.fib k ∧ (1 : ℤ) ≤ Fibonacci.fib (k + (1 : ℤ)) → (if Fibonacci.fib (k + (1 : ℤ)) ≤ x then ((0 : ℤ) ≤ (2 : ℤ) * x - (Fibonacci.fib k + Fibonacci.fib (k + (1 : ℤ))) ∧ (2 : ℤ) * x - (Fibonacci.fib (k + (1 : ℤ)) + (Fibonacci.fib k + Fibonacci.fib (k + (1 : ℤ)))) < (2 : ℤ) * x - (Fibonacci.fib k + Fibonacci.fib (k + (1 : ℤ)))) ∧ ((0 : ℤ) ≤ k + (1 : ℤ) ∧ Fibonacci.fib (k + (1 : ℤ)) ≤ x ∧ Fibonacci.fib k + Fibonacci.fib (k + (1 : ℤ)) = Fibonacci.fib (k + (1 : ℤ) + (1 : ℤ))) ∧ (0 : ℤ) ≤ Fibonacci.fib (k + (1 : ℤ)) ∧ (1 : ℤ) ≤ Fibonacci.fib k + Fibonacci.fib (k + (1 : ℤ)) else ∃(k1 : ℤ), (0 : ℤ) ≤ k1 ∧ Fibonacci.fib k1 ≤ x ∧ x < Fibonacci.fib (k1 + (1 : ℤ)) ∧ Fibonacci.fib (k1 + (1 : ℤ)) = Fibonacci.fib (k + (1 : ℤ))))
  := sorry
end fibonacci_SmallestFibAbove_smallest_fib_aboveqtvc

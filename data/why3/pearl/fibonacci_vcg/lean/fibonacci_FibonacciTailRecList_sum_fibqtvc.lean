import Why3.Base
import Why3.int.Fibonacci
open Classical
open Lean4Why3
namespace fibonacci_FibonacciTailRecList_sum_fibqtvc
theorem sum_fib'vc (l : List ℤ) (fact0 : ∀(n : ℤ), n ∈ l → (0 : ℤ) ≤ n) : match l with | ([] : List ℤ) => True | List.cons x r => (∀(n : ℤ), n ∈ r → (0 : ℤ) ≤ n) ∧ (0 : ℤ) ≤ x
  := sorry
end fibonacci_FibonacciTailRecList_sum_fibqtvc

import Why3.Base
import Why3.int.Fibonacci
open Classical
open Lean4Why3
namespace fibonacci_FibonacciTailRecList_sum_powqtvc
axiom sum_fib : List ℤ -> ℤ
axiom sum_fib'def (l : List ℤ) (fact0 : ∀(n : ℤ), n ∈ l → (0 : ℤ) ≤ n) : match l with | ([] : List ℤ) => sum_fib l = (0 : ℤ) | List.cons x r => sum_fib l = Fibonacci.fib x + sum_fib r
theorem sum_pow'vc (l : List ℤ) (fact0 : ∀(n : ℤ), n ∈ l → (0 : ℤ) ≤ n) : (match l with | ([] : List ℤ) => True | List.cons x r => (∀(n : ℤ), n ∈ r → (0 : ℤ) ≤ n)) ∧ (∀(result : ℤ), (match l with | ([] : List ℤ) => result = (0 : ℤ) | List.cons x r => (∃(o1 : ℤ), (0 : ℤ) ≤ o1 ∧ result = HPow.hPow (2 : ℤ) (Int.toNat x) + o1)) → (0 : ℤ) ≤ result)
  := sorry
end fibonacci_FibonacciTailRecList_sum_powqtvc

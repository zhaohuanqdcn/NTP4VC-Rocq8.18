import Why3.Base
import Why3.int.Fibonacci
open Classical
open Lean4Why3
namespace fibonacci_FibonacciTailRecList_fibqtvc
axiom sum_fib : List ℤ -> ℤ
axiom sum_fib'def (l : List ℤ) (fact0 : ∀(n : ℤ), n ∈ l → (0 : ℤ) ≤ n) : match l with | ([] : List ℤ) => sum_fib l = (0 : ℤ) | List.cons x r => sum_fib l = Fibonacci.fib x + sum_fib r
axiom sum_pow : List ℤ -> ℤ
axiom sum_pow'def (l : List ℤ) (fact0 : ∀(n : ℤ), n ∈ l → (0 : ℤ) ≤ n) : match l with | ([] : List ℤ) => sum_pow l = (0 : ℤ) | List.cons x r => sum_pow l = HPow.hPow (2 : ℤ) (Int.toNat x) + sum_pow r
axiom sum_pow'spec (l : List ℤ) (fact0 : ∀(n : ℤ), n ∈ l → (0 : ℤ) ≤ n) : (0 : ℤ) ≤ sum_pow l
theorem fib'vc (n : ℤ) (fact0 : (0 : ℤ) ≤ n) : let o1 : List ℤ := List.cons n ([] : List ℤ); (∀(n1 : ℤ), n1 ∈ o1 → (0 : ℤ) ≤ n1) ∧ (0 : ℤ) + sum_fib o1 = Fibonacci.fib n
  := sorry
end fibonacci_FibonacciTailRecList_fibqtvc

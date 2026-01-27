import Why3.Base
import Why3.int.Fibonacci
open Classical
open Lean4Why3
namespace fibonacci_FibonacciTailRecList_sum_fib_accqtvc
axiom sum_fib : List ℤ -> ℤ
axiom sum_fib'def (l : List ℤ) (fact0 : ∀(n : ℤ), n ∈ l → (0 : ℤ) ≤ n) : match l with | ([] : List ℤ) => sum_fib l = (0 : ℤ) | List.cons x r => sum_fib l = Fibonacci.fib x + sum_fib r
axiom sum_pow : List ℤ -> ℤ
axiom sum_pow'def (l : List ℤ) (fact0 : ∀(n : ℤ), n ∈ l → (0 : ℤ) ≤ n) : match l with | ([] : List ℤ) => sum_pow l = (0 : ℤ) | List.cons x r => sum_pow l = HPow.hPow (2 : ℤ) (Int.toNat x) + sum_pow r
axiom sum_pow'spec (l : List ℤ) (fact0 : ∀(n : ℤ), n ∈ l → (0 : ℤ) ≤ n) : (0 : ℤ) ≤ sum_pow l
theorem sum_fib_acc'vc (l : List ℤ) (acc : ℤ) (fact0 : ∀(n : ℤ), n ∈ l → (0 : ℤ) ≤ n) : (match l with | ([] : List ℤ) => True | List.cons n r => (if n ≤ (1 : ℤ) then ((0 : ℤ) ≤ sum_pow l ∧ sum_pow r < sum_pow l) ∧ (∀(n1 : ℤ), n1 ∈ r → (0 : ℤ) ≤ n1) else let l2 : List ℤ := List.cons (n - (1 : ℤ)) (List.cons (n - (2 : ℤ)) r); ((0 : ℤ) ≤ sum_pow l ∧ sum_pow l2 < sum_pow l) ∧ (∀(n1 : ℤ), n1 ∈ l2 → (0 : ℤ) ≤ n1))) ∧ (∀(result : ℤ), (match l with | ([] : List ℤ) => result = acc | List.cons n r => (if n ≤ (1 : ℤ) then result = acc + n + sum_fib r else result = acc + sum_fib (List.cons (n - (1 : ℤ)) (List.cons (n - (2 : ℤ)) r)))) → result = acc + sum_fib l)
  := sorry
end fibonacci_FibonacciTailRecList_sum_fib_accqtvc

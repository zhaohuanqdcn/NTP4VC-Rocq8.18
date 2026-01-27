import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.Fibonacci
import pearl.fibonacci_vcg.lean.fibonacci.SmallestFibAbove
open Classical
open Lean4Why3
namespace fibonacci_Zeckendorf_greatest_fibqtvc
noncomputable def sum : List ℤ -> ℤ
  | ([] : List ℤ) => (0 : ℤ)
  | (List.cons k r) => Fibonacci.fib k + sum r
noncomputable def wf : ℤ -> List ℤ -> Prop
  | min, ([] : List ℤ) => True
  | min, (List.cons k r) => min ≤ k ∧ wf (k + (2 : ℤ)) r
theorem greatest_fib'vc (x : ℤ) (fact0 : (0 : ℤ) < x) : (1 : ℤ) ≤ (1 : ℤ) ∧ (1 : ℤ) = Fibonacci.fib (1 : ℤ) ∧ Fibonacci.fib (1 : ℤ) ≤ x ∧ (1 : ℤ) = Fibonacci.fib ((1 : ℤ) + (1 : ℤ)) ∧ (1 : ℤ) ≤ (1 : ℤ) ∧ (∀(k : ℤ), ((1 : ℤ) ≤ k ∧ Fibonacci.fib k ≤ x) ∧ (1 : ℤ) ≤ Fibonacci.fib k ∧ (1 : ℤ) ≤ Fibonacci.fib (k + (1 : ℤ)) → (if Fibonacci.fib (k + (1 : ℤ)) ≤ x then ((0 : ℤ) ≤ (2 : ℤ) * x - (Fibonacci.fib k + Fibonacci.fib (k + (1 : ℤ))) ∧ (2 : ℤ) * x - (Fibonacci.fib (k + (1 : ℤ)) + (Fibonacci.fib k + Fibonacci.fib (k + (1 : ℤ)))) < (2 : ℤ) * x - (Fibonacci.fib k + Fibonacci.fib (k + (1 : ℤ)))) ∧ ((1 : ℤ) ≤ k + (1 : ℤ) ∧ Fibonacci.fib (k + (1 : ℤ)) ≤ x ∧ Fibonacci.fib k + Fibonacci.fib (k + (1 : ℤ)) = Fibonacci.fib (k + (1 : ℤ) + (1 : ℤ))) ∧ (1 : ℤ) ≤ Fibonacci.fib (k + (1 : ℤ)) ∧ (1 : ℤ) ≤ Fibonacci.fib k + Fibonacci.fib (k + (1 : ℤ)) else (2 : ℤ) ≤ k ∧ (1 : ℤ) ≤ Fibonacci.fib k ∧ Fibonacci.fib k ≤ x ∧ x < Fibonacci.fib (k + (1 : ℤ))))
  := sorry
end fibonacci_Zeckendorf_greatest_fibqtvc

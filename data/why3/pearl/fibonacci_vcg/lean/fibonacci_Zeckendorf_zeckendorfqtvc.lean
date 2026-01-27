import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.Fibonacci
import pearl.fibonacci_vcg.lean.fibonacci.SmallestFibAbove
open Classical
open Lean4Why3
namespace fibonacci_Zeckendorf_zeckendorfqtvc
noncomputable def sum : List ℤ -> ℤ
  | ([] : List ℤ) => (0 : ℤ)
  | (List.cons k r) => Fibonacci.fib k + sum r
noncomputable def wf : ℤ -> List ℤ -> Prop
  | min, ([] : List ℤ) => True
  | min, (List.cons k r) => min ≤ k ∧ wf (k + (2 : ℤ)) r
theorem zeckendorf'vc (n : ℤ) (fact0 : (0 : ℤ) ≤ n) : (0 : ℤ) ≤ n ∧ n ≤ n ∧ wf (2 : ℤ) ([] : List ℤ) ∧ n + sum ([] : List ℤ) = n ∧ (∀(l : List ℤ) (x : ℤ), ((0 : ℤ) ≤ x ∧ x ≤ n) ∧ wf (2 : ℤ) l ∧ x + sum l = n ∧ (match l with | ([] : List ℤ) => True | List.cons k _ => x < Fibonacci.fib (k - (1 : ℤ))) → (if (0 : ℤ) < x then (0 : ℤ) < x ∧ (∀(k : ℤ), (2 : ℤ) ≤ k ∧ (1 : ℤ) ≤ Fibonacci.fib k ∧ Fibonacci.fib k ≤ x ∧ x < Fibonacci.fib (k + (1 : ℤ)) → ((0 : ℤ) ≤ x ∧ x - Fibonacci.fib k < x) ∧ ((0 : ℤ) ≤ x - Fibonacci.fib k ∧ x - Fibonacci.fib k ≤ n) ∧ wf (2 : ℤ) (List.cons k l) ∧ x - Fibonacci.fib k + sum (List.cons k l) = n ∧ (match List.cons k l with | ([] : List ℤ) => True | List.cons k1 _ => x - Fibonacci.fib k < Fibonacci.fib (k1 - (1 : ℤ)))) else wf (2 : ℤ) l ∧ n = sum l))
  := sorry
end fibonacci_Zeckendorf_zeckendorfqtvc

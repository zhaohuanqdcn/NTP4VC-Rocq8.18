import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.Fibonacci
import pearl.fibonacci_vcg.lean.fibonacci.SmallestFibAbove
open Classical
open Lean4Why3
namespace fibonacci_Zeckendorf_fib_nonnegqtvc
noncomputable def sum : List ℤ -> ℤ
  | ([] : List ℤ) => (0 : ℤ)
  | (List.cons k r) => Fibonacci.fib k + sum r
noncomputable def wf : ℤ -> List ℤ -> Prop
  | min, ([] : List ℤ) => True
  | min, (List.cons k r) => min ≤ k ∧ wf (k + (2 : ℤ)) r
theorem fib_nonneg'vc (n : ℤ) (fact0 : (0 : ℤ) ≤ n) : (0 : ℤ) ≤ Fibonacci.fib n
  := sorry
end fibonacci_Zeckendorf_fib_nonnegqtvc

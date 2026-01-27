import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.Fibonacci
import pearl.fibonacci_vcg.lean.fibonacci.SmallestFibAbove
open Classical
open Lean4Why3
namespace fibonacci_Zeckendorf_zeckendorf_uniqueqtvc
noncomputable def sum : List ℤ -> ℤ
  | ([] : List ℤ) => (0 : ℤ)
  | (List.cons k r) => Fibonacci.fib k + sum r
noncomputable def wf : ℤ -> List ℤ -> Prop
  | min, ([] : List ℤ) => True
  | min, (List.cons k r) => min ≤ k ∧ wf (k + (2 : ℤ)) r
noncomputable def snoc : List ℤ -> ℤ -> List ℤ
  | ([] : List ℤ), x => List.cons x ([] : List ℤ)
  | (List.cons y q), x => List.cons y (snoc q x)
theorem zeckendorf_unique'vc (l1 : List ℤ) (l2 : List ℤ) (fact0 : wf (2 : ℤ) l1) (fact1 : wf (2 : ℤ) l2) (fact2 : sum l1 = sum l2) : l1 = l2
  := sorry
end fibonacci_Zeckendorf_zeckendorf_uniqueqtvc

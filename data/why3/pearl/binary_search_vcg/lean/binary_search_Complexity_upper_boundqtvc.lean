import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace binary_search_Complexity_upper_boundqtvc
axiom log2 : ℤ -> ℤ
axiom log2'def (n : ℤ) : if n ≤ (1 : ℤ) then log2 n = (0 : ℤ) else log2 n = (1 : ℤ) + log2 (Int.tdiv n (2 : ℤ))
noncomputable def f (n : ℤ) := if n = (0 : ℤ) then (0 : ℤ) else (1 : ℤ) + log2 n
theorem upper_bound'vc (n : ℤ) (fact0 : (2 : ℤ) ≤ n) : f n ≤ (2 : ℤ) * log2 n
  := sorry
end binary_search_Complexity_upper_boundqtvc

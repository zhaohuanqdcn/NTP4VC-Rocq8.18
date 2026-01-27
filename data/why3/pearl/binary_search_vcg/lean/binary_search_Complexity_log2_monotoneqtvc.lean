import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace binary_search_Complexity_log2_monotoneqtvc
axiom log2 : ℤ -> ℤ
axiom log2'def (n : ℤ) : if n ≤ (1 : ℤ) then log2 n = (0 : ℤ) else log2 n = (1 : ℤ) + log2 (Int.tdiv n (2 : ℤ))
theorem log2_monotone'vc (x : ℤ) (y : ℤ) (fact0 : x ≤ y) : log2 x ≤ log2 y
  := sorry
end binary_search_Complexity_log2_monotoneqtvc

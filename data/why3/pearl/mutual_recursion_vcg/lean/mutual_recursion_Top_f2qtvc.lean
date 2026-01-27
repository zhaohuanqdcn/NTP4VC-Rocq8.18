import Why3.Base
open Classical
open Lean4Why3
namespace mutual_recursion_Top_f2qtvc
theorem f2'vc (n : ℤ) (fact0 : (1 : ℤ) ≤ n) : let o1 : ℤ := n - (1 : ℤ); ((0 : ℤ) ≤ n ∧ o1 < n ∨ n = o1 ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (1 : ℤ) < (0 : ℤ)) ∧ (0 : ℤ) ≤ o1
  := sorry
end mutual_recursion_Top_f2qtvc

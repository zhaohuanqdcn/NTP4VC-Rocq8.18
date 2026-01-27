import Why3.Base
open Classical
open Lean4Why3
namespace nistonacci_Top_nistqtvc
theorem nist'vc (n : ℤ) (fact0 : (0 : ℤ) ≤ n) (fact1 : ¬n < (2 : ℤ)) : let o1 : ℤ := n - (1 : ℤ); (((0 : ℤ) ≤ n ∧ o1 < n) ∧ (0 : ℤ) ≤ o1) ∧ (let o2 : ℤ := n - (2 : ℤ); ((0 : ℤ) ≤ n ∧ o2 < n) ∧ (0 : ℤ) ≤ o2)
  := sorry
end nistonacci_Top_nistqtvc

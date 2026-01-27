import Why3.Base
open Classical
open Lean4Why3
namespace mutual_recursion_Top_mqtvc
theorem m'vc (n : ℤ) (fact0 : (0 : ℤ) ≤ n) : (¬n = (0 : ℤ) → (let o1 : ℤ := n - (1 : ℤ); (((0 : ℤ) ≤ n ∧ o1 < n) ∧ (0 : ℤ) ≤ o1) ∧ (∀(o2 : ℤ), (if o1 = (0 : ℤ) then o2 = (0 : ℤ) else (0 : ℤ) ≤ o2 ∧ o2 < o1) → ((0 : ℤ) ≤ n ∧ o2 < n ∨ n = o2 ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (1 : ℤ) < (0 : ℤ)) ∧ (0 : ℤ) ≤ o2))) ∧ (∀(result : ℤ), (if n = (0 : ℤ) then result = (0 : ℤ) else let o1 : ℤ := n - (1 : ℤ); ∃(o2 : ℤ), (if o1 = (0 : ℤ) then o2 = (0 : ℤ) else (0 : ℤ) ≤ o2 ∧ o2 < o1) ∧ (∃(o3 : ℤ), (if o2 = (0 : ℤ) then o3 = (1 : ℤ) else (1 : ℤ) ≤ o3 ∧ o3 ≤ o2) ∧ result = n - o3)) → (if n = (0 : ℤ) then result = (0 : ℤ) else (0 : ℤ) ≤ result ∧ result < n))
  := sorry
end mutual_recursion_Top_mqtvc

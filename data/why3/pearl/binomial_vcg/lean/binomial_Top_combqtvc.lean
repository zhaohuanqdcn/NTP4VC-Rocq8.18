import Why3.Base
open Classical
open Lean4Why3
namespace binomial_Top_combqtvc
axiom infix_sl : ℤ -> ℤ -> ℤ
axiom infix_sl'def (y : ℤ) (x : ℤ) (fact0 : ¬y = (0 : ℤ)) : infix_sl x y = x / y
theorem comb'vc (k : ℤ) (n : ℤ) (o1 : Bool) (fact0 : (0 : ℤ) ≤ k) (fact1 : k ≤ n) (fact2 : if k = (0 : ℤ) then o1 = true else o1 = (if k = n then true else false)) : (¬o1 = true → (let o2 : ℤ := k - (1 : ℤ); let o3 : ℤ := n - (1 : ℤ); (((0 : ℤ) ≤ n ∧ o3 < n) ∧ (0 : ℤ) ≤ o2 ∧ o2 ≤ o3) ∧ (∀(o4 : ℤ), (1 : ℤ) ≤ o4 → (let o5 : ℤ := n - (1 : ℤ); ((0 : ℤ) ≤ n ∧ o5 < n) ∧ (0 : ℤ) ≤ k ∧ k ≤ o5)))) ∧ (∀(result : ℤ), (if o1 = true then result = (1 : ℤ) else ∃(o2 : ℤ), (1 : ℤ) ≤ o2 ∧ (∃(o3 : ℤ), (1 : ℤ) ≤ o3 ∧ result = o3 + o2)) → (1 : ℤ) ≤ result)
  := sorry
end binomial_Top_combqtvc

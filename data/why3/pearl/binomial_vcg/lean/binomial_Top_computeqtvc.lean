import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace binomial_Top_computeqtvc
axiom infix_sl : ℤ -> ℤ -> ℤ
axiom infix_sl'def (y : ℤ) (x : ℤ) (fact0 : ¬y = (0 : ℤ)) : infix_sl x y = x / y
axiom comb : ℤ -> ℤ -> ℤ
axiom comb'def (k : ℤ) (n : ℤ) (fact0 : (0 : ℤ) ≤ k) (fact1 : k ≤ n) : if k = (0 : ℤ) ∨ k = n then comb n k = (1 : ℤ) else comb n k = comb (n - (1 : ℤ)) k + comb (n - (1 : ℤ)) (k - (1 : ℤ))
axiom comb'spec (k : ℤ) (n : ℤ) (fact0 : (0 : ℤ) ≤ k) (fact1 : k ≤ n) : (1 : ℤ) ≤ comb n k
theorem compute'vc (k : ℤ) (n : ℤ) (fact0 : (0 : ℤ) ≤ k) (fact1 : k ≤ n) : let k1 : ℤ := min k (n - k); ((1 : ℤ) ≤ k1 + (1 : ℤ) → (((1 : ℤ) ≤ (1 : ℤ) ∧ (1 : ℤ) ≤ k1 + (1 : ℤ)) ∧ (1 : ℤ) = comb n ((1 : ℤ) - (1 : ℤ))) ∧ (∀(r : ℤ), (∀(i : ℤ), ((1 : ℤ) ≤ i ∧ i ≤ k1) ∧ ((1 : ℤ) ≤ i ∧ i ≤ k1 + (1 : ℤ)) ∧ r = comb n (i - (1 : ℤ)) → ¬i = (0 : ℤ) ∧ ((1 : ℤ) ≤ i + (1 : ℤ) ∧ i + (1 : ℤ) ≤ k1 + (1 : ℤ)) ∧ infix_sl (r * (n - i + (1 : ℤ))) i = comb n (i + (1 : ℤ) - (1 : ℤ))) ∧ (((1 : ℤ) ≤ k1 + (1 : ℤ) ∧ k1 + (1 : ℤ) ≤ k1 + (1 : ℤ)) ∧ r = comb n (k1 + (1 : ℤ) - (1 : ℤ)) → r = comb n k))) ∧ (k1 + (1 : ℤ) < (1 : ℤ) → (1 : ℤ) = comb n k)
  := sorry
end binomial_Top_computeqtvc

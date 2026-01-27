import Why3.Base
open Classical
open Lean4Why3
namespace binomial_Top_prop2qtvc
axiom infix_sl : ℤ -> ℤ -> ℤ
axiom infix_sl'def (y : ℤ) (x : ℤ) (fact0 : ¬y = (0 : ℤ)) : infix_sl x y = x / y
axiom comb : ℤ -> ℤ -> ℤ
axiom comb'def (k : ℤ) (n : ℤ) (fact0 : (0 : ℤ) ≤ k) (fact1 : k ≤ n) : if k = (0 : ℤ) ∨ k = n then comb n k = (1 : ℤ) else comb n k = comb (n - (1 : ℤ)) k + comb (n - (1 : ℤ)) (k - (1 : ℤ))
axiom comb'spec (k : ℤ) (n : ℤ) (fact0 : (0 : ℤ) ≤ k) (fact1 : k ≤ n) : (1 : ℤ) ≤ comb n k
theorem prop2'vc (k : ℤ) (n : ℤ) (fact0 : (1 : ℤ) ≤ k) (fact1 : k ≤ n) : k * comb n k = comb n (k - (1 : ℤ)) * (n - k + (1 : ℤ))
  := sorry
end binomial_Top_prop2qtvc

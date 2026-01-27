import Why3.Base
open Classical
open Lean4Why3
namespace word_common_factor_Top_powerqtvc
axiom char : Type
axiom inhabited_axiom_char : Inhabited char
attribute [instance] inhabited_axiom_char
theorem power'vc (n : ℤ) (fact0 : (0 : ℤ) ≤ n) (fact1 : ¬n = (0 : ℤ)) : let o1 : ℤ := n - (1 : ℤ); ((0 : ℤ) ≤ n ∧ o1 < n) ∧ (0 : ℤ) ≤ o1
  := sorry
end word_common_factor_Top_powerqtvc

import Why3.Base
open Classical
open Lean4Why3
namespace word_common_factor_Top_power_addqtvc
axiom char : Type
axiom inhabited_axiom_char : Inhabited char
attribute [instance] inhabited_axiom_char
axiom power : List char -> ℤ -> List char
axiom power'def (n : ℤ) (w : List char) (fact0 : (0 : ℤ) ≤ n) : if n = (0 : ℤ) then power w n = ([] : List char) else power w n = w ++ power w (n - (1 : ℤ))
theorem power_add'vc (n1 : ℤ) (n2 : ℤ) (w : List char) (fact0 : (0 : ℤ) ≤ n1) (fact1 : (0 : ℤ) ≤ n2) : power w (n1 + n2) = power w n1 ++ power w n2
  := sorry
end word_common_factor_Top_power_addqtvc

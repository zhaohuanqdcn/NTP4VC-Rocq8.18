import Why3.Base
open Classical
open Lean4Why3
namespace strassen_MaxFun_max_extqtvc
axiom maxf : (ℤ -> ℤ) -> ℤ -> ℤ -> ℤ
axiom maxf'def (b : ℤ) (a : ℤ) (f : ℤ -> ℤ) : if b ≤ a then maxf f a b = (0 : ℤ) else maxf f a b = max (maxf f a (b - (1 : ℤ))) (f (b - (1 : ℤ)))
theorem max_ext'vc (a : ℤ) (b : ℤ) (f : ℤ -> ℤ) (g : ℤ -> ℤ) (fact0 : a < b) (fact1 : ∀(i : ℤ), a ≤ i ∧ i < b → f i = g i) : maxf f a b = maxf g a b
  := sorry
end strassen_MaxFun_max_extqtvc

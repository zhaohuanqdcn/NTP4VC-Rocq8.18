import Why3.Base
open Classical
open Lean4Why3
namespace strassen_MaxFun_max_constantqtvc
axiom maxf : (ℤ -> ℤ) -> ℤ -> ℤ -> ℤ
axiom maxf'def (b : ℤ) (a : ℤ) (f : ℤ -> ℤ) : if b ≤ a then maxf f a b = (0 : ℤ) else maxf f a b = max (maxf f a (b - (1 : ℤ))) (f (b - (1 : ℤ)))
theorem max_constant'vc (v : ℤ) (a : ℤ) (b : ℤ) (f : ℤ -> ℤ) (fact0 : (0 : ℤ) ≤ v) (fact1 : a < b) (fact2 : ∀(i : ℤ), a ≤ i ∧ i < b → f i = v) : maxf f a b = v
  := sorry
end strassen_MaxFun_max_constantqtvc

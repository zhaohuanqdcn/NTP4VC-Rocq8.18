import Why3.Base
open Classical
open Lean4Why3
namespace strassen_MaxFun_maxf_nonnegqtvc
axiom maxf : (ℤ -> ℤ) -> ℤ -> ℤ -> ℤ
axiom maxf'def (b : ℤ) (a : ℤ) (f : ℤ -> ℤ) : if b ≤ a then maxf f a b = (0 : ℤ) else maxf f a b = max (maxf f a (b - (1 : ℤ))) (f (b - (1 : ℤ)))
theorem maxf_nonneg'vc (a : ℤ) (b : ℤ) (f : ℤ -> ℤ) (fact0 : a ≤ b) : (0 : ℤ) ≤ maxf f a b
  := sorry
end strassen_MaxFun_maxf_nonnegqtvc

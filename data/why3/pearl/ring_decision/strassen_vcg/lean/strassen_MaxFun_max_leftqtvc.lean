import Why3.Base
open Classical
open Lean4Why3
namespace strassen_MaxFun_max_leftqtvc
axiom maxf : (ℤ -> ℤ) -> ℤ -> ℤ -> ℤ
axiom maxf'def (b : ℤ) (a : ℤ) (f : ℤ -> ℤ) : if b ≤ a then maxf f a b = (0 : ℤ) else maxf f a b = max (maxf f a (b - (1 : ℤ))) (f (b - (1 : ℤ)))
theorem max_left'vc (a : ℤ) (b : ℤ) (f : ℤ -> ℤ) (fact0 : a < b) : maxf f a b = max (f a) (maxf f (a + (1 : ℤ)) b)
  := sorry
end strassen_MaxFun_max_leftqtvc

import Why3.Base
import Why3.why3.Ref.Ref
import Why3.real.Sum
import Why3.ieee_float.RoundingMode
import Why3.ufloat.UDouble
import Why3.ufloat.HelperLemmas
import Why3.ufloat.UDoubleLemmas
open Classical
open Lean4Why3
namespace sum_SumDouble_usumqtvc
axiom abs_real_fun : (ℤ -> UDouble.udouble) -> ℤ -> ℝ
axiom abs_real_fun'def (f : ℤ -> UDouble.udouble) (i : ℤ) : abs_real_fun f i = abs (UDouble.to_real (f i))
theorem usum'vc (n : ℤ) (f : ℤ -> UDouble.udouble) (fact0 : (0 : ℤ) ≤ n) : let o1 : ℤ := n - (1 : ℤ); ((0 : ℤ) ≤ o1 + (1 : ℤ) → abs (UDouble.to_real UDouble.u0 - real.Sum.sum (UDoubleLemmas.real_fun f) (0 : ℤ) (0 : ℤ)) ≤ real.Sum.sum (abs_real_fun f) (0 : ℤ) (0 : ℤ) * (UDouble.eps * Int.to_Real (0 : ℤ)) ∧ (∀(s : UDouble.udouble), (∀(i : ℤ), ((0 : ℤ) ≤ i ∧ i ≤ o1) ∧ abs (UDouble.to_real s - real.Sum.sum (UDoubleLemmas.real_fun f) (0 : ℤ) i) ≤ real.Sum.sum (abs_real_fun f) (0 : ℤ) i * (UDouble.eps * Int.to_Real i) → abs (UDouble.to_real (UDouble.uadd s (f i)) - real.Sum.sum (UDoubleLemmas.real_fun f) (0 : ℤ) (i + (1 : ℤ))) ≤ real.Sum.sum (abs_real_fun f) (0 : ℤ) (i + (1 : ℤ)) * (UDouble.eps * Int.to_Real (i + (1 : ℤ)))) ∧ (abs (UDouble.to_real s - real.Sum.sum (UDoubleLemmas.real_fun f) (0 : ℤ) (o1 + (1 : ℤ))) ≤ real.Sum.sum (abs_real_fun f) (0 : ℤ) (o1 + (1 : ℤ)) * (UDouble.eps * Int.to_Real (o1 + (1 : ℤ))) → abs (UDouble.to_real s - real.Sum.sum (UDoubleLemmas.real_fun f) (0 : ℤ) n) ≤ real.Sum.sum (abs_real_fun f) (0 : ℤ) n * (UDouble.eps * Int.to_Real n)))) ∧ (o1 + (1 : ℤ) < (0 : ℤ) → abs (UDouble.to_real UDouble.u0 - real.Sum.sum (UDoubleLemmas.real_fun f) (0 : ℤ) n) ≤ real.Sum.sum (abs_real_fun f) (0 : ℤ) n * (UDouble.eps * Int.to_Real n))
  := sorry
end sum_SumDouble_usumqtvc

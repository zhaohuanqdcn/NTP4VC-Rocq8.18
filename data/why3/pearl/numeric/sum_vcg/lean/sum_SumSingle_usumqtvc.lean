import Why3.Base
import Why3.why3.Ref.Ref
import Why3.real.Sum
import Why3.ieee_float.RoundingMode
import Why3.ufloat.USingle
import Why3.ufloat.HelperLemmas
import Why3.ufloat.USingleLemmas
open Classical
open Lean4Why3
namespace sum_SumSingle_usumqtvc
axiom abs_real_fun : (ℤ -> USingle.usingle) -> ℤ -> ℝ
axiom abs_real_fun'def (f : ℤ -> USingle.usingle) (i : ℤ) : abs_real_fun f i = abs (USingle.to_real (f i))
theorem usum'vc (n : ℤ) (f : ℤ -> USingle.usingle) (fact0 : (0 : ℤ) ≤ n) : let o1 : ℤ := n - (1 : ℤ); ((0 : ℤ) ≤ o1 + (1 : ℤ) → abs (USingle.to_real USingle.u0 - real.Sum.sum (USingleLemmas.real_fun f) (0 : ℤ) (0 : ℤ)) ≤ real.Sum.sum (abs_real_fun f) (0 : ℤ) (0 : ℤ) * (USingle.eps * Int.to_Real (0 : ℤ)) ∧ (∀(s : USingle.usingle), (∀(i : ℤ), ((0 : ℤ) ≤ i ∧ i ≤ o1) ∧ abs (USingle.to_real s - real.Sum.sum (USingleLemmas.real_fun f) (0 : ℤ) i) ≤ real.Sum.sum (abs_real_fun f) (0 : ℤ) i * (USingle.eps * Int.to_Real i) → abs (USingle.to_real (USingle.uadd s (f i)) - real.Sum.sum (USingleLemmas.real_fun f) (0 : ℤ) (i + (1 : ℤ))) ≤ real.Sum.sum (abs_real_fun f) (0 : ℤ) (i + (1 : ℤ)) * (USingle.eps * Int.to_Real (i + (1 : ℤ)))) ∧ (abs (USingle.to_real s - real.Sum.sum (USingleLemmas.real_fun f) (0 : ℤ) (o1 + (1 : ℤ))) ≤ real.Sum.sum (abs_real_fun f) (0 : ℤ) (o1 + (1 : ℤ)) * (USingle.eps * Int.to_Real (o1 + (1 : ℤ))) → abs (USingle.to_real s - real.Sum.sum (USingleLemmas.real_fun f) (0 : ℤ) n) ≤ real.Sum.sum (abs_real_fun f) (0 : ℤ) n * (USingle.eps * Int.to_Real n)))) ∧ (o1 + (1 : ℤ) < (0 : ℤ) → abs (USingle.to_real USingle.u0 - real.Sum.sum (USingleLemmas.real_fun f) (0 : ℤ) n) ≤ real.Sum.sum (abs_real_fun f) (0 : ℤ) n * (USingle.eps * Int.to_Real n))
  := sorry
end sum_SumSingle_usumqtvc

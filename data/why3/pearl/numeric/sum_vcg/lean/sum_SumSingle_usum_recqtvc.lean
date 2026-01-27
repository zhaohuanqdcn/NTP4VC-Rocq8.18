import Why3.Base
import Why3.why3.Ref.Ref
import Why3.real.Sum
import Why3.ieee_float.RoundingMode
import Why3.ufloat.USingle
import Why3.ufloat.HelperLemmas
import Why3.ufloat.USingleLemmas
open Classical
open Lean4Why3
namespace sum_SumSingle_usum_recqtvc
axiom abs_real_fun : (ℤ -> USingle.usingle) -> ℤ -> ℝ
axiom abs_real_fun'def (f : ℤ -> USingle.usingle) (i : ℤ) : abs_real_fun f i = abs (USingle.to_real (f i))
theorem usum_rec'vc (n : ℤ) (f : ℤ -> USingle.usingle) (fact0 : (0 : ℤ) ≤ n) : (¬n = (0 : ℤ) → (let o1 : ℤ := n - (1 : ℤ); ((0 : ℤ) ≤ n ∧ o1 < n) ∧ (0 : ℤ) ≤ o1)) ∧ (∀(result : USingle.usingle), (if n = (0 : ℤ) then result = USingle.uzero else let o1 : ℤ := n - (1 : ℤ); ∃(o2 : USingle.usingle), abs (USingle.to_real o2 - real.Sum.sum (USingleLemmas.real_fun f) (0 : ℤ) o1) ≤ real.Sum.sum (abs_real_fun f) (0 : ℤ) o1 * (USingle.eps * Int.to_Real o1) ∧ result = USingle.uadd o2 (f (n - (1 : ℤ)))) → abs (USingle.to_real result - real.Sum.sum (USingleLemmas.real_fun f) (0 : ℤ) n) ≤ real.Sum.sum (abs_real_fun f) (0 : ℤ) n * (USingle.eps * Int.to_Real n))
  := sorry
end sum_SumSingle_usum_recqtvc

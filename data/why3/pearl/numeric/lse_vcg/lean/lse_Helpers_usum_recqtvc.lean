import Why3.Base
import Why3.real.Sum
import Why3.ieee_float.RoundingMode
import Why3.ufloat.USingle
import Why3.ufloat.HelperLemmas
import Why3.ufloat.USingleLemmas
open Classical
open Lean4Why3
namespace lse_Helpers_usum_recqtvc
axiom abs_fun : (ℤ -> ℝ) -> ℤ -> ℝ
axiom abs_fun'def (f : ℤ -> ℝ) (i : ℤ) : abs_fun f i = abs (f i)
axiom abs_real_fun : (ℤ -> USingle.usingle) -> ℤ -> ℝ
axiom abs_real_fun'def (f : ℤ -> USingle.usingle) (i : ℤ) : abs_real_fun f i = abs_fun (USingleLemmas.real_fun f) i
theorem usum_rec'vc (b : ℤ) (a : ℤ) (f : ℤ -> USingle.usingle) (fact0 : (0 : ℤ) ≤ b - a) : let o1 : ℤ := b - a; (¬o1 ≤ (0 : ℤ) → ¬b - a = (1 : ℤ) → (let o2 : ℤ := b - (1 : ℤ); ((0 : ℤ) ≤ b - a ∧ o2 - a < b - a) ∧ (0 : ℤ) ≤ o2 - a)) ∧ (∀(result : USingle.usingle), (if o1 ≤ (0 : ℤ) then result = USingle.uzero else if b - a = (1 : ℤ) then result = f (b - (1 : ℤ)) else let o2 : ℤ := b - (1 : ℤ); ∃(o3 : USingle.usingle), abs (USingle.to_real o3 - real.Sum.sum (USingleLemmas.real_fun f) a o2) ≤ real.Sum.sum (abs_real_fun f) a o2 * (USingle.eps * Int.to_Real (o2 - a)) ∧ result = USingle.uadd o3 (f (b - (1 : ℤ)))) → abs (USingle.to_real result - real.Sum.sum (USingleLemmas.real_fun f) a b) ≤ real.Sum.sum (abs_real_fun f) a b * (USingle.eps * Int.to_Real (b - a)))
  := sorry
end lse_Helpers_usum_recqtvc

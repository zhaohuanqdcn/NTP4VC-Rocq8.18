import Why3.Base
import Why3.why3.Ref.Ref
import Why3.real.Sum
import Why3.ieee_float.RoundingMode
import Why3.ufloat.UDouble
import Why3.ufloat.HelperLemmas
import Why3.ufloat.UDoubleLemmas
open Classical
open Lean4Why3
namespace sum_SumDouble_usum_recqtvc
axiom abs_real_fun : (ℤ -> UDouble.udouble) -> ℤ -> ℝ
axiom abs_real_fun'def (f : ℤ -> UDouble.udouble) (i : ℤ) : abs_real_fun f i = abs (UDouble.to_real (f i))
theorem usum_rec'vc (n : ℤ) (f : ℤ -> UDouble.udouble) (fact0 : (0 : ℤ) ≤ n) : (¬n = (0 : ℤ) → (let o1 : ℤ := n - (1 : ℤ); ((0 : ℤ) ≤ n ∧ o1 < n) ∧ (0 : ℤ) ≤ o1)) ∧ (∀(result : UDouble.udouble), (if n = (0 : ℤ) then result = UDouble.uzero else let o1 : ℤ := n - (1 : ℤ); ∃(o2 : UDouble.udouble), abs (UDouble.to_real o2 - real.Sum.sum (UDoubleLemmas.real_fun f) (0 : ℤ) o1) ≤ real.Sum.sum (abs_real_fun f) (0 : ℤ) o1 * (UDouble.eps * Int.to_Real o1) ∧ result = UDouble.uadd o2 (f (n - (1 : ℤ)))) → abs (UDouble.to_real result - real.Sum.sum (UDoubleLemmas.real_fun f) (0 : ℤ) n) ≤ real.Sum.sum (abs_real_fun f) (0 : ℤ) n * (UDouble.eps * Int.to_Real n))
  := sorry
end sum_SumDouble_usum_recqtvc

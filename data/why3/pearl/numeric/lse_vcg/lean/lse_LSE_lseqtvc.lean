import Why3.Base
import Why3.why3.Ref.Ref
import Why3.real.Sum
import pearl.numeric.lib.lean.lse.Helpers
import Why3.ieee_float.RoundingMode
import Why3.ufloat.USingle
import Why3.ufloat.HelperLemmas
import Why3.ufloat.USingleLemmas
open Classical
open Lean4Why3
namespace lse_LSE_lseqtvc
axiom exp_of_f : (ℤ -> USingle.usingle) -> ℤ -> ℝ
axiom exp_of_f'def (f : ℤ -> USingle.usingle) (i : ℤ) : exp_of_f f i = Real.exp (USingleLemmas.real_fun f i)
theorem lse'vc (n : ℤ) (f' : ℤ -> USingle.usingle) (f : ℤ -> USingle.usingle) (fact0 : (0 : ℤ) < n) (fact1 : n < (8388608 : ℤ)) (fact2 : ∀(i : ℤ), f' i = Helpers.exp_approx (f i)) : (0 : ℤ) ≤ n - (0 : ℤ) ∧ (let s : USingle.usingle := Helpers.usum_rec f' (0 : ℤ) n; abs (USingle.to_real s - real.Sum.sum (USingleLemmas.real_fun f') (0 : ℤ) n) ≤ real.Sum.sum (Helpers.abs_real_fun f') (0 : ℤ) n * (USingle.eps * Int.to_Real (n - (0 : ℤ))) → (let o1 : ℝ := Helpers.exp_error; let o2 : ℝ := USingle.eps * Int.to_Real n; let o3 : ℤ -> ℝ := Helpers.abs_real_fun f'; ((∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < n → abs (USingleLemmas.real_fun f' i - exp_of_f f i) ≤ o1 * exp_of_f f i + (0 : ℝ)) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < n → exp_of_f f i - o1 * exp_of_f f i - (0 : ℝ) ≤ o3 i ∧ o3 i ≤ exp_of_f f i + o1 * exp_of_f f i + (0 : ℝ)) ∧ abs (USingle.to_real s - real.Sum.sum (USingleLemmas.real_fun f') (0 : ℤ) n) ≤ o2 * real.Sum.sum o3 (0 : ℤ) n + (0 : ℝ) ∧ (0 : ℝ) ≤ o2 ∧ (0 : ℤ) ≤ n) ∧ (abs (USingle.to_real s - real.Sum.sum (exp_of_f f) (0 : ℤ) n) ≤ (o1 + o2 * ((1 : ℝ) + o1)) * real.Sum.sum (exp_of_f f) (0 : ℤ) n + ((0 : ℝ) * Int.to_Real n * ((1 : ℝ) + o2) + (0 : ℝ)) → ((0 : ℤ) < n ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < n → (0 : ℝ) < USingle.to_real (f' i))) ∧ ((0 : ℝ) < USingle.to_real (Helpers.usum_rec f' (0 : ℤ) n) → (let o4 : ℤ -> ℝ := exp_of_f f; ((0 : ℤ) < n ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < n → (0 : ℝ) < o4 i)) ∧ ((0 : ℝ) < real.Sum.sum o4 (0 : ℤ) n ∧ real.Sum.sum o4 (0 : ℤ) n = real.Sum.sum (Helpers.abs_fun o4) (0 : ℤ) n → (0 : ℝ) < USingle.to_real s ∧ (let result : USingle.usingle := Helpers.log_approx s; abs (USingle.to_real result - Real.log (USingle.to_real s)) ≤ abs (Real.log (USingle.to_real s)) * Helpers.log_error → abs (USingle.to_real result - Real.log (real.Sum.sum (exp_of_f f) (0 : ℤ) n)) ≤ abs (Real.log (real.Sum.sum (exp_of_f f) (0 : ℤ) n)) * Helpers.log_error - Real.log ((1 : ℝ) - (Helpers.exp_error + Int.to_Real n * USingle.eps * ((1 : ℝ) + Helpers.exp_error))) * ((1 : ℝ) + Helpers.log_error))))))))
  := sorry
end lse_LSE_lseqtvc

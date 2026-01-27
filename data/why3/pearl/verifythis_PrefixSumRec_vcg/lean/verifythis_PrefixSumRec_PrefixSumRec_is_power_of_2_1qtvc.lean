import Why3.Base
import Why3.int.Sum
open Classical
open Lean4Why3
namespace verifythis_PrefixSumRec_PrefixSumRec_is_power_of_2_1qtvc
noncomputable def is_power_of_2 (x : ℤ) := ∃(k : ℤ), (0 : ℤ) ≤ k ∧ x = HPow.hPow (2 : ℤ) (Int.toNat k)
theorem is_power_of_2_1'vc (x : ℤ) (fact0 : is_power_of_2 x) (fact1 : (1 : ℤ) < x) : (2 : ℤ) * Int.tdiv x (2 : ℤ) = x
  := sorry
end verifythis_PrefixSumRec_PrefixSumRec_is_power_of_2_1qtvc

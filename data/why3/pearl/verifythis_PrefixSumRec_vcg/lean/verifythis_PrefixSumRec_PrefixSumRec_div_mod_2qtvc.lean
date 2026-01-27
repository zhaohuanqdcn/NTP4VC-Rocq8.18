import Why3.Base
import Why3.int.Sum
open Classical
open Lean4Why3
namespace verifythis_PrefixSumRec_PrefixSumRec_div_mod_2qtvc
theorem div_mod_2'vc (x : ℤ) (fact0 : (0 : ℤ) ≤ x) : (2 : ℤ) * Int.tdiv x (2 : ℤ) ≤ x ∧ x - (1 : ℤ) ≤ (2 : ℤ) * Int.tdiv x (2 : ℤ)
  := sorry
end verifythis_PrefixSumRec_PrefixSumRec_div_mod_2qtvc

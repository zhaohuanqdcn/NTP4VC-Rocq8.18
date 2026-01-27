import Why3.Base
import Why3.why3.WellFounded.WellFounded
import Why3.int.NumOf
import pearl.hackers_delight_vcg.lean.hackers_delight.Utils
open Classical
open Lean4Why3
namespace hackers_delight_Utils_Spec_numof_shiftqtvc
theorem numof_shift'vc (q : ℤ -> Bool) (p : ℤ -> Bool) (k : ℤ) (a : ℤ) (b : ℤ) (fact0 : ∀(i : ℤ), q i = p (i + k)) : NumOf.numof p (a + k) (b + k) = NumOf.numof q a b
  := sorry
end hackers_delight_Utils_Spec_numof_shiftqtvc

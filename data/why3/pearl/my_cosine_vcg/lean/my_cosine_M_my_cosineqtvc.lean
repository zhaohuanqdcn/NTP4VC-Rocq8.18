import Why3.Base
import Why3.floating_point.Rounding
import Why3.floating_point.SingleFormat
import Why3.floating_point.Single
open Classical
open Lean4Why3
namespace my_cosine_M_my_cosineqtvc
theorem my_cosine'vc (x : SingleFormat.single) (o1 : SingleFormat.single) (fact0 : abs (Single.value x) ≤ (1 : ℝ) / 32) (fact1 : Single.value o1 = (1 : ℝ) / 2) : Single.no_overflow Rounding.mode.NearestTiesToEven (Single.value x * Single.value x) ∧ (∀(o2 : SingleFormat.single), Single.value o2 = Single.round Rounding.mode.NearestTiesToEven (Single.value x * Single.value x) → Single.no_overflow Rounding.mode.NearestTiesToEven (Single.value o2 * Single.value o1) ∧ (∀(o3 : SingleFormat.single), Single.value o3 = Single.round Rounding.mode.NearestTiesToEven (Single.value o2 * Single.value o1) → (∀(o4 : SingleFormat.single), Single.value o4 = (1 : ℝ) → Single.no_overflow Rounding.mode.NearestTiesToEven (Single.value o4 - Single.value o3) ∧ (∀(result : SingleFormat.single), Single.value result = Single.round Rounding.mode.NearestTiesToEven (Single.value o4 - Single.value o3) → abs (Single.value result - Real.cos (Single.value x)) ≤ (1 : ℝ) / 8388608))))
  := sorry
end my_cosine_M_my_cosineqtvc

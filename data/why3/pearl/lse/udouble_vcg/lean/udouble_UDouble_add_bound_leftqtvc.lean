import Why3.Base
import Why3.ieee_float.RoundingMode
open Classical
open Lean4Why3
namespace udouble_UDouble_add_bound_leftqtvc
axiom udouble : Type
axiom inhabited_axiom_udouble : Inhabited udouble
attribute [instance] inhabited_axiom_udouble
axiom to_real : udouble -> ℝ
axiom uround : RoundingMode.mode -> ℝ -> udouble
axiom uround_exact (m : RoundingMode.mode) (x : udouble) : uround m (to_real x) = x
axiom uzero : udouble
axiom to_real_uzero : to_real uzero = (0 : ℝ)
axiom utwo : udouble
axiom to_real_utwo : to_real utwo = (2 : ℝ)
noncomputable def uadd (x : udouble) (y : udouble) := uround RoundingMode.mode.RNE (to_real x + to_real y)
noncomputable def usub (x : udouble) (y : udouble) := uround RoundingMode.mode.RNE (to_real x - to_real y)
noncomputable def umul (x : udouble) (y : udouble) := uround RoundingMode.mode.RNE (to_real x * to_real y)
noncomputable def udiv (x : udouble) (y : udouble) := uround RoundingMode.mode.RNE (to_real x / to_real y)
noncomputable def uminus (x : udouble) := uround RoundingMode.mode.RNE (-to_real x)
theorem add_bound_left'vc (x : udouble) (y : udouble) : abs (to_real (uadd x y) - (to_real x + to_real y)) ≤ abs (to_real x)
  := sorry
end udouble_UDouble_add_bound_leftqtvc

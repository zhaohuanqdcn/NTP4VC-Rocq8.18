import Why3.Base
import Why3.ieee_float.RoundingMode
open Classical
open Lean4Why3
namespace udouble_UDouble_mul_roundingqtvc
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
theorem mul_rounding'vc (x : udouble) (y : udouble) : abs (to_real (umul x y) - to_real x * to_real y) ≤ abs (to_real x * to_real y) * ((1 : ℝ) / 9007199254740992 / ((1 : ℝ) + (1 : ℝ) / 9007199254740992)) + (1 : ℝ) / 404804506614621236704990693437834614099113299528284236713802716054860679135990693783920767402874248990374155728633623822779617474771586953734026799881477019843034848553132722728933815484186432682479535356945490137124014966849385397236206711298319112681620113024717539104666829230461005064372655017292012526615415482186989568
  := sorry
end udouble_UDouble_mul_roundingqtvc

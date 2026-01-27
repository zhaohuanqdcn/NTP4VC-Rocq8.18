import Why3.Base
import Why3.ieee_float.RoundingMode
open Classical
open Lean4Why3
namespace UDouble
axiom udouble : Type
axiom inhabited_axiom_udouble : Inhabited udouble
attribute [instance] inhabited_axiom_udouble
noncomputable def eps := (1 : ℝ) / 9007199254740992 / ((1 : ℝ) + (1 : ℝ) / 9007199254740992)
noncomputable def eta := (1 : ℝ) / 404804506614621236704990693437834614099113299528284236713802716054860679135990693783920767402874248990374155728633623822779617474771586953734026799881477019843034848553132722728933815484186432682479535356945490137124014966849385397236206711298319112681620113024717539104666829230461005064372655017292012526615415482186989568
axiom uround : RoundingMode.mode -> ℝ -> udouble
axiom to_real : udouble -> ℝ
axiom of_int : ℤ -> udouble
axiom to_real_of_int (x : ℤ) : to_real (of_int x) = Int.to_Real x
axiom uzero : udouble
axiom uzero_spec : to_real uzero = (0 : ℝ)
axiom uone : udouble
axiom uone_spec : to_real uone = (1 : ℝ)
axiom utwo : udouble
axiom utwo_spec : to_real utwo = (2 : ℝ)
axiom eps_bounds : (0 : ℝ) < eps ∧ eps < (1 : ℝ)
axiom eta_bounds : (0 : ℝ) < eta ∧ eta < (1 : ℝ)
noncomputable def uadd (x : udouble) (y : udouble) := uround RoundingMode.mode.RNE (to_real x + to_real y)
axiom uadd'spec'1 (x : udouble) (y : udouble) : abs (to_real (uadd x y) - (to_real x + to_real y)) ≤ abs (to_real x)
axiom uadd'spec'0 (x : udouble) (y : udouble) : abs (to_real (uadd x y) - (to_real x + to_real y)) ≤ abs (to_real y)
axiom uadd'spec (x : udouble) (y : udouble) : abs (to_real (uadd x y) - (to_real x + to_real y)) ≤ abs (to_real x + to_real y) * eps
noncomputable def usub (x : udouble) (y : udouble) := uround RoundingMode.mode.RNE (to_real x - to_real y)
axiom usub'spec'1 (x : udouble) (y : udouble) : abs (to_real (usub x y) - (to_real x - to_real y)) ≤ abs (to_real x)
axiom usub'spec'0 (x : udouble) (y : udouble) : abs (to_real (usub x y) - (to_real x - to_real y)) ≤ abs (to_real y)
axiom usub'spec (x : udouble) (y : udouble) : abs (to_real (usub x y) - (to_real x - to_real y)) ≤ abs (to_real x - to_real y) * eps
noncomputable def umul (x : udouble) (y : udouble) := uround RoundingMode.mode.RNE (to_real x * to_real y)
axiom umul'spec (x : udouble) (y : udouble) : abs (to_real (umul x y) - to_real x * to_real y) ≤ abs (to_real x * to_real y) * eps + eta
axiom udiv : udouble -> udouble -> udouble
axiom udiv'def (y : udouble) (x : udouble) (fact0 : ¬to_real y = (0 : ℝ)) : udiv x y = uround RoundingMode.mode.RNE (to_real x / to_real y)
axiom udiv'spec (y : udouble) (x : udouble) (fact0 : ¬to_real y = (0 : ℝ)) : abs (to_real (udiv x y) - to_real x / to_real y) ≤ abs (to_real x / to_real y) * eps + eta
noncomputable def uminus (x : udouble) := uround RoundingMode.mode.RNE (-to_real x)
axiom uminus'spec (x : udouble) : to_real (uminus x) = -to_real x
axiom is_exact : (udouble -> udouble -> udouble) -> udouble -> udouble -> Prop
axiom udiv_exact : udouble -> udouble -> udouble
axiom udiv_closure : udouble -> udouble -> udouble
axiom udiv_closure_def (y : udouble) (y1 : udouble) : udiv_closure y y1 = udiv y y1
axiom udiv_exact'def (y : udouble) (x : udouble) (fact0 : ¬to_real y = (0 : ℝ)) (fact1 : is_exact udiv_closure x y) : udiv_exact x y = uround RoundingMode.mode.RNE (to_real x / to_real y)
axiom udiv_exact'spec (y : udouble) (x : udouble) (fact0 : ¬to_real y = (0 : ℝ)) (fact1 : is_exact udiv_closure x y) : abs (to_real (udiv_exact x y) - to_real x / to_real y) ≤ eta
axiom infix_slsldot : udouble -> udouble -> udouble
axiom infix_slsldot'def (y : udouble) (x : udouble) (fact0 : ¬to_real y = (0 : ℝ)) : infix_slsldot x y = udiv x y
axiom infix_slslsldot : udouble -> udouble -> udouble
axiom infix_slslsldot'def (y : udouble) (x : udouble) (fact0 : ¬to_real y = (0 : ℝ)) (fact1 : is_exact udiv_closure x y) : infix_slslsldot x y = udiv_exact x y
axiom u0 : udouble
axiom to_real_u0 : to_real u0 = (0 : ℝ)
axiom u1 : udouble
axiom to_real_u1 : to_real u1 = (1 : ℝ)
axiom u2 : udouble
axiom to_real_u2 : to_real u2 = (2 : ℝ)
axiom u4 : udouble
axiom to_real_u4 : to_real u4 = (4 : ℝ)
axiom u8 : udouble
axiom to_real_u8 : to_real u8 = (8 : ℝ)
axiom u16 : udouble
axiom to_real_u16 : to_real u16 = (16 : ℝ)
axiom u32 : udouble
axiom to_real_u32 : to_real u32 = (32 : ℝ)
axiom u64 : udouble
axiom to_real_u64 : to_real u64 = (64 : ℝ)
axiom u128 : udouble
axiom to_real_u128 : to_real u128 = (128 : ℝ)
axiom u256 : udouble
axiom to_real_u256 : to_real u256 = (256 : ℝ)
axiom u512 : udouble
axiom to_real_u512 : to_real u512 = (512 : ℝ)
axiom u1024 : udouble
axiom to_real_u1024 : to_real u1024 = (1024 : ℝ)
axiom u2048 : udouble
axiom to_real_u2048 : to_real u2048 = (2048 : ℝ)
axiom u4096 : udouble
axiom to_real_u4096 : to_real u4096 = (4096 : ℝ)
axiom u8192 : udouble
axiom to_real_u8192 : to_real u8192 = (8192 : ℝ)
axiom u16384 : udouble
axiom to_real_u16384 : to_real u16384 = (16384 : ℝ)
axiom u32768 : udouble
axiom to_real_u32768 : to_real u32768 = (32768 : ℝ)
axiom u65536 : udouble
axiom to_real_u65536 : to_real u65536 = (65536 : ℝ)
noncomputable def is_positive_power_of_2 (x : udouble) := x = u1 ∨ x = u2 ∨ x = u4 ∨ x = u8 ∨ x = u16 ∨ x = u32 ∨ x = u64 ∨ x = u128 ∨ x = u256 ∨ x = u4096 ∨ x = u8192 ∨ x = u16384 ∨ x = u32768 ∨ x = u65536
axiom div_by_positive_power_of_2_is_exact (y : udouble) (x : udouble) (fact0 : is_positive_power_of_2 y) : is_exact udiv_closure x y
end UDouble

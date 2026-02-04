namespace RoundingMode
inductive mode where
  | RNE : mode
  | RNA : mode
  | RTP : mode
  | RTN : mode
  | RTZ : mode
axiom inhabited_axiom_mode : Inhabited mode
attribute [instance] inhabited_axiom_mode
noncomputable def to_nearest (m : mode) := m = mode.RNE ∨ m = mode.RNA
end RoundingMode
namespace USingle
axiom usingle : Type
axiom inhabited_axiom_usingle : Inhabited usingle
attribute [instance] inhabited_axiom_usingle
noncomputable def eps := (1 : ℝ) / 16777216 / ((1 : ℝ) + (1 : ℝ) / 16777216)
noncomputable def eta := (1 : ℝ) / 1427247692705959881058285969449495136382746624
axiom uround : RoundingMode.mode -> ℝ -> usingle
axiom to_real : usingle -> ℝ
axiom of_int : ℤ -> usingle
axiom to_real_of_int (x : ℤ) : to_real (of_int x) = Int.to_Real x
axiom uzero : usingle
axiom uzero_spec : to_real uzero = (0 : ℝ)
axiom uone : usingle
axiom uone_spec : to_real uone = (1 : ℝ)
axiom utwo : usingle
axiom utwo_spec : to_real utwo = (2 : ℝ)
axiom eps_bounds : (0 : ℝ) < eps ∧ eps < (1 : ℝ)
axiom eta_bounds : (0 : ℝ) < eta ∧ eta < (1 : ℝ)
noncomputable def uadd (x : usingle) (y : usingle) := uround RoundingMode.mode.RNE (to_real x + to_real y)
axiom uadd'spec'1 (x : usingle) (y : usingle) : abs (to_real (uadd x y) - (to_real x + to_real y)) ≤ abs (to_real x)
axiom uadd'spec'0 (x : usingle) (y : usingle) : abs (to_real (uadd x y) - (to_real x + to_real y)) ≤ abs (to_real y)
axiom uadd'spec (x : usingle) (y : usingle) : abs (to_real (uadd x y) - (to_real x + to_real y)) ≤ abs (to_real x + to_real y) * eps
noncomputable def usub (x : usingle) (y : usingle) := uround RoundingMode.mode.RNE (to_real x - to_real y)
axiom usub'spec'1 (x : usingle) (y : usingle) : abs (to_real (usub x y) - (to_real x - to_real y)) ≤ abs (to_real x)
axiom usub'spec'0 (x : usingle) (y : usingle) : abs (to_real (usub x y) - (to_real x - to_real y)) ≤ abs (to_real y)
axiom usub'spec (x : usingle) (y : usingle) : abs (to_real (usub x y) - (to_real x - to_real y)) ≤ abs (to_real x - to_real y) * eps
noncomputable def umul (x : usingle) (y : usingle) := uround RoundingMode.mode.RNE (to_real x * to_real y)
axiom umul'spec (x : usingle) (y : usingle) : abs (to_real (umul x y) - to_real x * to_real y) ≤ abs (to_real x * to_real y) * eps + eta
axiom udiv : usingle -> usingle -> usingle
axiom udiv'def (y : usingle) (x : usingle) (fact0 : ¬to_real y = (0 : ℝ)) : udiv x y = uround RoundingMode.mode.RNE (to_real x / to_real y)
axiom udiv'spec (y : usingle) (x : usingle) (fact0 : ¬to_real y = (0 : ℝ)) : abs (to_real (udiv x y) - to_real x / to_real y) ≤ abs (to_real x / to_real y) * eps + eta
noncomputable def uminus (x : usingle) := uround RoundingMode.mode.RNE (-to_real x)
axiom uminus'spec (x : usingle) : to_real (uminus x) = -to_real x
axiom is_exact : (usingle -> usingle -> usingle) -> usingle -> usingle -> Prop
axiom udiv_exact : usingle -> usingle -> usingle
axiom udiv_closure : usingle -> usingle -> usingle
axiom udiv_closure_def (y : usingle) (y1 : usingle) : udiv_closure y y1 = udiv y y1
axiom udiv_exact'def (y : usingle) (x : usingle) (fact0 : ¬to_real y = (0 : ℝ)) (fact1 : is_exact udiv_closure x y) : udiv_exact x y = uround RoundingMode.mode.RNE (to_real x / to_real y)
axiom udiv_exact'spec (y : usingle) (x : usingle) (fact0 : ¬to_real y = (0 : ℝ)) (fact1 : is_exact udiv_closure x y) : abs (to_real (udiv_exact x y) - to_real x / to_real y) ≤ eta
axiom infix_slsldot : usingle -> usingle -> usingle
axiom infix_slsldot'def (y : usingle) (x : usingle) (fact0 : ¬to_real y = (0 : ℝ)) : infix_slsldot x y = udiv x y
axiom infix_slslsldot : usingle -> usingle -> usingle
axiom infix_slslsldot'def (y : usingle) (x : usingle) (fact0 : ¬to_real y = (0 : ℝ)) (fact1 : is_exact udiv_closure x y) : infix_slslsldot x y = udiv_exact x y
axiom u0 : usingle
axiom to_real_u0 : to_real u0 = (0 : ℝ)
axiom u1 : usingle
axiom to_real_u1 : to_real u1 = (1 : ℝ)
axiom u2 : usingle
axiom to_real_u2 : to_real u2 = (2 : ℝ)
axiom u4 : usingle
axiom to_real_u4 : to_real u4 = (4 : ℝ)
axiom u8 : usingle
axiom to_real_u8 : to_real u8 = (8 : ℝ)
axiom u16 : usingle
axiom to_real_u16 : to_real u16 = (16 : ℝ)
axiom u32 : usingle
axiom to_real_u32 : to_real u32 = (32 : ℝ)
axiom u64 : usingle
axiom to_real_u64 : to_real u64 = (64 : ℝ)
axiom u128 : usingle
axiom to_real_u128 : to_real u128 = (128 : ℝ)
axiom u256 : usingle
axiom to_real_u256 : to_real u256 = (256 : ℝ)
axiom u512 : usingle
axiom to_real_u512 : to_real u512 = (512 : ℝ)
axiom u1024 : usingle
axiom to_real_u1024 : to_real u1024 = (1024 : ℝ)
axiom u2048 : usingle
axiom to_real_u2048 : to_real u2048 = (2048 : ℝ)
axiom u4096 : usingle
axiom to_real_u4096 : to_real u4096 = (4096 : ℝ)
axiom u8192 : usingle
axiom to_real_u8192 : to_real u8192 = (8192 : ℝ)
axiom u16384 : usingle
axiom to_real_u16384 : to_real u16384 = (16384 : ℝ)
axiom u32768 : usingle
axiom to_real_u32768 : to_real u32768 = (32768 : ℝ)
axiom u65536 : usingle
axiom to_real_u65536 : to_real u65536 = (65536 : ℝ)
noncomputable def is_positive_power_of_2 (x : usingle) := x = u1 ∨ x = u2 ∨ x = u4 ∨ x = u8 ∨ x = u16 ∨ x = u32 ∨ x = u64 ∨ x = u128 ∨ x = u256 ∨ x = u4096 ∨ x = u8192 ∨ x = u16384 ∨ x = u32768 ∨ x = u65536
axiom div_by_positive_power_of_2_is_exact (y : usingle) (x : usingle) (fact0 : is_positive_power_of_2 y) : is_exact udiv_closure x y
end USingle
namespace HelperLemmas
axiom log_1_minus_x (x : ℝ) (fact0 : (0 : ℝ) ≤ abs x) (fact1 : abs x < (1 : ℝ)) : Real.log ((1 : ℝ) + x) ≤ -Real.log ((1 : ℝ) - x)
axiom log2_1_minus_x (x : ℝ) (fact0 : (0 : ℝ) ≤ abs x) (fact1 : abs x < (1 : ℝ)) : Real.logb 2 ((1 : ℝ) + x) ≤ -Real.logb 2 ((1 : ℝ) - x)
axiom log10_1_minus_x (x : ℝ) (fact0 : (0 : ℝ) ≤ abs x) (fact1 : abs x < (1 : ℝ)) : Real.logb 10 ((1 : ℝ) + x) ≤ -Real.logb 10 ((1 : ℝ) - x)
axiom sin_of_approx (x : ℝ) (y : ℝ) : abs (Real.sin x - Real.sin y) ≤ abs (x - y)
axiom cos_of_approx (x : ℝ) (y : ℝ) : abs (Real.cos x - Real.cos y) ≤ abs (x - y)
end HelperLemmas
namespace USingleLemmas
axiom uadd_single_error_propagation (x_f : USingle.usingle) (x : ℝ) (x_rel : ℝ) (x_factor : ℝ) (x_abs : ℝ) (y_f : USingle.usingle) (y : ℝ) (y_rel : ℝ) (y_factor : ℝ) (y_abs : ℝ) (r : USingle.usingle) (fact0 : abs (USingle.to_real x_f - x) ≤ x_rel * x_factor + x_abs) (fact1 : abs (USingle.to_real y_f - y) ≤ y_rel * y_factor + y_abs) (fact2 : abs x ≤ x_factor) (fact3 : abs y ≤ y_factor) (fact4 : (0 : ℝ) ≤ x_rel) (fact5 : (0 : ℝ) ≤ y_rel) (fact6 : (0 : ℝ) ≤ x_abs) (fact7 : (0 : ℝ) ≤ y_abs) (fact8 : r = USingle.uadd x_f y_f) : abs (USingle.to_real r - (x + y)) ≤ (x_rel + y_rel + USingle.eps) * (x_factor + y_factor) + (((1 : ℝ) + USingle.eps + y_rel) * x_abs + ((1 : ℝ) + USingle.eps + x_rel) * y_abs)
axiom usub_single_error_propagation (x_f : USingle.usingle) (x : ℝ) (x_rel : ℝ) (x_factor : ℝ) (x_abs : ℝ) (y_f : USingle.usingle) (y : ℝ) (y_rel : ℝ) (y_factor : ℝ) (y_abs : ℝ) (r : USingle.usingle) (fact0 : abs (USingle.to_real x_f - x) ≤ x_rel * x_factor + x_abs) (fact1 : abs (USingle.to_real y_f - y) ≤ y_rel * y_factor + y_abs) (fact2 : abs x ≤ x_factor) (fact3 : abs y ≤ y_factor) (fact4 : (0 : ℝ) ≤ x_abs) (fact5 : (0 : ℝ) ≤ y_abs) (fact6 : (0 : ℝ) ≤ x_rel) (fact7 : (0 : ℝ) ≤ y_rel) (fact8 : r = USingle.usub x_f y_f) : abs (USingle.to_real r - (x - y)) ≤ (x_rel + y_rel + USingle.eps) * (x_factor + y_factor) + (((1 : ℝ) + USingle.eps + y_rel) * x_abs + ((1 : ℝ) + USingle.eps + x_rel) * y_abs)
axiom umul_single_error_propagation (x_f : USingle.usingle) (x : ℝ) (x_rel : ℝ) (x_factor : ℝ) (x_abs : ℝ) (y_f : USingle.usingle) (y : ℝ) (y_rel : ℝ) (y_factor : ℝ) (y_abs : ℝ) (r : USingle.usingle) (fact0 : abs (USingle.to_real x_f - x) ≤ x_rel * x_factor + x_abs) (fact1 : abs (USingle.to_real y_f - y) ≤ y_rel * y_factor + y_abs) (fact2 : abs x ≤ x_factor) (fact3 : abs y ≤ y_factor) (fact4 : (0 : ℝ) ≤ x_rel) (fact5 : (0 : ℝ) ≤ y_rel) (fact6 : (0 : ℝ) ≤ x_abs) (fact7 : (0 : ℝ) ≤ y_abs) (fact8 : r = USingle.umul x_f y_f) : abs (USingle.to_real r - x * y) ≤ (USingle.eps + (x_rel + y_rel + x_rel * y_rel) * ((1 : ℝ) + USingle.eps)) * (x_factor * y_factor) + (((y_abs + y_abs * x_rel) * x_factor + (x_abs + x_abs * y_rel) * y_factor + x_abs * y_abs) * ((1 : ℝ) + USingle.eps) + USingle.eta)
axiom log_single_error_propagation (x_f : USingle.usingle) (x_exact : ℝ) (x_rel : ℝ) (x_factor : ℝ) (x_abs : ℝ) (logx_f : USingle.usingle) (log_rel : ℝ) (log_abs : ℝ) (fact0 : abs (USingle.to_real x_f - x_exact) ≤ x_rel * x_factor + x_abs) (fact1 : abs (USingle.to_real logx_f - Real.log (USingle.to_real x_f)) ≤ log_rel * abs (Real.log (USingle.to_real x_f)) + log_abs) (fact2 : (0 : ℝ) < x_exact) (fact3 : x_exact ≤ x_factor) (fact4 : (0 : ℝ) < x_exact - x_rel * x_factor - x_abs) (fact5 : (0 : ℝ) ≤ log_rel) : abs (USingle.to_real logx_f - Real.log x_exact) ≤ log_rel * abs (Real.log x_exact) + (-Real.log ((1 : ℝ) - (x_rel * x_factor + x_abs) / x_exact) * ((1 : ℝ) + log_rel) + log_abs)
axiom log2_single_error_propagation (x_f : USingle.usingle) (x_exact : ℝ) (x_rel : ℝ) (x_factor : ℝ) (x_abs : ℝ) (log2x_f : USingle.usingle) (log_rel : ℝ) (log_abs : ℝ) (fact0 : abs (USingle.to_real x_f - x_exact) ≤ x_rel * x_factor + x_abs) (fact1 : abs (USingle.to_real log2x_f - Real.logb 2 (USingle.to_real x_f)) ≤ log_rel * abs (Real.logb 2 (USingle.to_real x_f)) + log_abs) (fact2 : (0 : ℝ) < x_exact) (fact3 : x_exact ≤ x_factor) (fact4 : (0 : ℝ) < x_exact - x_rel * x_factor - x_abs) (fact5 : (0 : ℝ) ≤ log_rel) : abs (USingle.to_real log2x_f - Real.logb 2 x_exact) ≤ log_rel * abs (Real.logb 2 x_exact) + (-Real.logb 2 ((1 : ℝ) - (x_rel * x_factor + x_abs) / x_exact) * ((1 : ℝ) + log_rel) + log_abs)
axiom log10_single_error_propagation (x_f : USingle.usingle) (x_exact : ℝ) (x_rel : ℝ) (x_factor : ℝ) (x_abs : ℝ) (log10x_f : USingle.usingle) (log_rel : ℝ) (log_abs : ℝ) (fact0 : abs (USingle.to_real x_f - x_exact) ≤ x_rel * x_factor + x_abs) (fact1 : abs (USingle.to_real log10x_f - Real.logb 10 (USingle.to_real x_f)) ≤ log_rel * abs (Real.logb 10 (USingle.to_real x_f)) + log_abs) (fact2 : (0 : ℝ) < x_exact) (fact3 : x_exact ≤ x_factor) (fact4 : (0 : ℝ) < x_exact - x_rel * x_factor - x_abs) (fact5 : (0 : ℝ) ≤ log_rel) : abs (USingle.to_real log10x_f - Real.logb 10 x_exact) ≤ log_rel * abs (Real.logb 10 x_exact) + (-Real.logb 10 ((1 : ℝ) - (x_rel * x_factor + x_abs) / x_exact) * ((1 : ℝ) + log_rel) + log_abs)
axiom exp_single_error_propagation (x_f : USingle.usingle) (x_exact : ℝ) (x_rel : ℝ) (x_factor : ℝ) (x_abs : ℝ) (expx_f : USingle.usingle) (exp_rel : ℝ) (exp_abs : ℝ) (fact0 : abs (USingle.to_real x_f - x_exact) ≤ x_rel * x_factor + x_abs) (fact1 : abs (USingle.to_real expx_f - Real.exp (USingle.to_real x_f)) ≤ exp_rel * Real.exp (USingle.to_real x_f) + exp_abs) (fact2 : x_exact ≤ x_factor) (fact3 : (0 : ℝ) ≤ exp_rel) (fact4 : exp_rel ≤ (1 : ℝ)) : abs (USingle.to_real expx_f - Real.exp x_exact) ≤ (exp_rel + (Real.exp (x_rel * x_factor + x_abs) - (1 : ℝ)) * ((1 : ℝ) + exp_rel)) * Real.exp x_exact + exp_abs
axiom sin_single_error_propagation (x_f : USingle.usingle) (x_exact : ℝ) (x_rel : ℝ) (x_factor : ℝ) (x_abs : ℝ) (sinx_f : USingle.usingle) (sin_rel : ℝ) (sin_abs : ℝ) (fact0 : abs (USingle.to_real x_f - x_exact) ≤ x_rel * x_factor + x_abs) (fact1 : abs (USingle.to_real sinx_f - Real.sin (USingle.to_real x_f)) ≤ sin_rel * abs (Real.sin (USingle.to_real x_f)) + sin_abs) (fact2 : x_exact ≤ x_factor) (fact3 : (0 : ℝ) ≤ sin_rel) : abs (USingle.to_real sinx_f - Real.sin x_exact) ≤ sin_rel * abs (Real.sin x_exact) + ((x_rel * x_factor + x_abs) * ((1 : ℝ) + sin_rel) + sin_abs)
axiom cos_single_error_propagation (x_f : USingle.usingle) (x_exact : ℝ) (x_rel : ℝ) (x_factor : ℝ) (x_abs : ℝ) (cosx_f : USingle.usingle) (cos_rel : ℝ) (cos_abs : ℝ) (fact0 : abs (USingle.to_real x_f - x_exact) ≤ x_rel * x_factor + x_abs) (fact1 : abs (USingle.to_real cosx_f - Real.cos (USingle.to_real x_f)) ≤ cos_rel * abs (Real.cos (USingle.to_real x_f)) + cos_abs) (fact2 : x_exact ≤ x_factor) (fact3 : (0 : ℝ) ≤ cos_rel) : abs (USingle.to_real cosx_f - Real.cos x_exact) ≤ cos_rel * abs (Real.cos x_exact) + ((x_rel * x_factor + x_abs) * ((1 : ℝ) + cos_rel) + cos_abs)
axiom real_fun : (ℤ -> USingle.usingle) -> ℤ -> ℝ
axiom real_fun'def (f : ℤ -> USingle.usingle) (i : ℤ) : real_fun f i = USingle.to_real (f i)
axiom sum_single_error_propagation (n : ℤ) (f : ℤ -> USingle.usingle) (f_exact : ℤ -> ℝ) (f_rel : ℝ) (f_factor : ℤ -> ℝ) (f_abs : ℝ) (f_factor' : ℤ -> ℝ) (x : USingle.usingle) (sum_rel : ℝ) (sum_abs : ℝ) (fact0 : ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < n → abs (real_fun f i - f_exact i) ≤ f_rel * f_factor i + f_abs) (fact1 : ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < n → f_factor i - f_rel * f_factor i - f_abs ≤ f_factor' i ∧ f_factor' i ≤ f_factor i + f_rel * f_factor i + f_abs) (fact2 : abs (USingle.to_real x - real.Sum.sum (real_fun f) (0 : ℤ) n) ≤ sum_rel * real.Sum.sum f_factor' (0 : ℤ) n + sum_abs) (fact3 : (0 : ℝ) ≤ sum_rel) (fact4 : (0 : ℤ) ≤ n) : abs (USingle.to_real x - real.Sum.sum f_exact (0 : ℤ) n) ≤ (f_rel + sum_rel * ((1 : ℝ) + f_rel)) * real.Sum.sum f_factor (0 : ℤ) n + (f_abs * Int.to_Real n * ((1 : ℝ) + sum_rel) + sum_abs)
axiom udiv_closure : USingle.usingle -> USingle.usingle -> USingle.usingle
axiom udiv_exact_single_error_propagation (x_f : USingle.usingle) (x : ℝ) (x_rel : ℝ) (x_factor : ℝ) (x_abs : ℝ) (y_f : USingle.usingle) (r : USingle.usingle) (fact0 : abs (USingle.to_real x_f - x) ≤ x_rel * x_factor + x_abs) (fact1 : abs x ≤ x_factor) (fact2 : (0 : ℝ) ≤ x_rel) (fact3 : (0 : ℝ) ≤ x_abs) (fact4 : ¬(0 : ℝ) = USingle.to_real y_f) (fact5 : USingle.is_exact udiv_closure x_f y_f) (fact6 : r = USingle.infix_slslsldot x_f y_f) : abs (USingle.to_real r - x / USingle.to_real y_f) ≤ x_rel * (x_factor / abs (USingle.to_real y_f)) + (x_abs / abs (USingle.to_real y_f) + USingle.eta)
end USingleLemmas
namespace Helpers
axiom abs_fun : (ℤ -> ℝ) -> ℤ -> ℝ
axiom abs_fun'def (f : ℤ -> ℝ) (i : ℤ) : abs_fun f i = abs (f i)
axiom abs_real_fun : (ℤ -> USingle.usingle) -> ℤ -> ℝ
axiom abs_real_fun'def (f : ℤ -> USingle.usingle) (i : ℤ) : abs_real_fun f i = abs_fun (USingleLemmas.real_fun f) i
axiom usum_rec : (ℤ -> USingle.usingle) -> ℤ -> ℤ -> USingle.usingle
axiom usum_rec'def (b : ℤ) (a : ℤ) (f : ℤ -> USingle.usingle) (fact0 : (0 : ℤ) ≤ b - a) : if b - a ≤ (0 : ℤ) then usum_rec f a b = USingle.uzero else if b - a = (1 : ℤ) then usum_rec f a b = f (b - (1 : ℤ)) else usum_rec f a b = USingle.uadd (usum_rec f a (b - (1 : ℤ))) (f (b - (1 : ℤ)))
axiom usum_rec'spec (b : ℤ) (a : ℤ) (f : ℤ -> USingle.usingle) (fact0 : (0 : ℤ) ≤ b - a) : abs (USingle.to_real (usum_rec f a b) - real.Sum.sum (USingleLemmas.real_fun f) a b) ≤ real.Sum.sum (abs_real_fun f) a b * (USingle.eps * Int.to_Real (b - a))
axiom log_error : ℝ
axiom log_error_bounds : (0 : ℝ) ≤ log_error ∧ log_error ≤ (1 : ℝ)
axiom log_approx : USingle.usingle -> USingle.usingle
axiom log_approx'spec (x : USingle.usingle) (fact0 : (0 : ℝ) < USingle.to_real x) : abs (USingle.to_real (log_approx x) - Real.log (USingle.to_real x)) ≤ abs (Real.log (USingle.to_real x)) * log_error
axiom log2_error : ℝ
axiom log2_error_bounds : (0 : ℝ) ≤ log2_error ∧ log2_error ≤ (1 : ℝ)
axiom log2_approx : USingle.usingle -> USingle.usingle
axiom log2_approx'spec (x : USingle.usingle) (fact0 : (0 : ℝ) < USingle.to_real x) : abs (USingle.to_real (log2_approx x) - Real.logb 2 (USingle.to_real x)) ≤ abs (Real.logb 2 (USingle.to_real x)) * log2_error
axiom exp_error : ℝ
axiom exp_error_bounds : (0 : ℝ) ≤ exp_error ∧ exp_error ≤ (1 : ℝ) / 8
axiom exp_approx : USingle.usingle -> USingle.usingle
axiom exp_approx'spec (x : USingle.usingle) : abs (USingle.to_real (exp_approx x) - Real.exp (USingle.to_real x)) ≤ exp_error * Real.exp (USingle.to_real x)
end Helpers

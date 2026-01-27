import Why3.Base
import Why3.real.Truncate
import Why3.ieee_float.RoundingMode
open Classical
open Lean4Why3
namespace Float64
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom t'real : t -> ℝ
axiom t'isFinite : t -> Prop
axiom eb_gt_1 : (1 : ℤ) < (11 : ℤ)
axiom sb_gt_1 : (1 : ℤ) < (53 : ℤ)
axiom zeroF : t
axiom add : RoundingMode.mode -> t -> t -> t
axiom sub : RoundingMode.mode -> t -> t -> t
axiom mul : RoundingMode.mode -> t -> t -> t
axiom div : RoundingMode.mode -> t -> t -> t
axiom abs : t -> t
axiom neg : t -> t
axiom fma : RoundingMode.mode -> t -> t -> t -> t
axiom sqrt : RoundingMode.mode -> t -> t
axiom roundToIntegral : RoundingMode.mode -> t -> t
axiom min : t -> t -> t
axiom max : t -> t -> t
axiom le : t -> t -> Prop
axiom lt : t -> t -> Prop
axiom eq : t -> t -> Prop
axiom is_normal : t -> Prop
axiom is_subnormal : t -> Prop
axiom is_zero : t -> Prop
axiom is_infinite : t -> Prop
axiom is_nan : t -> Prop
axiom is_positive : t -> Prop
axiom is_negative : t -> Prop
noncomputable def is_plus_infinity (x : t) := is_infinite x ∧ is_positive x
noncomputable def is_minus_infinity (x : t) := is_infinite x ∧ is_negative x
noncomputable def is_plus_zero (x : t) := is_zero x ∧ is_positive x
noncomputable def is_minus_zero (x : t) := is_zero x ∧ is_negative x
noncomputable def is_not_nan (x : t) := t'isFinite x ∨ is_infinite x
axiom is_not_nan1 (x : t) : is_not_nan x = (¬is_nan x)
axiom is_not_finite (x : t) : (¬t'isFinite x) = (is_infinite x ∨ is_nan x)
axiom zeroF_is_positive : is_positive zeroF
axiom zeroF_is_zero : is_zero zeroF
axiom zero_to_real (x : t) : is_zero x = (t'isFinite x ∧ t'real x = (0 : ℝ))
axiom of_int : RoundingMode.mode -> ℤ -> t
axiom to_int : RoundingMode.mode -> t -> ℤ
axiom zero_of_int (m : RoundingMode.mode) : zeroF = of_int m (0 : ℤ)
axiom round : RoundingMode.mode -> ℝ -> ℝ
axiom max_int_spec : (179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368 : ℤ) = HPow.hPow 2 (Int.toNat (HPow.hPow 2 (Int.toNat ((11 : ℤ) - (1 : ℤ))))) - HPow.hPow 2 (Int.toNat (HPow.hPow 2 (Int.toNat ((11 : ℤ) - (1 : ℤ))) - (53 : ℤ)))
axiom max_real_int : (179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368 : ℝ) = Int.to_Real (179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368 : ℤ)
noncomputable def in_range (x : ℝ) := -(179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368 : ℝ) ≤ x ∧ x ≤ (179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368 : ℝ)
noncomputable def in_int_range (i : ℤ) := -(179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368 : ℤ) ≤ i ∧ i ≤ (179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368 : ℤ)
axiom is_finite (x : t) (fact0 : t'isFinite x) : in_range (t'real x)
noncomputable def no_overflow (m : RoundingMode.mode) (x : ℝ) := in_range (round m x)
axiom Bounded_real_no_overflow (x : ℝ) (m : RoundingMode.mode) (fact0 : in_range x) : no_overflow m x
axiom Round_monotonic (x : ℝ) (y : ℝ) (m : RoundingMode.mode) (fact0 : x ≤ y) : round m x ≤ round m y
axiom Round_idempotent (m1 : RoundingMode.mode) (m2 : RoundingMode.mode) (x : ℝ) : round m1 (round m2 x) = round m2 x
axiom Round_to_real (x : t) (m : RoundingMode.mode) (fact0 : t'isFinite x) : round m (t'real x) = t'real x
axiom Round_down_le (x : ℝ) : round RoundingMode.mode.RTN x ≤ x
axiom Round_up_ge (x : ℝ) : x ≤ round RoundingMode.mode.RTP x
axiom Round_down_neg (x : ℝ) : round RoundingMode.mode.RTN (-x) = -round RoundingMode.mode.RTP x
axiom Round_up_neg (x : ℝ) : round RoundingMode.mode.RTP (-x) = -round RoundingMode.mode.RTN x
axiom pow2sb1 : (9007199254740992 : ℤ) = HPow.hPow 2 (53 : ℕ)
noncomputable def in_safe_int_range (i : ℤ) := -(9007199254740992 : ℤ) ≤ i ∧ i ≤ (9007199254740992 : ℤ)
axiom Exact_rounding_for_integers (i : ℤ) (m : RoundingMode.mode) (fact0 : in_safe_int_range i) : round m (Int.to_Real i) = Int.to_Real i
axiom from_real : RoundingMode.mode -> ℝ -> t
axiom from_real_in_range (m : RoundingMode.mode) (r : ℝ) (fact0 : in_range (round m r)) : t'isFinite (from_real m r) ∧ t'real (from_real m r) = round m r
axiom from_real_large_neg (m : RoundingMode.mode) (r : ℝ) (fact0 : round m r < -(179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368 : ℝ)) : is_infinite (from_real m r) ∧ is_negative (from_real m r)
axiom from_real_large_pos (m : RoundingMode.mode) (r : ℝ) (fact0 : (179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368 : ℝ) < round m r) : is_infinite (from_real m r) ∧ is_positive (from_real m r)
noncomputable def same_sign (x : t) (y : t) := is_positive x ∧ is_positive y ∨ is_negative x ∧ is_negative y
noncomputable def diff_sign (x : t) (y : t) := is_positive x ∧ is_negative y ∨ is_negative x ∧ is_positive y
axiom feq_eq (x : t) (y : t) (fact0 : t'isFinite x) (fact1 : t'isFinite y) (fact2 : ¬is_zero x) (fact3 : eq x y) : x = y
axiom eq_feq (x : t) (y : t) (fact0 : t'isFinite x) (fact1 : t'isFinite y) (fact2 : x = y) : eq x y
axiom eq_refl (x : t) (fact0 : t'isFinite x) : eq x x
axiom eq_sym (x : t) (y : t) (fact0 : eq x y) : eq y x
axiom eq_trans (x : t) (y : t) (z : t) (fact0 : eq x y) (fact1 : eq y z) : eq x z
axiom eq_zero : eq zeroF (neg zeroF)
axiom eq_to_real_finite (x : t) (y : t) (fact0 : t'isFinite x) (fact1 : t'isFinite y) : eq x y = (t'real x = t'real y)
axiom eq_special (x : t) (y : t) (fact0 : eq x y) : is_not_nan x ∧ is_not_nan y ∧ (t'isFinite x ∧ t'isFinite y ∨ is_infinite x ∧ is_infinite y ∧ same_sign x y)
axiom lt_finite (x : t) (y : t) (fact0 : t'isFinite x) (fact1 : t'isFinite y) : lt x y = (t'real x < t'real y)
axiom le_finite (x : t) (y : t) (fact0 : t'isFinite x) (fact1 : t'isFinite y) : le x y = (t'real x ≤ t'real y)
axiom le_lt_trans (x : t) (y : t) (z : t) (fact0 : le x y) (fact1 : lt y z) : lt x z
axiom lt_le_trans (x : t) (y : t) (z : t) (fact0 : lt x y) (fact1 : le y z) : lt x z
axiom le_ge_asym (x : t) (y : t) (fact0 : le x y) (fact1 : le y x) : eq x y
axiom not_lt_ge (x : t) (y : t) (fact0 : ¬lt x y) (fact1 : is_not_nan x) (fact2 : is_not_nan y) : le y x
axiom not_gt_le (y : t) (x : t) (fact0 : ¬lt y x) (fact1 : is_not_nan x) (fact2 : is_not_nan y) : le x y
axiom le_special (x : t) (y : t) (fact0 : le x y) : t'isFinite x ∧ t'isFinite y ∨ is_minus_infinity x ∧ is_not_nan y ∨ is_not_nan x ∧ is_plus_infinity y
axiom lt_special (x : t) (y : t) (fact0 : lt x y) : t'isFinite x ∧ t'isFinite y ∨ is_minus_infinity x ∧ is_not_nan y ∧ ¬is_minus_infinity y ∨ is_not_nan x ∧ ¬is_plus_infinity x ∧ is_plus_infinity y
axiom lt_lt_finite (x : t) (y : t) (z : t) (fact0 : lt x y) (fact1 : lt y z) : t'isFinite y
axiom positive_to_real (x : t) (fact0 : t'isFinite x) (fact1 : is_positive x) : (0 : ℝ) ≤ t'real x
axiom to_real_positive (x : t) (fact0 : t'isFinite x) (fact1 : (0 : ℝ) < t'real x) : is_positive x
axiom negative_to_real (x : t) (fact0 : t'isFinite x) (fact1 : is_negative x) : t'real x ≤ (0 : ℝ)
axiom to_real_negative (x : t) (fact0 : t'isFinite x) (fact1 : t'real x < (0 : ℝ)) : is_negative x
axiom negative_xor_positive (x : t) : ¬(is_positive x ∧ is_negative x)
axiom negative_or_positive (x : t) (fact0 : is_not_nan x) : is_positive x ∨ is_negative x
axiom diff_sign_trans (x : t) (y : t) (z : t) (fact0 : diff_sign x y) (fact1 : diff_sign y z) : same_sign x z
axiom diff_sign_product (x : t) (y : t) (fact0 : t'isFinite x) (fact1 : t'isFinite y) (fact2 : t'real x * t'real y < (0 : ℝ)) : diff_sign x y
axiom same_sign_product (x : t) (y : t) (fact0 : t'isFinite x) (fact1 : t'isFinite y) (fact2 : same_sign x y) : (0 : ℝ) ≤ t'real x * t'real y
noncomputable def product_sign (z : t) (x : t) (y : t) := (same_sign x y → is_positive z) ∧ (diff_sign x y → is_negative z)
noncomputable def overflow_value (m : RoundingMode.mode) (x : t) := match m with | RoundingMode.mode.RTN => (if is_positive x then t'isFinite x ∧ t'real x = (179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368 : ℝ) else is_infinite x) | RoundingMode.mode.RTP => (if is_positive x then is_infinite x else t'isFinite x ∧ t'real x = -(179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368 : ℝ)) | RoundingMode.mode.RTZ => (if is_positive x then t'isFinite x ∧ t'real x = (179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368 : ℝ) else t'isFinite x ∧ t'real x = -(179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368 : ℝ)) | RoundingMode.mode.RNA => is_infinite x | RoundingMode.mode.RNE => is_infinite x
noncomputable def sign_zero_result (m : RoundingMode.mode) (x : t) := is_zero x → (match m with | RoundingMode.mode.RTN => is_negative x | _ => is_positive x)
axiom add_finite (x : t) (y : t) (m : RoundingMode.mode) (fact0 : t'isFinite x) (fact1 : t'isFinite y) (fact2 : no_overflow m (t'real x + t'real y)) : t'isFinite (add m x y) ∧ t'real (add m x y) = round m (t'real x + t'real y)
axiom add_finite_rev (m : RoundingMode.mode) (x : t) (y : t) (fact0 : t'isFinite (add m x y)) : t'isFinite x ∧ t'isFinite y
axiom add_finite_rev_n (m : RoundingMode.mode) (x : t) (y : t) (fact0 : RoundingMode.to_nearest m) (fact1 : t'isFinite (add m x y)) : no_overflow m (t'real x + t'real y) ∧ t'real (add m x y) = round m (t'real x + t'real y)
axiom sub_finite (x : t) (y : t) (m : RoundingMode.mode) (fact0 : t'isFinite x) (fact1 : t'isFinite y) (fact2 : no_overflow m (t'real x - t'real y)) : t'isFinite (sub m x y) ∧ t'real (sub m x y) = round m (t'real x - t'real y)
axiom sub_finite_rev (m : RoundingMode.mode) (x : t) (y : t) (fact0 : t'isFinite (sub m x y)) : t'isFinite x ∧ t'isFinite y
axiom sub_finite_rev_n (m : RoundingMode.mode) (x : t) (y : t) (fact0 : RoundingMode.to_nearest m) (fact1 : t'isFinite (sub m x y)) : no_overflow m (t'real x - t'real y) ∧ t'real (sub m x y) = round m (t'real x - t'real y)
axiom mul_finite (x : t) (y : t) (m : RoundingMode.mode) (fact0 : t'isFinite x) (fact1 : t'isFinite y) (fact2 : no_overflow m (t'real x * t'real y)) : t'isFinite (mul m x y) ∧ t'real (mul m x y) = round m (t'real x * t'real y)
axiom mul_finite_rev (m : RoundingMode.mode) (x : t) (y : t) (fact0 : t'isFinite (mul m x y)) : t'isFinite x ∧ t'isFinite y
axiom mul_finite_rev_n (m : RoundingMode.mode) (x : t) (y : t) (fact0 : RoundingMode.to_nearest m) (fact1 : t'isFinite (mul m x y)) : no_overflow m (t'real x * t'real y) ∧ t'real (mul m x y) = round m (t'real x * t'real y)
axiom div_finite (x : t) (y : t) (m : RoundingMode.mode) (fact0 : t'isFinite x) (fact1 : t'isFinite y) (fact2 : ¬is_zero y) (fact3 : no_overflow m (t'real x / t'real y)) : t'isFinite (div m x y) ∧ t'real (div m x y) = round m (t'real x / t'real y)
axiom div_finite_rev (m : RoundingMode.mode) (x : t) (y : t) (fact0 : t'isFinite (div m x y)) : t'isFinite x ∧ t'isFinite y ∧ ¬is_zero y ∨ t'isFinite x ∧ is_infinite y ∧ t'real (div m x y) = (0 : ℝ)
axiom div_finite_rev_n (m : RoundingMode.mode) (x : t) (y : t) (fact0 : RoundingMode.to_nearest m) (fact1 : t'isFinite (div m x y)) (fact2 : t'isFinite y) : no_overflow m (t'real x / t'real y) ∧ t'real (div m x y) = round m (t'real x / t'real y)
axiom neg_finite (x : t) (fact0 : t'isFinite x) : t'isFinite (neg x) ∧ t'real (neg x) = -t'real x
axiom neg_finite_rev (x : t) (fact0 : t'isFinite (neg x)) : t'isFinite x ∧ t'real (neg x) = -t'real x
axiom abs_finite (x : t) (fact0 : t'isFinite x) : t'isFinite (Float64.abs x) ∧ t'real (Float64.abs x) = Math.abs (t'real x) ∧ is_positive (Float64.abs x)
axiom abs_finite_rev (x : t) (fact0 : t'isFinite (Float64.abs x)) : t'isFinite x ∧ t'real (Float64.abs x) = Math.abs (t'real x)
axiom abs_universal (x : t) : ¬is_negative (Float64.abs x)
axiom fma_finite (x : t) (y : t) (z : t) (m : RoundingMode.mode) (fact0 : t'isFinite x) (fact1 : t'isFinite y) (fact2 : t'isFinite z) (fact3 : no_overflow m (t'real x * t'real y + t'real z)) : t'isFinite (fma m x y z) ∧ t'real (fma m x y z) = round m (t'real x * t'real y + t'real z)
axiom fma_finite_rev (m : RoundingMode.mode) (x : t) (y : t) (z : t) (fact0 : t'isFinite (fma m x y z)) : t'isFinite x ∧ t'isFinite y ∧ t'isFinite z
axiom fma_finite_rev_n (m : RoundingMode.mode) (x : t) (y : t) (z : t) (fact0 : RoundingMode.to_nearest m) (fact1 : t'isFinite (fma m x y z)) : no_overflow m (t'real x * t'real y + t'real z) ∧ t'real (fma m x y z) = round m (t'real x * t'real y + t'real z)
axiom sqrt_finite (x : t) (m : RoundingMode.mode) (fact0 : t'isFinite x) (fact1 : (0 : ℝ) ≤ t'real x) : t'isFinite (sqrt m x) ∧ t'real (sqrt m x) = round m (Real.sqrt (t'real x))
axiom sqrt_finite_rev (m : RoundingMode.mode) (x : t) (fact0 : t'isFinite (sqrt m x)) : t'isFinite x ∧ (0 : ℝ) ≤ t'real x ∧ t'real (sqrt m x) = round m (Real.sqrt (t'real x))
noncomputable def same_sign_real (x : t) (r : ℝ) := is_positive x ∧ (0 : ℝ) < r ∨ is_negative x ∧ r < (0 : ℝ)
axiom add_special (m : RoundingMode.mode) (x : t) (y : t) : (is_nan x ∨ is_nan y → is_nan (add m x y)) ∧ (t'isFinite x ∧ is_infinite y → is_infinite (add m x y) ∧ same_sign (add m x y) y) ∧ (is_infinite x ∧ t'isFinite y → is_infinite (add m x y) ∧ same_sign (add m x y) x) ∧ (is_infinite x ∧ is_infinite y ∧ same_sign x y → is_infinite (add m x y) ∧ same_sign (add m x y) x) ∧ (is_infinite x ∧ is_infinite y ∧ diff_sign x y → is_nan (add m x y)) ∧ (t'isFinite x ∧ t'isFinite y ∧ ¬no_overflow m (t'real x + t'real y) → same_sign_real (add m x y) (t'real x + t'real y) ∧ overflow_value m (add m x y)) ∧ (t'isFinite x ∧ t'isFinite y → (if same_sign x y then same_sign (add m x y) x else sign_zero_result m (add m x y)))
axiom sub_special (m : RoundingMode.mode) (x : t) (y : t) : (is_nan x ∨ is_nan y → is_nan (sub m x y)) ∧ (t'isFinite x ∧ is_infinite y → is_infinite (sub m x y) ∧ diff_sign (sub m x y) y) ∧ (is_infinite x ∧ t'isFinite y → is_infinite (sub m x y) ∧ same_sign (sub m x y) x) ∧ (is_infinite x ∧ is_infinite y ∧ same_sign x y → is_nan (sub m x y)) ∧ (is_infinite x ∧ is_infinite y ∧ diff_sign x y → is_infinite (sub m x y) ∧ same_sign (sub m x y) x) ∧ (t'isFinite x ∧ t'isFinite y ∧ ¬no_overflow m (t'real x - t'real y) → same_sign_real (sub m x y) (t'real x - t'real y) ∧ overflow_value m (sub m x y)) ∧ (t'isFinite x ∧ t'isFinite y → (if diff_sign x y then same_sign (sub m x y) x else sign_zero_result m (sub m x y)))
axiom mul_special (m : RoundingMode.mode) (x : t) (y : t) : (is_nan x ∨ is_nan y → is_nan (mul m x y)) ∧ (is_zero x ∧ is_infinite y → is_nan (mul m x y)) ∧ (t'isFinite x ∧ is_infinite y ∧ ¬is_zero x → is_infinite (mul m x y)) ∧ (is_infinite x ∧ is_zero y → is_nan (mul m x y)) ∧ (is_infinite x ∧ t'isFinite y ∧ ¬is_zero y → is_infinite (mul m x y)) ∧ (is_infinite x ∧ is_infinite y → is_infinite (mul m x y)) ∧ (t'isFinite x ∧ t'isFinite y ∧ ¬no_overflow m (t'real x * t'real y) → overflow_value m (mul m x y)) ∧ (¬is_nan (mul m x y) → product_sign (mul m x y) x y)
axiom div_special (m : RoundingMode.mode) (x : t) (y : t) : (is_nan x ∨ is_nan y → is_nan (div m x y)) ∧ (t'isFinite x ∧ is_infinite y → is_zero (div m x y)) ∧ (is_infinite x ∧ t'isFinite y → is_infinite (div m x y)) ∧ (is_infinite x ∧ is_infinite y → is_nan (div m x y)) ∧ (t'isFinite x ∧ t'isFinite y ∧ ¬is_zero y ∧ ¬no_overflow m (t'real x / t'real y) → overflow_value m (div m x y)) ∧ (t'isFinite x ∧ is_zero y ∧ ¬is_zero x → is_infinite (div m x y)) ∧ (is_zero x ∧ is_zero y → is_nan (div m x y)) ∧ (¬is_nan (div m x y) → product_sign (div m x y) x y)
axiom neg_special (x : t) : (is_nan x → is_nan (neg x)) ∧ (is_infinite x → is_infinite (neg x)) ∧ (¬is_nan x → diff_sign x (neg x))
axiom abs_special (x : t) : (is_nan x → is_nan (Float64.abs x)) ∧ (is_infinite x → is_infinite (Float64.abs x)) ∧ (¬is_nan x → is_positive (Float64.abs x))
axiom fma_special (m : RoundingMode.mode) (x : t) (y : t) (z : t) : (is_nan x ∨ is_nan y ∨ is_nan z → is_nan (fma m x y z)) ∧ (is_zero x ∧ is_infinite y → is_nan (fma m x y z)) ∧ (is_infinite x ∧ is_zero y → is_nan (fma m x y z)) ∧ (t'isFinite x ∧ ¬is_zero x ∧ is_infinite y ∧ t'isFinite z → is_infinite (fma m x y z) ∧ product_sign (fma m x y z) x y) ∧ (t'isFinite x ∧ ¬is_zero x ∧ is_infinite y ∧ is_infinite z → (if product_sign z x y then is_infinite (fma m x y z) ∧ same_sign (fma m x y z) z else is_nan (fma m x y z))) ∧ (is_infinite x ∧ t'isFinite y ∧ ¬is_zero y ∧ t'isFinite z → is_infinite (fma m x y z) ∧ product_sign (fma m x y z) x y) ∧ (is_infinite x ∧ t'isFinite y ∧ ¬is_zero y ∧ is_infinite z → (if product_sign z x y then is_infinite (fma m x y z) ∧ same_sign (fma m x y z) z else is_nan (fma m x y z))) ∧ (is_infinite x ∧ is_infinite y ∧ t'isFinite z → is_infinite (fma m x y z) ∧ product_sign (fma m x y z) x y) ∧ (t'isFinite x ∧ t'isFinite y ∧ is_infinite z → is_infinite (fma m x y z) ∧ same_sign (fma m x y z) z) ∧ (is_infinite x ∧ is_infinite y ∧ is_infinite z → (if product_sign z x y then is_infinite (fma m x y z) ∧ same_sign (fma m x y z) z else is_nan (fma m x y z))) ∧ (t'isFinite x ∧ t'isFinite y ∧ t'isFinite z ∧ ¬no_overflow m (t'real x * t'real y + t'real z) → same_sign_real (fma m x y z) (t'real x * t'real y + t'real z) ∧ overflow_value m (fma m x y z)) ∧ (t'isFinite x ∧ t'isFinite y ∧ t'isFinite z → (if product_sign z x y then same_sign (fma m x y z) z else t'real x * t'real y + t'real z = (0 : ℝ) → (if m = RoundingMode.mode.RTN then is_negative (fma m x y z) else is_positive (fma m x y z))))
axiom sqrt_special (m : RoundingMode.mode) (x : t) : (is_nan x → is_nan (sqrt m x)) ∧ (is_plus_infinity x → is_plus_infinity (sqrt m x)) ∧ (is_minus_infinity x → is_nan (sqrt m x)) ∧ (t'isFinite x ∧ t'real x < (0 : ℝ) → is_nan (sqrt m x)) ∧ (is_zero x → same_sign (sqrt m x) x) ∧ (t'isFinite x ∧ (0 : ℝ) < t'real x → is_positive (sqrt m x))
axiom of_int_add_exact (i : ℤ) (j : ℤ) (m : RoundingMode.mode) (n : RoundingMode.mode) (fact0 : in_safe_int_range i) (fact1 : in_safe_int_range j) (fact2 : in_safe_int_range (i + j)) : eq (of_int m (i + j)) (add n (of_int m i) (of_int m j))
axiom of_int_sub_exact (i : ℤ) (j : ℤ) (m : RoundingMode.mode) (n : RoundingMode.mode) (fact0 : in_safe_int_range i) (fact1 : in_safe_int_range j) (fact2 : in_safe_int_range (i - j)) : eq (of_int m (i - j)) (sub n (of_int m i) (of_int m j))
axiom of_int_mul_exact (i : ℤ) (j : ℤ) (m : RoundingMode.mode) (n : RoundingMode.mode) (fact0 : in_safe_int_range i) (fact1 : in_safe_int_range j) (fact2 : in_safe_int_range (i * j)) : eq (of_int m (i * j)) (mul n (of_int m i) (of_int m j))
axiom Min_r (y : t) (x : t) (fact0 : le y x) : eq (min x y) y
axiom Min_l (x : t) (y : t) (fact0 : le x y) : eq (min x y) x
axiom Max_r (y : t) (x : t) (fact0 : le y x) : eq (max x y) x
axiom Max_l (x : t) (y : t) (fact0 : le x y) : eq (max x y) y
axiom is_int : t -> Prop
axiom zeroF_is_int : is_int zeroF
axiom of_int_is_int (x : ℤ) (m : RoundingMode.mode) (fact0 : in_int_range x) : is_int (of_int m x)
axiom big_float_is_int (i : t) (m : RoundingMode.mode) (fact0 : t'isFinite i) (fact1 : le i (neg (of_int m (9007199254740992 : ℤ))) ∨ le (of_int m (9007199254740992 : ℤ)) i) : is_int i
axiom roundToIntegral_is_int (x : t) (m : RoundingMode.mode) (fact0 : t'isFinite x) : is_int (roundToIntegral m x)
axiom eq_is_int (x : t) (y : t) (fact0 : eq x y) (fact1 : is_int x) : is_int y
axiom add_int (x : t) (y : t) (m : RoundingMode.mode) (fact0 : is_int x) (fact1 : is_int y) (fact2 : t'isFinite (add m x y)) : is_int (add m x y)
axiom sub_int (x : t) (y : t) (m : RoundingMode.mode) (fact0 : is_int x) (fact1 : is_int y) (fact2 : t'isFinite (sub m x y)) : is_int (sub m x y)
axiom mul_int (x : t) (y : t) (m : RoundingMode.mode) (fact0 : is_int x) (fact1 : is_int y) (fact2 : t'isFinite (mul m x y)) : is_int (mul m x y)
axiom fma_int (x : t) (y : t) (z : t) (m : RoundingMode.mode) (fact0 : is_int x) (fact1 : is_int y) (fact2 : is_int z) (fact3 : t'isFinite (fma m x y z)) : is_int (fma m x y z)
axiom neg_int (x : t) (fact0 : is_int x) : is_int (neg x)
axiom abs_int (x : t) (fact0 : is_int x) : is_int (Float64.abs x)
axiom is_int_of_int (x : t) (m' : RoundingMode.mode) (m : RoundingMode.mode) (fact0 : is_int x) : eq x (of_int m' (to_int m x))
axiom is_int_to_int (x : t) (m : RoundingMode.mode) (fact0 : is_int x) : in_int_range (to_int m x)
axiom is_int_is_finite (x : t) (fact0 : is_int x) : t'isFinite x
axiom int_to_real (x : t) (m : RoundingMode.mode) (fact0 : is_int x) : t'real x = Int.to_Real (to_int m x)
axiom truncate_int (i : t) (m : RoundingMode.mode) (fact0 : is_int i) : eq (roundToIntegral m i) i
axiom truncate_neg (x : t) (fact0 : t'isFinite x) (fact1 : is_negative x) : roundToIntegral RoundingMode.mode.RTZ x = roundToIntegral RoundingMode.mode.RTP x
axiom truncate_pos (x : t) (fact0 : t'isFinite x) (fact1 : is_positive x) : roundToIntegral RoundingMode.mode.RTZ x = roundToIntegral RoundingMode.mode.RTN x
axiom ceil_le (x : t) (fact0 : t'isFinite x) : le x (roundToIntegral RoundingMode.mode.RTP x)
axiom ceil_lest (x : t) (y : t) (fact0 : le x y) (fact1 : is_int y) : le (roundToIntegral RoundingMode.mode.RTP x) y
axiom ceil_to_real (x : t) (fact0 : t'isFinite x) : t'real (roundToIntegral RoundingMode.mode.RTP x) = Int.to_Real (Truncate.ceil (t'real x))
axiom ceil_to_int (x : t) (m : RoundingMode.mode) (fact0 : t'isFinite x) : to_int m (roundToIntegral RoundingMode.mode.RTP x) = Truncate.ceil (t'real x)
axiom floor_le (x : t) (fact0 : t'isFinite x) : le (roundToIntegral RoundingMode.mode.RTN x) x
axiom floor_lest (y : t) (x : t) (fact0 : le y x) (fact1 : is_int y) : le y (roundToIntegral RoundingMode.mode.RTN x)
axiom floor_to_real (x : t) (fact0 : t'isFinite x) : t'real (roundToIntegral RoundingMode.mode.RTN x) = Int.to_Real (Truncate.floor (t'real x))
axiom floor_to_int (x : t) (m : RoundingMode.mode) (fact0 : t'isFinite x) : to_int m (roundToIntegral RoundingMode.mode.RTN x) = Truncate.floor (t'real x)
axiom RNA_down (x : t) (fact0 : lt (sub RoundingMode.mode.RNE x (roundToIntegral RoundingMode.mode.RTN x)) (sub RoundingMode.mode.RNE (roundToIntegral RoundingMode.mode.RTP x) x)) : roundToIntegral RoundingMode.mode.RNA x = roundToIntegral RoundingMode.mode.RTN x
axiom RNA_up (x : t) (fact0 : lt (sub RoundingMode.mode.RNE (roundToIntegral RoundingMode.mode.RTP x) x) (sub RoundingMode.mode.RNE x (roundToIntegral RoundingMode.mode.RTN x))) : roundToIntegral RoundingMode.mode.RNA x = roundToIntegral RoundingMode.mode.RTP x
axiom RNA_down_tie (x : t) (fact0 : eq (sub RoundingMode.mode.RNE x (roundToIntegral RoundingMode.mode.RTN x)) (sub RoundingMode.mode.RNE (roundToIntegral RoundingMode.mode.RTP x) x)) (fact1 : is_negative x) : roundToIntegral RoundingMode.mode.RNA x = roundToIntegral RoundingMode.mode.RTN x
axiom RNA_up_tie (x : t) (fact0 : eq (sub RoundingMode.mode.RNE (roundToIntegral RoundingMode.mode.RTP x) x) (sub RoundingMode.mode.RNE x (roundToIntegral RoundingMode.mode.RTN x))) (fact1 : is_positive x) : roundToIntegral RoundingMode.mode.RNA x = roundToIntegral RoundingMode.mode.RTP x
axiom to_int_roundToIntegral (m : RoundingMode.mode) (x : t) : to_int m x = to_int m (roundToIntegral m x)
axiom to_int_monotonic (x : t) (y : t) (m : RoundingMode.mode) (fact0 : t'isFinite x) (fact1 : t'isFinite y) (fact2 : le x y) : to_int m x ≤ to_int m y
axiom to_int_of_int (i : ℤ) (m : RoundingMode.mode) (fact0 : in_safe_int_range i) : to_int m (of_int m i) = i
axiom eq_to_int (x : t) (y : t) (m : RoundingMode.mode) (fact0 : t'isFinite x) (fact1 : eq x y) : to_int m x = to_int m y
axiom neg_to_int (x : t) (m : RoundingMode.mode) (fact0 : is_int x) : to_int m (neg x) = -to_int m x
axiom roundToIntegral_is_finite (x : t) (m : RoundingMode.mode) (fact0 : t'isFinite x) : t'isFinite (roundToIntegral m x)
axiom round_bound_ne (x : ℝ) (fact0 : no_overflow RoundingMode.mode.RNE x) : x - (1 : ℝ) / 9007199254740992 * Math.abs x - (1 : ℝ) / 404804506614621236704990693437834614099113299528284236713802716054860679135990693783920767402874248990374155728633623822779617474771586953734026799881477019843034848553132722728933815484186432682479535356945490137124014966849385397236206711298319112681620113024717539104666829230461005064372655017292012526615415482186989568 ≤ round RoundingMode.mode.RNE x ∧ round RoundingMode.mode.RNE x ≤ x + (1 : ℝ) / 9007199254740992 * Math.abs x + (1 : ℝ) / 404804506614621236704990693437834614099113299528284236713802716054860679135990693783920767402874248990374155728633623822779617474771586953734026799881477019843034848553132722728933815484186432682479535356945490137124014966849385397236206711298319112681620113024717539104666829230461005064372655017292012526615415482186989568
axiom round_bound (m : RoundingMode.mode) (x : ℝ) (fact0 : no_overflow m x) : x - (1 : ℝ) / 4503599627370496 * Math.abs x - (1 : ℝ) / 202402253307310618352495346718917307049556649764142118356901358027430339567995346891960383701437124495187077864316811911389808737385793476867013399940738509921517424276566361364466907742093216341239767678472745068562007483424692698618103355649159556340810056512358769552333414615230502532186327508646006263307707741093494784 ≤ round m x ∧ round m x ≤ x + (1 : ℝ) / 4503599627370496 * Math.abs x + (1 : ℝ) / 202402253307310618352495346718917307049556649764142118356901358027430339567995346891960383701437124495187077864316811911389808737385793476867013399940738509921517424276566361364466907742093216341239767678472745068562007483424692698618103355649159556340810056512358769552333414615230502532186327508646006263307707741093494784
end Float64

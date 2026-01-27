From Stdlib Require Import Strings.String.
From Stdlib Require Import String Ascii.
From Stdlib Require Arith.
From stdpp Require Import base.
From stdpp Require Import fin_maps.
From stdpp Require Import gmap.
From stdpp Require Import base gmultiset.
From Stdlib Require Classical.
From Stdlib Require Import ZArith.
From stdpp.bitvector Require Import definitions tactics.
From Stdlib Require Import Sorting.Sorted.
From Stdlib Require Import Reals.Rbasic_fun.
From Stdlib Require Import Reals.Abstract.ConstructiveAbs.
From Stdlib Require Import Reals.Rdefinitions.
From stdpp Require Import list_relations.
From stdpp Require Import list_numbers.
From stdpp Require Import functions.
From Stdlib Require Import ClassicalEpsilon.
From stdpp Require Import base decidable.
From Stdlib Require Import ZArith.Zeuclid.
From Stdlib Require Import ZArith.Znumtheory.
From stdpp Require Import propset.
From Stdlib Require Import Reals.
Require Import Why3.Base.
Require Import Why3.real.Truncate.
Require Import Why3.ieee_float.RoundingMode.
Open Scope Z_scope.
Axiom t : Type.
Axiom t_inhabited : Inhabited t.
Global Existing Instance t_inhabited.
Axiom t_countable : Countable t.
Global Existing Instance t_countable.
Axiom t'real : t -> R.
Axiom t'isFinite : t -> Prop.
Axiom eb_gt_1 : 1%Z < 11%Z.
Axiom sb_gt_1 : 1%Z < 53%Z.
Axiom zeroF : t.
Axiom add : mode -> t -> t -> t.
Axiom sub : mode -> t -> t -> t.
Axiom mul : mode -> t -> t -> t.
Axiom div : mode -> t -> t -> t.
Axiom abs : t -> t.
Axiom neg : t -> t.
Axiom fma : mode -> t -> t -> t -> t.
Axiom sqrt : mode -> t -> t.
Axiom roundToIntegral : mode -> t -> t.
Axiom min : t -> t -> t.
Axiom max : t -> t -> t.
Axiom le : t -> t -> Prop.
Axiom lt : t -> t -> Prop.
Axiom eq : t -> t -> Prop.
Axiom is_normal : t -> Prop.
Axiom is_subnormal : t -> Prop.
Axiom is_zero : t -> Prop.
Axiom is_infinite : t -> Prop.
Axiom is_nan : t -> Prop.
Axiom is_positive : t -> Prop.
Axiom is_negative : t -> Prop.
Definition is_plus_infinity (x : t) := is_infinite x ∧ is_positive x.
Definition is_minus_infinity (x : t) := is_infinite x ∧ is_negative x.
Definition is_plus_zero (x : t) := is_zero x ∧ is_positive x.
Definition is_minus_zero (x : t) := is_zero x ∧ is_negative x.
Definition is_not_nan (x : t) := t'isFinite x ∨ is_infinite x.
Axiom is_not_nan1 : forall  (x : t), is_not_nan x = (¬ is_nan x).
Axiom is_not_finite : forall  (x : t), (¬ t'isFinite x) = (is_infinite x ∨ is_nan x).
Axiom zeroF_is_positive : is_positive zeroF.
Axiom zeroF_is_zero : is_zero zeroF.
Axiom zero_to_real : forall  (x : t), is_zero x = (t'isFinite x ∧ t'real x = 0%R).
Axiom of_int : mode -> Z -> t.
Axiom to_int : mode -> t -> Z.
Axiom zero_of_int : forall  (m : mode), zeroF = of_int m 0%Z.
Axiom round : mode -> R -> R.
Axiom max_int_spec : 179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368%Z = pow2 (pow2 (11%Z - 1%Z)) - pow2 (pow2 (11%Z - 1%Z) - 53%Z).
Axiom max_real_int : 179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368%R = Rdefinitions.IZR 179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368%Z.
Definition in_range (x : R) := Rle (Ropp 179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368%R) x ∧ Rle x 179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368%R.
Definition in_int_range (i : Z) := - 179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368%Z ≤ i ∧ i ≤ 179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368%Z.
Axiom is_finite : forall  (x : t) (fact0 : t'isFinite x), in_range (t'real x).
Definition no_overflow (m : mode) (x : R) := in_range (round m x).
Axiom Bounded_real_no_overflow : forall  (x : R) (m : mode) (fact0 : in_range x), no_overflow m x.
Axiom Round_monotonic : forall  (x : R) (y : R) (m : mode) (fact0 : Rle x y), Rle (round m x) (round m y).
Axiom Round_idempotent : forall  (m1 : mode) (m2 : mode) (x : R), round m1 (round m2 x) = round m2 x.
Axiom Round_to_real : forall  (x : t) (m : mode) (fact0 : t'isFinite x), round m (t'real x) = t'real x.
Axiom Round_down_le : forall  (x : R), Rle (round RTN x) x.
Axiom Round_up_ge : forall  (x : R), Rle x (round RTP x).
Axiom Round_down_neg : forall  (x : R), round RTN (Ropp x) = Ropp (round RTP x).
Axiom Round_up_neg : forall  (x : R), round RTP (Ropp x) = Ropp (round RTN x).
Axiom pow2sb1 : 9007199254740992%Z = pow2 53%Z.
Definition in_safe_int_range (i : Z) := - 9007199254740992%Z ≤ i ∧ i ≤ 9007199254740992%Z.
Axiom Exact_rounding_for_integers : forall  (i : Z) (m : mode) (fact0 : in_safe_int_range i), round m (Rdefinitions.IZR i) = Rdefinitions.IZR i.
Axiom from_real : mode -> R -> t.
Axiom from_real_in_range : forall  (m : mode) (r : R) (fact0 : in_range (round m r)), t'isFinite (from_real m r) ∧ t'real (from_real m r) = round m r.
Axiom from_real_large_neg : forall  (m : mode) (r : R) (fact0 : Rlt (round m r) (Ropp 179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368%R)), is_infinite (from_real m r) ∧ is_negative (from_real m r).
Axiom from_real_large_pos : forall  (m : mode) (r : R) (fact0 : Rlt 179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368%R (round m r)), is_infinite (from_real m r) ∧ is_positive (from_real m r).
Definition same_sign (x : t) (y : t) := is_positive x ∧ is_positive y ∨ is_negative x ∧ is_negative y.
Definition diff_sign (x : t) (y : t) := is_positive x ∧ is_negative y ∨ is_negative x ∧ is_positive y.
Axiom feq_eq : forall  (x : t) (y : t) (fact0 : t'isFinite x) (fact1 : t'isFinite y) (fact2 : ¬ is_zero x) (fact3 : eq x y), x = y.
Axiom eq_feq : forall  (x : t) (y : t) (fact0 : t'isFinite x) (fact1 : t'isFinite y) (fact2 : x = y), eq x y.
Axiom eq_refl : forall  (x : t) (fact0 : t'isFinite x), eq x x.
Axiom eq_sym : forall  (x : t) (y : t) (fact0 : eq x y), eq y x.
Axiom eq_trans : forall  (x : t) (y : t) (z : t) (fact0 : eq x y) (fact1 : eq y z), eq x z.
Axiom eq_zero : eq zeroF (neg zeroF).
Axiom eq_to_real_finite : forall  (x : t) (y : t) (fact0 : t'isFinite x) (fact1 : t'isFinite y), eq x y = (t'real x = t'real y).
Axiom eq_special : forall  (x : t) (y : t) (fact0 : eq x y), is_not_nan x ∧ is_not_nan y ∧ (t'isFinite x ∧ t'isFinite y ∨ is_infinite x ∧ is_infinite y ∧ same_sign x y).
Axiom lt_finite : forall  (x : t) (y : t) (fact0 : t'isFinite x) (fact1 : t'isFinite y), lt x y = Rlt (t'real x) (t'real y).
Axiom le_finite : forall  (x : t) (y : t) (fact0 : t'isFinite x) (fact1 : t'isFinite y), le x y = Rle (t'real x) (t'real y).
Axiom le_lt_trans : forall  (x : t) (y : t) (z : t) (fact0 : le x y) (fact1 : lt y z), lt x z.
Axiom lt_le_trans : forall  (x : t) (y : t) (z : t) (fact0 : lt x y) (fact1 : le y z), lt x z.
Axiom le_ge_asym : forall  (x : t) (y : t) (fact0 : le x y) (fact1 : le y x), eq x y.
Axiom not_lt_ge : forall  (x : t) (y : t) (fact0 : ¬ lt x y) (fact1 : is_not_nan x) (fact2 : is_not_nan y), le y x.
Axiom not_gt_le : forall  (y : t) (x : t) (fact0 : ¬ lt y x) (fact1 : is_not_nan x) (fact2 : is_not_nan y), le x y.
Axiom le_special : forall  (x : t) (y : t) (fact0 : le x y), t'isFinite x ∧ t'isFinite y ∨ is_minus_infinity x ∧ is_not_nan y ∨ is_not_nan x ∧ is_plus_infinity y.
Axiom lt_special : forall  (x : t) (y : t) (fact0 : lt x y), t'isFinite x ∧ t'isFinite y ∨ is_minus_infinity x ∧ is_not_nan y ∧ ¬ is_minus_infinity y ∨ is_not_nan x ∧ ¬ is_plus_infinity x ∧ is_plus_infinity y.
Axiom lt_lt_finite : forall  (x : t) (y : t) (z : t) (fact0 : lt x y) (fact1 : lt y z), t'isFinite y.
Axiom positive_to_real : forall  (x : t) (fact0 : t'isFinite x) (fact1 : is_positive x), Rle 0%R (t'real x).
Axiom to_real_positive : forall  (x : t) (fact0 : t'isFinite x) (fact1 : Rlt 0%R (t'real x)), is_positive x.
Axiom negative_to_real : forall  (x : t) (fact0 : t'isFinite x) (fact1 : is_negative x), Rle (t'real x) 0%R.
Axiom to_real_negative : forall  (x : t) (fact0 : t'isFinite x) (fact1 : Rlt (t'real x) 0%R), is_negative x.
Axiom negative_xor_positive : forall  (x : t), ¬ (is_positive x ∧ is_negative x).
Axiom negative_or_positive : forall  (x : t) (fact0 : is_not_nan x), is_positive x ∨ is_negative x.
Axiom diff_sign_trans : forall  (x : t) (y : t) (z : t) (fact0 : diff_sign x y) (fact1 : diff_sign y z), same_sign x z.
Axiom diff_sign_product : forall  (x : t) (y : t) (fact0 : t'isFinite x) (fact1 : t'isFinite y) (fact2 : Rlt (Rmult (t'real x) (t'real y)) 0%R), diff_sign x y.
Axiom same_sign_product : forall  (x : t) (y : t) (fact0 : t'isFinite x) (fact1 : t'isFinite y) (fact2 : same_sign x y), Rle 0%R (Rmult (t'real x) (t'real y)).
Definition product_sign (z : t) (x : t) (y : t) := (same_sign x y -> is_positive z) ∧ (diff_sign x y -> is_negative z).
Definition overflow_value (m : mode) (x : t) := match m with | RTN => (if decide (is_positive x) then t'isFinite x ∧ t'real x = 179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368%R else is_infinite x) | RTP => (if decide (is_positive x) then is_infinite x else t'isFinite x ∧ t'real x = Ropp 179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368%R) | RTZ => (if decide (is_positive x) then t'isFinite x ∧ t'real x = 179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368%R else t'isFinite x ∧ t'real x = Ropp 179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368%R) | RNA => is_infinite x | RNE => is_infinite x end.
Definition sign_zero_result (m : mode) (x : t) := is_zero x -> (match m with | RTN => is_negative x | _ => is_positive x end).
Axiom add_finite : forall  (x : t) (y : t) (m : mode) (fact0 : t'isFinite x) (fact1 : t'isFinite y) (fact2 : no_overflow m (Rplus (t'real x) (t'real y))), t'isFinite (add m x y) ∧ t'real (add m x y) = round m (Rplus (t'real x) (t'real y)).
Axiom add_finite_rev : forall  (m : mode) (x : t) (y : t) (fact0 : t'isFinite (add m x y)), t'isFinite x ∧ t'isFinite y.
Axiom add_finite_rev_n : forall  (m : mode) (x : t) (y : t) (fact0 : to_nearest m) (fact1 : t'isFinite (add m x y)), no_overflow m (Rplus (t'real x) (t'real y)) ∧ t'real (add m x y) = round m (Rplus (t'real x) (t'real y)).
Axiom sub_finite : forall  (x : t) (y : t) (m : mode) (fact0 : t'isFinite x) (fact1 : t'isFinite y) (fact2 : no_overflow m (Rminus (t'real x) (t'real y))), t'isFinite (sub m x y) ∧ t'real (sub m x y) = round m (Rminus (t'real x) (t'real y)).
Axiom sub_finite_rev : forall  (m : mode) (x : t) (y : t) (fact0 : t'isFinite (sub m x y)), t'isFinite x ∧ t'isFinite y.
Axiom sub_finite_rev_n : forall  (m : mode) (x : t) (y : t) (fact0 : to_nearest m) (fact1 : t'isFinite (sub m x y)), no_overflow m (Rminus (t'real x) (t'real y)) ∧ t'real (sub m x y) = round m (Rminus (t'real x) (t'real y)).
Axiom mul_finite : forall  (x : t) (y : t) (m : mode) (fact0 : t'isFinite x) (fact1 : t'isFinite y) (fact2 : no_overflow m (Rmult (t'real x) (t'real y))), t'isFinite (mul m x y) ∧ t'real (mul m x y) = round m (Rmult (t'real x) (t'real y)).
Axiom mul_finite_rev : forall  (m : mode) (x : t) (y : t) (fact0 : t'isFinite (mul m x y)), t'isFinite x ∧ t'isFinite y.
Axiom mul_finite_rev_n : forall  (m : mode) (x : t) (y : t) (fact0 : to_nearest m) (fact1 : t'isFinite (mul m x y)), no_overflow m (Rmult (t'real x) (t'real y)) ∧ t'real (mul m x y) = round m (Rmult (t'real x) (t'real y)).
Axiom div_finite : forall  (x : t) (y : t) (m : mode) (fact0 : t'isFinite x) (fact1 : t'isFinite y) (fact2 : ¬ is_zero y) (fact3 : no_overflow m (Rdiv (t'real x) (t'real y))), t'isFinite (div m x y) ∧ t'real (div m x y) = round m (Rdiv (t'real x) (t'real y)).
Axiom div_finite_rev : forall  (m : mode) (x : t) (y : t) (fact0 : t'isFinite (div m x y)), t'isFinite x ∧ t'isFinite y ∧ ¬ is_zero y ∨ t'isFinite x ∧ is_infinite y ∧ t'real (div m x y) = 0%R.
Axiom div_finite_rev_n : forall  (m : mode) (x : t) (y : t) (fact0 : to_nearest m) (fact1 : t'isFinite (div m x y)) (fact2 : t'isFinite y), no_overflow m (Rdiv (t'real x) (t'real y)) ∧ t'real (div m x y) = round m (Rdiv (t'real x) (t'real y)).
Axiom neg_finite : forall  (x : t) (fact0 : t'isFinite x), t'isFinite (neg x) ∧ t'real (neg x) = Ropp (t'real x).
Axiom neg_finite_rev : forall  (x : t) (fact0 : t'isFinite (neg x)), t'isFinite x ∧ t'real (neg x) = Ropp (t'real x).
Axiom abs_finite : forall  (x : t) (fact0 : t'isFinite x), t'isFinite (abs x) ∧ t'real (abs x) = Rabs (t'real x) ∧ is_positive (abs x).
Axiom abs_finite_rev : forall  (x : t) (fact0 : t'isFinite (abs x)), t'isFinite x ∧ t'real (abs x) = Rabs (t'real x).
Axiom abs_universal : forall  (x : t), ¬ is_negative (abs x).
Axiom fma_finite : forall  (x : t) (y : t) (z : t) (m : mode) (fact0 : t'isFinite x) (fact1 : t'isFinite y) (fact2 : t'isFinite z) (fact3 : no_overflow m (Rplus (Rmult (t'real x) (t'real y)) (t'real z))), t'isFinite (fma m x y z) ∧ t'real (fma m x y z) = round m (Rplus (Rmult (t'real x) (t'real y)) (t'real z)).
Axiom fma_finite_rev : forall  (m : mode) (x : t) (y : t) (z : t) (fact0 : t'isFinite (fma m x y z)), t'isFinite x ∧ t'isFinite y ∧ t'isFinite z.
Axiom fma_finite_rev_n : forall  (m : mode) (x : t) (y : t) (z : t) (fact0 : to_nearest m) (fact1 : t'isFinite (fma m x y z)), no_overflow m (Rplus (Rmult (t'real x) (t'real y)) (t'real z)) ∧ t'real (fma m x y z) = round m (Rplus (Rmult (t'real x) (t'real y)) (t'real z)).
Axiom sqrt_finite : forall  (x : t) (m : mode) (fact0 : t'isFinite x) (fact1 : Rle 0%R (t'real x)), t'isFinite (sqrt m x) ∧ t'real (sqrt m x) = round m (R_sqrt.sqrt (t'real x)).
Axiom sqrt_finite_rev : forall  (m : mode) (x : t) (fact0 : t'isFinite (sqrt m x)), t'isFinite x ∧ Rle 0%R (t'real x) ∧ t'real (sqrt m x) = round m (R_sqrt.sqrt (t'real x)).
Definition same_sign_real (x : t) (r : R) := is_positive x ∧ Rlt 0%R r ∨ is_negative x ∧ Rlt r 0%R.
Axiom add_special : forall  (m : mode) (x : t) (y : t), (is_nan x ∨ is_nan y -> is_nan (add m x y)) ∧ (t'isFinite x ∧ is_infinite y -> is_infinite (add m x y) ∧ same_sign (add m x y) y) ∧ (is_infinite x ∧ t'isFinite y -> is_infinite (add m x y) ∧ same_sign (add m x y) x) ∧ (is_infinite x ∧ is_infinite y ∧ same_sign x y -> is_infinite (add m x y) ∧ same_sign (add m x y) x) ∧ (is_infinite x ∧ is_infinite y ∧ diff_sign x y -> is_nan (add m x y)) ∧ (t'isFinite x ∧ t'isFinite y ∧ ¬ no_overflow m (Rplus (t'real x) (t'real y)) -> same_sign_real (add m x y) (Rplus (t'real x) (t'real y)) ∧ overflow_value m (add m x y)) ∧ (t'isFinite x ∧ t'isFinite y -> (if decide (same_sign x y) then same_sign (add m x y) x else sign_zero_result m (add m x y))).
Axiom sub_special : forall  (m : mode) (x : t) (y : t), (is_nan x ∨ is_nan y -> is_nan (sub m x y)) ∧ (t'isFinite x ∧ is_infinite y -> is_infinite (sub m x y) ∧ diff_sign (sub m x y) y) ∧ (is_infinite x ∧ t'isFinite y -> is_infinite (sub m x y) ∧ same_sign (sub m x y) x) ∧ (is_infinite x ∧ is_infinite y ∧ same_sign x y -> is_nan (sub m x y)) ∧ (is_infinite x ∧ is_infinite y ∧ diff_sign x y -> is_infinite (sub m x y) ∧ same_sign (sub m x y) x) ∧ (t'isFinite x ∧ t'isFinite y ∧ ¬ no_overflow m (Rminus (t'real x) (t'real y)) -> same_sign_real (sub m x y) (Rminus (t'real x) (t'real y)) ∧ overflow_value m (sub m x y)) ∧ (t'isFinite x ∧ t'isFinite y -> (if decide (diff_sign x y) then same_sign (sub m x y) x else sign_zero_result m (sub m x y))).
Axiom mul_special : forall  (m : mode) (x : t) (y : t), (is_nan x ∨ is_nan y -> is_nan (mul m x y)) ∧ (is_zero x ∧ is_infinite y -> is_nan (mul m x y)) ∧ (t'isFinite x ∧ is_infinite y ∧ ¬ is_zero x -> is_infinite (mul m x y)) ∧ (is_infinite x ∧ is_zero y -> is_nan (mul m x y)) ∧ (is_infinite x ∧ t'isFinite y ∧ ¬ is_zero y -> is_infinite (mul m x y)) ∧ (is_infinite x ∧ is_infinite y -> is_infinite (mul m x y)) ∧ (t'isFinite x ∧ t'isFinite y ∧ ¬ no_overflow m (Rmult (t'real x) (t'real y)) -> overflow_value m (mul m x y)) ∧ (¬ is_nan (mul m x y) -> product_sign (mul m x y) x y).
Axiom div_special : forall  (m : mode) (x : t) (y : t), (is_nan x ∨ is_nan y -> is_nan (div m x y)) ∧ (t'isFinite x ∧ is_infinite y -> is_zero (div m x y)) ∧ (is_infinite x ∧ t'isFinite y -> is_infinite (div m x y)) ∧ (is_infinite x ∧ is_infinite y -> is_nan (div m x y)) ∧ (t'isFinite x ∧ t'isFinite y ∧ ¬ is_zero y ∧ ¬ no_overflow m (Rdiv (t'real x) (t'real y)) -> overflow_value m (div m x y)) ∧ (t'isFinite x ∧ is_zero y ∧ ¬ is_zero x -> is_infinite (div m x y)) ∧ (is_zero x ∧ is_zero y -> is_nan (div m x y)) ∧ (¬ is_nan (div m x y) -> product_sign (div m x y) x y).
Axiom neg_special : forall  (x : t), (is_nan x -> is_nan (neg x)) ∧ (is_infinite x -> is_infinite (neg x)) ∧ (¬ is_nan x -> diff_sign x (neg x)).
Axiom abs_special : forall  (x : t), (is_nan x -> is_nan (abs x)) ∧ (is_infinite x -> is_infinite (abs x)) ∧ (¬ is_nan x -> is_positive (abs x)).
Axiom fma_special : forall  (m : mode) (x : t) (y : t) (z : t), (is_nan x ∨ is_nan y ∨ is_nan z -> is_nan (fma m x y z)) ∧ (is_zero x ∧ is_infinite y -> is_nan (fma m x y z)) ∧ (is_infinite x ∧ is_zero y -> is_nan (fma m x y z)) ∧ (t'isFinite x ∧ ¬ is_zero x ∧ is_infinite y ∧ t'isFinite z -> is_infinite (fma m x y z) ∧ product_sign (fma m x y z) x y) ∧ (t'isFinite x ∧ ¬ is_zero x ∧ is_infinite y ∧ is_infinite z -> (if decide (product_sign z x y) then is_infinite (fma m x y z) ∧ same_sign (fma m x y z) z else is_nan (fma m x y z))) ∧ (is_infinite x ∧ t'isFinite y ∧ ¬ is_zero y ∧ t'isFinite z -> is_infinite (fma m x y z) ∧ product_sign (fma m x y z) x y) ∧ (is_infinite x ∧ t'isFinite y ∧ ¬ is_zero y ∧ is_infinite z -> (if decide (product_sign z x y) then is_infinite (fma m x y z) ∧ same_sign (fma m x y z) z else is_nan (fma m x y z))) ∧ (is_infinite x ∧ is_infinite y ∧ t'isFinite z -> is_infinite (fma m x y z) ∧ product_sign (fma m x y z) x y) ∧ (t'isFinite x ∧ t'isFinite y ∧ is_infinite z -> is_infinite (fma m x y z) ∧ same_sign (fma m x y z) z) ∧ (is_infinite x ∧ is_infinite y ∧ is_infinite z -> (if decide (product_sign z x y) then is_infinite (fma m x y z) ∧ same_sign (fma m x y z) z else is_nan (fma m x y z))) ∧ (t'isFinite x ∧ t'isFinite y ∧ t'isFinite z ∧ ¬ no_overflow m (Rplus (Rmult (t'real x) (t'real y)) (t'real z)) -> same_sign_real (fma m x y z) (Rplus (Rmult (t'real x) (t'real y)) (t'real z)) ∧ overflow_value m (fma m x y z)) ∧ (t'isFinite x ∧ t'isFinite y ∧ t'isFinite z -> (if decide (product_sign z x y) then same_sign (fma m x y z) z else Rplus (Rmult (t'real x) (t'real y)) (t'real z) = 0%R -> (if decide (m = RTN) then is_negative (fma m x y z) else is_positive (fma m x y z)))).
Axiom sqrt_special : forall  (m : mode) (x : t), (is_nan x -> is_nan (sqrt m x)) ∧ (is_plus_infinity x -> is_plus_infinity (sqrt m x)) ∧ (is_minus_infinity x -> is_nan (sqrt m x)) ∧ (t'isFinite x ∧ Rlt (t'real x) 0%R -> is_nan (sqrt m x)) ∧ (is_zero x -> same_sign (sqrt m x) x) ∧ (t'isFinite x ∧ Rlt 0%R (t'real x) -> is_positive (sqrt m x)).
Axiom of_int_add_exact : forall  (i : Z) (j : Z) (m : mode) (n : mode) (fact0 : in_safe_int_range i) (fact1 : in_safe_int_range j) (fact2 : in_safe_int_range (i + j)), eq (of_int m (i + j)) (add n (of_int m i) (of_int m j)).
Axiom of_int_sub_exact : forall  (i : Z) (j : Z) (m : mode) (n : mode) (fact0 : in_safe_int_range i) (fact1 : in_safe_int_range j) (fact2 : in_safe_int_range (i - j)), eq (of_int m (i - j)) (sub n (of_int m i) (of_int m j)).
Axiom of_int_mul_exact : forall  (i : Z) (j : Z) (m : mode) (n : mode) (fact0 : in_safe_int_range i) (fact1 : in_safe_int_range j) (fact2 : in_safe_int_range (i * j)), eq (of_int m (i * j)) (mul n (of_int m i) (of_int m j)).
Axiom Min_r : forall  (y : t) (x : t) (fact0 : le y x), eq (min x y) y.
Axiom Min_l : forall  (x : t) (y : t) (fact0 : le x y), eq (min x y) x.
Axiom Max_r : forall  (y : t) (x : t) (fact0 : le y x), eq (max x y) x.
Axiom Max_l : forall  (x : t) (y : t) (fact0 : le x y), eq (max x y) y.
Axiom is_int : t -> Prop.
Axiom zeroF_is_int : is_int zeroF.
Axiom of_int_is_int : forall  (x : Z) (m : mode) (fact0 : in_int_range x), is_int (of_int m x).
Axiom big_float_is_int : forall  (i : t) (m : mode) (fact0 : t'isFinite i) (fact1 : le i (neg (of_int m 9007199254740992%Z)) ∨ le (of_int m 9007199254740992%Z) i), is_int i.
Axiom roundToIntegral_is_int : forall  (x : t) (m : mode) (fact0 : t'isFinite x), is_int (roundToIntegral m x).
Axiom eq_is_int : forall  (x : t) (y : t) (fact0 : eq x y) (fact1 : is_int x), is_int y.
Axiom add_int : forall  (x : t) (y : t) (m : mode) (fact0 : is_int x) (fact1 : is_int y) (fact2 : t'isFinite (add m x y)), is_int (add m x y).
Axiom sub_int : forall  (x : t) (y : t) (m : mode) (fact0 : is_int x) (fact1 : is_int y) (fact2 : t'isFinite (sub m x y)), is_int (sub m x y).
Axiom mul_int : forall  (x : t) (y : t) (m : mode) (fact0 : is_int x) (fact1 : is_int y) (fact2 : t'isFinite (mul m x y)), is_int (mul m x y).
Axiom fma_int : forall  (x : t) (y : t) (z : t) (m : mode) (fact0 : is_int x) (fact1 : is_int y) (fact2 : is_int z) (fact3 : t'isFinite (fma m x y z)), is_int (fma m x y z).
Axiom neg_int : forall  (x : t) (fact0 : is_int x), is_int (neg x).
Axiom abs_int : forall  (x : t) (fact0 : is_int x), is_int (abs x).
Axiom is_int_of_int : forall  (x : t) (m' : mode) (m : mode) (fact0 : is_int x), eq x (of_int m' (to_int m x)).
Axiom is_int_to_int : forall  (x : t) (m : mode) (fact0 : is_int x), in_int_range (to_int m x).
Axiom is_int_is_finite : forall  (x : t) (fact0 : is_int x), t'isFinite x.
Axiom int_to_real : forall  (x : t) (m : mode) (fact0 : is_int x), t'real x = Rdefinitions.IZR (to_int m x).
Axiom truncate_int : forall  (i : t) (m : mode) (fact0 : is_int i), eq (roundToIntegral m i) i.
Axiom truncate_neg : forall  (x : t) (fact0 : t'isFinite x) (fact1 : is_negative x), roundToIntegral RTZ x = roundToIntegral RTP x.
Axiom truncate_pos : forall  (x : t) (fact0 : t'isFinite x) (fact1 : is_positive x), roundToIntegral RTZ x = roundToIntegral RTN x.
Axiom ceil_le : forall  (x : t) (fact0 : t'isFinite x), le x (roundToIntegral RTP x).
Axiom ceil_lest : forall  (x : t) (y : t) (fact0 : le x y) (fact1 : is_int y), le (roundToIntegral RTP x) y.
Axiom ceil_to_real : forall  (x : t) (fact0 : t'isFinite x), t'real (roundToIntegral RTP x) = Rdefinitions.IZR (ceil (t'real x)).
Axiom ceil_to_int : forall  (x : t) (m : mode) (fact0 : t'isFinite x), to_int m (roundToIntegral RTP x) = ceil (t'real x).
Axiom floor_le : forall  (x : t) (fact0 : t'isFinite x), le (roundToIntegral RTN x) x.
Axiom floor_lest : forall  (y : t) (x : t) (fact0 : le y x) (fact1 : is_int y), le y (roundToIntegral RTN x).
Axiom floor_to_real : forall  (x : t) (fact0 : t'isFinite x), t'real (roundToIntegral RTN x) = Rdefinitions.IZR (floor (t'real x)).
Axiom floor_to_int : forall  (x : t) (m : mode) (fact0 : t'isFinite x), to_int m (roundToIntegral RTN x) = floor (t'real x).
Axiom RNA_down : forall  (x : t) (fact0 : lt (sub RNE x (roundToIntegral RTN x)) (sub RNE (roundToIntegral RTP x) x)), roundToIntegral RNA x = roundToIntegral RTN x.
Axiom RNA_up : forall  (x : t) (fact0 : lt (sub RNE (roundToIntegral RTP x) x) (sub RNE x (roundToIntegral RTN x))), roundToIntegral RNA x = roundToIntegral RTP x.
Axiom RNA_down_tie : forall  (x : t) (fact0 : eq (sub RNE x (roundToIntegral RTN x)) (sub RNE (roundToIntegral RTP x) x)) (fact1 : is_negative x), roundToIntegral RNA x = roundToIntegral RTN x.
Axiom RNA_up_tie : forall  (x : t) (fact0 : eq (sub RNE (roundToIntegral RTP x) x) (sub RNE x (roundToIntegral RTN x))) (fact1 : is_positive x), roundToIntegral RNA x = roundToIntegral RTP x.
Axiom to_int_roundToIntegral : forall  (m : mode) (x : t), to_int m x = to_int m (roundToIntegral m x).
Axiom to_int_monotonic : forall  (x : t) (y : t) (m : mode) (fact0 : t'isFinite x) (fact1 : t'isFinite y) (fact2 : le x y), to_int m x ≤ to_int m y.
Axiom to_int_of_int : forall  (i : Z) (m : mode) (fact0 : in_safe_int_range i), to_int m (of_int m i) = i.
Axiom eq_to_int : forall  (x : t) (y : t) (m : mode) (fact0 : t'isFinite x) (fact1 : eq x y), to_int m x = to_int m y.
Axiom neg_to_int : forall  (x : t) (m : mode) (fact0 : is_int x), to_int m (neg x) = - to_int m x.
Axiom roundToIntegral_is_finite : forall  (x : t) (m : mode) (fact0 : t'isFinite x), t'isFinite (roundToIntegral m x).
Axiom round_bound_ne : forall  (x : R) (fact0 : no_overflow RNE x), Rle (Rminus (Rminus x (Rmult (Rdiv 1%R 9007199254740992) (Rabs x))) (Rdiv 1%R 404804506614621236704990693437834614099113299528284236713802716054860679135990693783920767402874248990374155728633623822779617474771586953734026799881477019843034848553132722728933815484186432682479535356945490137124014966849385397236206711298319112681620113024717539104666829230461005064372655017292012526615415482186989568)) (round RNE x) ∧ Rle (round RNE x) (Rplus (Rplus x (Rmult (Rdiv 1%R 9007199254740992) (Rabs x))) (Rdiv 1%R 404804506614621236704990693437834614099113299528284236713802716054860679135990693783920767402874248990374155728633623822779617474771586953734026799881477019843034848553132722728933815484186432682479535356945490137124014966849385397236206711298319112681620113024717539104666829230461005064372655017292012526615415482186989568)).
Axiom round_bound : forall  (m : mode) (x : R) (fact0 : no_overflow m x), Rle (Rminus (Rminus x (Rmult (Rdiv 1%R 4503599627370496) (Rabs x))) (Rdiv 1%R 202402253307310618352495346718917307049556649764142118356901358027430339567995346891960383701437124495187077864316811911389808737385793476867013399940738509921517424276566361364466907742093216341239767678472745068562007483424692698618103355649159556340810056512358769552333414615230502532186327508646006263307707741093494784)) (round m x) ∧ Rle (round m x) (Rplus (Rplus x (Rmult (Rdiv 1%R 4503599627370496) (Rabs x))) (Rdiv 1%R 202402253307310618352495346718917307049556649764142118356901358027430339567995346891960383701437124495187077864316811911389808737385793476867013399940738509921517424276566361364466907742093216341239767678472745068562007483424692698618103355649159556340810056512358769552333414615230502532186327508646006263307707741093494784)).

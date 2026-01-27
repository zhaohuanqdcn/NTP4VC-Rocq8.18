import Why3.Base
import Why3.floating_point.Rounding
import Why3.floating_point.SingleFormat
open Classical
open Lean4Why3
namespace Single
axiom round : Rounding.mode -> ℝ -> ℝ
axiom value : SingleFormat.single -> ℝ
axiom exact : SingleFormat.single -> ℝ
axiom model : SingleFormat.single -> ℝ
noncomputable def round_error (x : SingleFormat.single) := abs (value x - exact x)
noncomputable def total_error (x : SingleFormat.single) := abs (value x - model x)
noncomputable def no_overflow (m : Rounding.mode) (x : ℝ) := abs (round m x) ≤ (340282346638528859811704183484516925440 : ℝ)
axiom Bounded_real_no_overflow (x : ℝ) (m : Rounding.mode) (fact0 : abs x ≤ (340282346638528859811704183484516925440 : ℝ)) : no_overflow m x
axiom Round_monotonic (x : ℝ) (y : ℝ) (m : Rounding.mode) (fact0 : x ≤ y) : round m x ≤ round m y
axiom Round_idempotent (m1 : Rounding.mode) (m2 : Rounding.mode) (x : ℝ) : round m1 (round m2 x) = round m2 x
axiom Round_value (m : Rounding.mode) (x : SingleFormat.single) : round m (value x) = value x
axiom Bounded_value (x : SingleFormat.single) : abs (value x) ≤ (340282346638528859811704183484516925440 : ℝ)
axiom Exact_rounding_for_integers (i : ℤ) (m : Rounding.mode) (fact0 : -(16777216 : ℤ) ≤ i) (fact1 : i ≤ (16777216 : ℤ)) : round m (Int.to_Real i) = Int.to_Real i
axiom Round_down_le (x : ℝ) : round Rounding.mode.Down x ≤ x
axiom Round_up_ge (x : ℝ) : x ≤ round Rounding.mode.Up x
axiom Round_down_neg (x : ℝ) : round Rounding.mode.Down (-x) = -round Rounding.mode.Up x
axiom Round_up_neg (x : ℝ) : round Rounding.mode.Up (-x) = -round Rounding.mode.Down x
axiom round_logic : Rounding.mode -> ℝ -> SingleFormat.single
axiom Round_logic_def (m : Rounding.mode) (x : ℝ) (fact0 : no_overflow m x) : value (round_logic m x) = round m x
noncomputable def of_real_post (m : Rounding.mode) (x : ℝ) (res : SingleFormat.single) := value res = round m x ∧ exact res = x ∧ model res = x
noncomputable def add_post (m : Rounding.mode) (x : SingleFormat.single) (y : SingleFormat.single) (res : SingleFormat.single) := value res = round m (value x + value y) ∧ exact res = exact x + exact y ∧ model res = model x + model y
noncomputable def sub_post (m : Rounding.mode) (x : SingleFormat.single) (y : SingleFormat.single) (res : SingleFormat.single) := value res = round m (value x - value y) ∧ exact res = exact x - exact y ∧ model res = model x - model y
noncomputable def mul_post (m : Rounding.mode) (x : SingleFormat.single) (y : SingleFormat.single) (res : SingleFormat.single) := value res = round m (value x * value y) ∧ exact res = exact x * exact y ∧ model res = model x * model y
noncomputable def div_post (m : Rounding.mode) (x : SingleFormat.single) (y : SingleFormat.single) (res : SingleFormat.single) := value res = round m (value x / value y) ∧ exact res = exact x / exact y ∧ model res = model x / model y
noncomputable def neg_post (x : SingleFormat.single) (res : SingleFormat.single) := value res = -value x ∧ exact res = -exact x ∧ model res = -model x
noncomputable def lt (x : SingleFormat.single) (y : SingleFormat.single) := value x < value y
noncomputable def gt (x : SingleFormat.single) (y : SingleFormat.single) := value y < value x
end Single

import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cmath.Cmath
import Why3.Square.Square
import frama_c.airborne.float_rmat_of_eulers_312.lib.lean.Compound.Compound
import frama_c.airborne.float_rmat_of_eulers_312.lib.lean.Axiomatic15.Axiomatic15
import Why3.Cfloat.Cfloat
import frama_c.airborne.float_rmat_of_eulers_312.lib.lean.Axiomatic17.Axiomatic17
import frama_c.airborne.float_rmat_of_eulers_312.lib.lean.S10_RealRMat_s.S10_RealRMat_s
open Classical
open Lean4Why3
namespace float_rmat_of_eulers_312_Why3_ide_VCfloat_rmat_of_eulers_312_post_2_goal1
theorem goal1 (t_1 : Memory.addr -> ℝ) (a_1 : Memory.addr) (a : Memory.addr) (t : ℤ -> ℤ) : let r : ℝ := t_1 (Memory.shift a_1 (0 : ℤ)); let r_1 : ℝ := Real.sin r; let r_2 : ℝ := t_1 (Memory.shift a_1 (2 : ℤ)); let r_3 : ℝ := Real.sin r_2; let r_4 : ℝ := t_1 (Memory.shift a_1 (1 : ℤ)); let r_5 : ℝ := Real.sin r_4; let r_6 : ℝ := Real.cos r; let r_7 : ℝ := Real.cos r_2; let r_8 : ℝ := Real.cos r_4; let a_2 : Memory.addr := Memory.shift a (0 : ℤ); let r_9 : ℝ := r_1 * r_5; let r_10 : ℝ := -r_6; let r_11 : ℝ := r_1 * r_8; Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → r_1 ≤ (1 : ℝ) → r_3 ≤ (1 : ℝ) → r_5 ≤ (1 : ℝ) → r_6 ≤ (1 : ℝ) → r_7 ≤ (1 : ℝ) → r_8 ≤ (1 : ℝ) → -(1 : ℝ) ≤ r_1 → -(1 : ℝ) ≤ r_3 → -(1 : ℝ) ≤ r_5 → -(1 : ℝ) ≤ r_6 → -(1 : ℝ) ≤ r_7 → -(1 : ℝ) ≤ r_8 → Memory.linked t → Memory.valid_rw t a (9 : ℤ) → Axiomatic15.p_rvalid_floateulers t t_1 a_1 → Cfloat.is_finite32 r → Cfloat.is_finite32 r_2 → Cfloat.is_finite32 r_4 → Cfloat.is_float32 r → Cfloat.is_float32 r_2 → Cfloat.is_float32 r_4 → Cfloat.is_finite32 r_1 → Cfloat.is_finite32 r_3 → Cfloat.is_finite32 r_5 → Cfloat.is_finite32 r_6 → Cfloat.is_finite32 r_7 → Cfloat.is_finite32 r_8 → Cfloat.is_float32 r_1 → Cfloat.is_float32 r_3 → Cfloat.is_float32 r_5 → Cfloat.is_float32 r_6 → Cfloat.is_float32 r_7 → Cfloat.is_float32 r_8 → Axiomatic17.p_special_orthogonal (Axiomatic17.l_l_rmat_of_floatrmat (Function.update (Function.update (Function.update (Function.update (Function.update (Function.update (Function.update (Function.update (Function.update t_1 (Memory.shift a_2 (0 : ℤ)) (r_8 * r_7 + -(r_9 * r_3))) (Memory.shift a_2 (1 : ℤ)) (r_8 * r_3 + r_9 * r_7)) (Memory.shift a_2 (2 : ℤ)) (r_10 * r_5)) (Memory.shift a_2 (3 : ℤ)) (r_10 * r_3)) (Memory.shift a_2 (4 : ℤ)) (r_6 * r_7)) (Memory.shift a_2 (5 : ℤ)) r_1) (Memory.shift a_2 (6 : ℤ)) (r_5 * r_7 + r_11 * r_3)) (Memory.shift a_2 (7 : ℤ)) (r_5 * r_3 + -(r_11 * r_7))) (Memory.shift a_2 (8 : ℤ)) (r_6 * r_8)) a)
  := sorry
end float_rmat_of_eulers_312_Why3_ide_VCfloat_rmat_of_eulers_312_post_2_goal1

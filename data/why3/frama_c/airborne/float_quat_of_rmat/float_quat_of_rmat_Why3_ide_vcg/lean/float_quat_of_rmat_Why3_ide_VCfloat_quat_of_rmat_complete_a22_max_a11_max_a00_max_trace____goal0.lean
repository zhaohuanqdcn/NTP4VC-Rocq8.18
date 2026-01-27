import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.airborne.float_quat_of_rmat.lib.lean.Axiomatic15.Axiomatic15
import Why3.Cmath.Cmath
import Why3.Cfloat.Cfloat
import frama_c.airborne.float_quat_of_rmat.lib.lean.Compound.Compound
import frama_c.airborne.float_quat_of_rmat.lib.lean.Axiomatic17.Axiomatic17
import frama_c.airborne.float_quat_of_rmat.lib.lean.S10_RealRMat_s.S10_RealRMat_s
import frama_c.airborne.float_quat_of_rmat.lib.lean.Axiomatic19.Axiomatic19
import frama_c.airborne.float_quat_of_rmat.lib.lean.S11_RealQuat_s.S11_RealQuat_s
import Why3.Square.Square
open Classical
open Lean4Why3
namespace float_quat_of_rmat_Why3_ide_VCfloat_quat_of_rmat_complete_a22_max_a11_max_a00_max_trace____goal0
theorem goal0 (t_1 : Memory.addr -> ℝ) (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) : let a_2 : S10_RealRMat_s.s10_realrmat_s := Axiomatic17.l_l_rmat_of_floatrmat t_1 a; let a_3 : Memory.addr := Memory.shift a (0 : ℤ); let r : ℝ := t_1 (Memory.shift a_3 (0 : ℤ)); let r_1 : ℝ := t_1 (Memory.shift a_3 (4 : ℤ)); let r_2 : ℝ := t_1 (Memory.shift a_3 (8 : ℤ)); let r_3 : ℝ := Axiomatic19.l_trace_2' t_1 a; Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.valid_rw t a_1 (4 : ℤ) → Axiomatic15.p_rvalid_floatrmat t t_1 a → Memory.separated a (9 : ℤ) a_1 (4 : ℤ) → Axiomatic17.p_rotation_matrix a_2 → Axiomatic17.p_special_orthogonal a_2 → Cfloat.is_float32 r → Cfloat.is_float32 r_1 → Cfloat.is_float32 r_2 → (0 : ℝ) < r_3 ∨ r_3 ≤ (0 : ℝ) ∧ r_1 < r ∧ r_2 < r ∨ r_3 ≤ (0 : ℝ) ∧ r ≤ r_1 ∧ r_2 < r_1 ∨ r_3 ≤ (0 : ℝ) ∧ r ≤ r_2 ∧ r_1 ≤ r_2
  := sorry
end float_quat_of_rmat_Why3_ide_VCfloat_quat_of_rmat_complete_a22_max_a11_max_a00_max_trace____goal0

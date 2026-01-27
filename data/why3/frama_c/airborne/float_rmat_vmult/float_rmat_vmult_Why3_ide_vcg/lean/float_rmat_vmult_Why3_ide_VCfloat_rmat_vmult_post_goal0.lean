import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.airborne.float_rmat_vmult.lib.lean.Axiomatic15.Axiomatic15
import Why3.Cmath.Cmath
import Why3.Cfloat.Cfloat
import frama_c.airborne.float_rmat_vmult.lib.lean.Compound.Compound
import frama_c.airborne.float_rmat_vmult.lib.lean.S9_RealVect3_s.S9_RealVect3_s
import frama_c.airborne.float_rmat_vmult.lib.lean.Axiomatic16.Axiomatic16
import frama_c.airborne.float_rmat_vmult.lib.lean.Axiomatic17.Axiomatic17
import frama_c.airborne.float_rmat_vmult.lib.lean.S10_RealRMat_s.S10_RealRMat_s
open Classical
open Lean4Why3
namespace float_rmat_vmult_Why3_ide_VCfloat_rmat_vmult_post_goal0
theorem goal0 (a_1 : Memory.addr) (t_1 : Memory.addr -> ℝ) (a_2 : Memory.addr) (a : Memory.addr) (t : ℤ -> ℤ) : let a_3 : Memory.addr := Memory.shift a_1 (0 : ℤ); let r : ℝ := t_1 a_3; let a_4 : Memory.addr := Memory.shift a_1 (1 : ℤ); let r_1 : ℝ := t_1 a_4; let a_5 : Memory.addr := Memory.shift a_1 (2 : ℤ); let r_2 : ℝ := t_1 a_5; let a_6 : Memory.addr := Memory.shift a_2 (0 : ℤ); let r_3 : ℝ := t_1 (Memory.shift a_6 (0 : ℤ)); let r_4 : ℝ := t_1 (Memory.shift a_6 (1 : ℤ)); let r_5 : ℝ := t_1 (Memory.shift a_6 (2 : ℤ)); let m : Memory.addr -> ℝ := Function.update t_1 (Memory.shift a (0 : ℤ)) (r_3 * r + r_4 * r_1 + r_5 * r_2); let r_6 : ℝ := m a_3; let r_7 : ℝ := m a_4; let r_8 : ℝ := m a_5; let r_9 : ℝ := m (Memory.shift a_6 (3 : ℤ)); let r_10 : ℝ := m (Memory.shift a_6 (4 : ℤ)); let r_11 : ℝ := m (Memory.shift a_6 (5 : ℤ)); let m_1 : Memory.addr -> ℝ := Function.update m (Memory.shift a (1 : ℤ)) (r_9 * r_6 + r_10 * r_7 + r_11 * r_8); let r_12 : ℝ := m_1 a_3; let r_13 : ℝ := m_1 a_4; let r_14 : ℝ := m_1 a_5; let r_15 : ℝ := m_1 (Memory.shift a_6 (6 : ℤ)); let r_16 : ℝ := m_1 (Memory.shift a_6 (7 : ℤ)); let r_17 : ℝ := m_1 (Memory.shift a_6 (8 : ℤ)); let m_2 : Memory.addr -> ℝ := Function.update m_1 (Memory.shift a (2 : ℤ)) (r_15 * r_12 + r_16 * r_13 + r_17 * r_14); Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.linked t → Memory.valid_rw t a (3 : ℤ) → Axiomatic15.p_rvalid_floatvect3 t t_1 a_1 → Axiomatic15.p_rvalid_floatrmat t t_1 a_2 → Memory.separated a (3 : ℤ) a_1 (3 : ℤ) → Memory.separated a (3 : ℤ) a_2 (9 : ℤ) → Memory.separated a_1 (3 : ℤ) a_2 (9 : ℤ) → Cfloat.is_float32 r → Cfloat.is_float32 r_1 → Cfloat.is_float32 r_2 → Cfloat.is_float32 r_3 → Cfloat.is_float32 r_4 → Cfloat.is_float32 r_5 → Cfloat.is_float32 r_6 → Cfloat.is_float32 r_7 → Cfloat.is_float32 r_8 → Cfloat.is_float32 r_9 → Cfloat.is_float32 r_10 → Cfloat.is_float32 r_11 → Cfloat.is_float32 r_12 → Cfloat.is_float32 r_13 → Cfloat.is_float32 r_14 → Cfloat.is_float32 r_15 → Cfloat.is_float32 r_16 → Cfloat.is_float32 r_17 → S9_RealVect3_s.eqs9_realvect3_s (Axiomatic16.l_l_vect_of_floatvect3 m_2 a) (Axiomatic17.l_mult_realrmat_realvect3 (Axiomatic17.l_l_rmat_of_floatrmat m_2 a_2) (Axiomatic16.l_l_vect_of_floatvect3 m_2 a_1))
  := sorry
end float_rmat_vmult_Why3_ide_VCfloat_rmat_vmult_post_goal0

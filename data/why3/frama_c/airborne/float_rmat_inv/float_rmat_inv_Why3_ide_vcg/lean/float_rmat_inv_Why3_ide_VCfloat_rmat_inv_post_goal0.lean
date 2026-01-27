import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.airborne.float_rmat_inv.lib.lean.Axiomatic15.Axiomatic15
import Why3.Cmath.Cmath
import Why3.Cfloat.Cfloat
import frama_c.airborne.float_rmat_inv.lib.lean.Compound.Compound
import frama_c.airborne.float_rmat_inv.lib.lean.S10_RealRMat_s.S10_RealRMat_s
import frama_c.airborne.float_rmat_inv.lib.lean.Axiomatic17.Axiomatic17
open Classical
open Lean4Why3
namespace float_rmat_inv_Why3_ide_VCfloat_rmat_inv_post_goal0
theorem goal0 (a : Memory.addr) (a_1 : Memory.addr) (t_1 : Memory.addr -> ℝ) (t : ℤ -> ℤ) : let a_2 : Memory.addr := Memory.shift a (0 : ℤ); let a_3 : Memory.addr := Memory.shift a_1 (0 : ℤ); let m : Memory.addr -> ℝ := Function.update t_1 (Memory.shift a_2 (0 : ℤ)) (t_1 (Memory.shift a_3 (0 : ℤ))); let m_1 : Memory.addr -> ℝ := Function.update m (Memory.shift a_2 (1 : ℤ)) (m (Memory.shift a_3 (3 : ℤ))); let m_2 : Memory.addr -> ℝ := Function.update m_1 (Memory.shift a_2 (2 : ℤ)) (m_1 (Memory.shift a_3 (6 : ℤ))); let m_3 : Memory.addr -> ℝ := Function.update m_2 (Memory.shift a_2 (3 : ℤ)) (m_2 (Memory.shift a_3 (1 : ℤ))); let m_4 : Memory.addr -> ℝ := Function.update m_3 (Memory.shift a_2 (4 : ℤ)) (m_3 (Memory.shift a_3 (4 : ℤ))); let m_5 : Memory.addr -> ℝ := Function.update m_4 (Memory.shift a_2 (5 : ℤ)) (m_4 (Memory.shift a_3 (7 : ℤ))); let m_6 : Memory.addr -> ℝ := Function.update m_5 (Memory.shift a_2 (6 : ℤ)) (m_5 (Memory.shift a_3 (2 : ℤ))); let m_7 : Memory.addr -> ℝ := Function.update m_6 (Memory.shift a_2 (7 : ℤ)) (m_6 (Memory.shift a_3 (5 : ℤ))); let m_8 : Memory.addr -> ℝ := Function.update m_7 (Memory.shift a_2 (8 : ℤ)) (m_7 (Memory.shift a_3 (8 : ℤ))); Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.valid_rw t a (9 : ℤ) → Axiomatic15.p_rvalid_floatrmat t t_1 a_1 → Memory.separated a (9 : ℤ) a_1 (9 : ℤ) → S10_RealRMat_s.eqs10_realrmat_s (Axiomatic17.l_transpose (Axiomatic17.l_l_rmat_of_floatrmat m_8 a_1)) (Axiomatic17.l_l_rmat_of_floatrmat m_8 a)
  := sorry
end float_rmat_inv_Why3_ide_VCfloat_rmat_inv_post_goal0

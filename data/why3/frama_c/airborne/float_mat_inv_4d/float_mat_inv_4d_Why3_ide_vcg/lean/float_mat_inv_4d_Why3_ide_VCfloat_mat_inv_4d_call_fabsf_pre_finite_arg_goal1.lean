import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cmath.Cmath
import Why3.Cfloat.Cfloat
import frama_c.airborne.float_mat_inv_4d.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace float_mat_inv_4d_Why3_ide_VCfloat_mat_inv_4d_call_fabsf_pre_finite_arg_goal1
theorem goal1 (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) (r : ℝ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact2 : Memory.linked t) (fact3 : Cfloat.is_float32 r) (fact4 : Memory.valid_rd t (Memory.shift a (0 : ℤ)) (16 : ℤ)) (fact5 : Memory.valid_rw t (Memory.shift a_1 (0 : ℤ)) (16 : ℤ)) : Cfloat.is_finite32 r
  := sorry
end float_mat_inv_4d_Why3_ide_VCfloat_mat_inv_4d_call_fabsf_pre_finite_arg_goal1

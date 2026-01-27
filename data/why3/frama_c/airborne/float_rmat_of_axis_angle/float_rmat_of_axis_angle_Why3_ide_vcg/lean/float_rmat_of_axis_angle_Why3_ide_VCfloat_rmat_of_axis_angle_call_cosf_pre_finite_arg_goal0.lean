import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cmath.Cmath
import Why3.Cfloat.Cfloat
import frama_c.airborne.float_rmat_of_axis_angle.lib.lean.Axiomatic15.Axiomatic15
import frama_c.airborne.float_rmat_of_axis_angle.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace float_rmat_of_axis_angle_Why3_ide_VCfloat_rmat_of_axis_angle_call_cosf_pre_finite_arg_goal0
theorem goal0 (a : Memory.addr) (t : ℤ -> ℤ) (r : ℝ) (t_1 : Memory.addr -> ℝ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.linked t) (fact2 : Cfloat.is_float32 r) (fact3 : Axiomatic15.p_rvalid_floatvect3 t t_1 a) (fact4 : Cfloat.is_float32 (t_1 (Memory.shift a (0 : ℤ)))) (fact5 : Cfloat.is_float32 (t_1 (Memory.shift a (1 : ℤ)))) (fact6 : Cfloat.is_float32 (t_1 (Memory.shift a (2 : ℤ)))) : Cfloat.is_finite32 r
  := sorry
end float_rmat_of_axis_angle_Why3_ide_VCfloat_rmat_of_axis_angle_call_cosf_pre_finite_arg_goal0

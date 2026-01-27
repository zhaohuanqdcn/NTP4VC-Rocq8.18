import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.airborne.float_rmat_integrate_fi.lib.lean.Axiomatic15.Axiomatic15
import Why3.Cmath.Cmath
import Why3.Cfloat.Cfloat
import frama_c.airborne.float_rmat_integrate_fi.lib.lean.Compound.Compound
import frama_c.airborne.float_rmat_integrate_fi.lib.lean.S5_FloatRMat.S5_FloatRMat
open Classical
open Lean4Why3
namespace float_rmat_integrate_fi_Why3_ide_VCfloat_rmat_integrate_fi_call_float_rmat_comp_pre_2_goal0
theorem goal0 (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℝ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact2 : Memory.linked t) (fact3 : Memory.valid_rw t a (9 : ℤ)) (fact4 : Axiomatic15.p_rvalid_floatrates t t_1 a_1) (fact5 : Cfloat.is_float32 (t_1 (Memory.shift a_1 (0 : ℤ)))) (fact6 : Cfloat.is_float32 (t_1 (Memory.shift a_1 (1 : ℤ)))) (fact7 : Cfloat.is_float32 (t_1 (Memory.shift a_1 (2 : ℤ)))) : Axiomatic15.p_rvalid_floatrmat t t_1 a
  := sorry
end float_rmat_integrate_fi_Why3_ide_VCfloat_rmat_integrate_fi_call_float_rmat_comp_pre_2_goal0

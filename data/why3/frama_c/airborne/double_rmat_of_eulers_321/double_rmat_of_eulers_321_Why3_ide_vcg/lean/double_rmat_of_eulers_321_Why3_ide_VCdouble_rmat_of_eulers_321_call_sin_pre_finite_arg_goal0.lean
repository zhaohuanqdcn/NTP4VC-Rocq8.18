import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.airborne.double_rmat_of_eulers_321.lib.lean.Axiomatic19.Axiomatic19
import Why3.Cmath.Cmath
import Why3.Cfloat.Cfloat
import frama_c.airborne.double_rmat_of_eulers_321.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace double_rmat_of_eulers_321_Why3_ide_VCdouble_rmat_of_eulers_321_call_sin_pre_finite_arg_goal0
theorem goal0 (t_1 : Memory.addr -> ℝ) (a : Memory.addr) (t : ℤ -> ℤ) : let r : ℝ := t_1 (Memory.shift a (0 : ℤ)); Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Axiomatic19.p_rvalid_doubleeulers t t_1 a → Cfloat.is_float64 r → Cfloat.is_float64 (t_1 (Memory.shift a (2 : ℤ))) → Cfloat.is_float64 (t_1 (Memory.shift a (1 : ℤ))) → Cfloat.is_finite64 r
  := sorry
end double_rmat_of_eulers_321_Why3_ide_VCdouble_rmat_of_eulers_321_call_sin_pre_finite_arg_goal0

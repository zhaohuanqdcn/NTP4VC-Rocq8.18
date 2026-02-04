import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cmath.Cmath
import Why3.Cfloat.Cfloat
import frama_c.airborne.float_rmat_of_eulers_312.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace Axiomatic15
noncomputable def p_finite_floateulers (mflt_0 : Memory.addr -> ℝ) (e : Memory.addr) := Cfloat.is_finite32 (mflt_0 (Memory.shift e (0 : ℤ))) ∧ Cfloat.is_finite32 (mflt_0 (Memory.shift e (2 : ℤ))) ∧ Cfloat.is_finite32 (mflt_0 (Memory.shift e (1 : ℤ)))
noncomputable def p_rvalid_floateulers (malloc_0 : ℤ -> ℤ) (mflt_0 : Memory.addr -> ℝ) (e : Memory.addr) := p_finite_floateulers mflt_0 e ∧ Memory.valid_rd malloc_0 e (3 : ℤ)
end Axiomatic15

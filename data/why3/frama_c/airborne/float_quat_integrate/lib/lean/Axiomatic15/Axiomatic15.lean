import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cmath.Cmath
import Why3.Cfloat.Cfloat
import frama_c.airborne.float_quat_integrate.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace Axiomatic15
noncomputable def p_finite_floatrates (mflt_0 : Memory.addr -> ℝ) (r : Memory.addr) := Cfloat.is_finite32 (mflt_0 (Memory.shift r (0 : ℤ))) ∧ Cfloat.is_finite32 (mflt_0 (Memory.shift r (1 : ℤ))) ∧ Cfloat.is_finite32 (mflt_0 (Memory.shift r (2 : ℤ)))
noncomputable def p_rvalid_floatrates (malloc_0 : ℤ -> ℤ) (mflt_0 : Memory.addr -> ℝ) (r : Memory.addr) := p_finite_floatrates mflt_0 r ∧ Memory.valid_rd malloc_0 r (3 : ℤ)
end Axiomatic15

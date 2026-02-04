import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cmath.Cmath
import Why3.Cfloat.Cfloat
import frama_c.airborne.float_quat_comp_norm_shortest.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace Axiomatic15
noncomputable def p_finite_floatquat (mflt_0 : Memory.addr -> ℝ) (q : Memory.addr) := Cfloat.is_finite32 (mflt_0 (Memory.shift q (0 : ℤ))) ∧ Cfloat.is_finite32 (mflt_0 (Memory.shift q (1 : ℤ))) ∧ Cfloat.is_finite32 (mflt_0 (Memory.shift q (2 : ℤ))) ∧ Cfloat.is_finite32 (mflt_0 (Memory.shift q (3 : ℤ)))
noncomputable def p_rvalid_floatquat (malloc_0 : ℤ -> ℤ) (mflt_0 : Memory.addr -> ℝ) (q : Memory.addr) := p_finite_floatquat mflt_0 q ∧ Memory.valid_rd malloc_0 q (4 : ℤ)
end Axiomatic15

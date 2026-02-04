import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.airborne.float_rmat_vmult.lib.lean.S9_RealVect3_s.S9_RealVect3_s
import frama_c.airborne.float_rmat_vmult.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace Axiomatic16
noncomputable def l_l_vect_of_floatvect3 (mflt_0 : Memory.addr -> ℝ) (v : Memory.addr) := S9_RealVect3_s.s9_realvect3_s.mk (mflt_0 (Memory.shift v (0 : ℤ))) (mflt_0 (Memory.shift v (1 : ℤ))) (mflt_0 (Memory.shift v (2 : ℤ)))
end Axiomatic16

import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.airborne.float_quat_of_rmat.lib.lean.S11_RealQuat_s.S11_RealQuat_s
import frama_c.airborne.float_quat_of_rmat.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace Axiomatic18
noncomputable def l_l_quat_of_floatquat (mflt_0 : Memory.addr -> ℝ) (q : Memory.addr) := S11_RealQuat_s.s11_realquat_s.mk (mflt_0 (Memory.shift q (0 : ℤ))) (mflt_0 (Memory.shift q (1 : ℤ))) (mflt_0 (Memory.shift q (2 : ℤ))) (mflt_0 (Memory.shift q (3 : ℤ)))
end Axiomatic18

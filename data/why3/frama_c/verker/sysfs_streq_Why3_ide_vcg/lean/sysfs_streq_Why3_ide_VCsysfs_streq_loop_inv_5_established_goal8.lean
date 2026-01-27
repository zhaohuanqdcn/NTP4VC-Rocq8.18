import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import frama_c.verker.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace sysfs_streq_Why3_ide_VCsysfs_streq_loop_inv_5_established_goal8
theorem goal8 (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact2 : Memory.linked t) (fact3 : Memory.sconst t_1) (fact4 : A_Strlen.p_valid_str t t_1 a) (fact5 : A_Strlen.p_valid_str t t_1 a_1) : (0 : ℤ) ≤ A_Strlen.l_strlen t_1 a_1
  := sorry
end sysfs_streq_Why3_ide_VCsysfs_streq_loop_inv_5_established_goal8

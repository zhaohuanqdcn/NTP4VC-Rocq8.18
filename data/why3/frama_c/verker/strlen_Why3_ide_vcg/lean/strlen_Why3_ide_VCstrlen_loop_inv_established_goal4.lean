import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import frama_c.verker.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace strlen_Why3_ide_VCstrlen_loop_inv_established_goal4
theorem goal4 (a : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.linked t) (fact2 : Memory.sconst t_1) (fact3 : A_Strlen.p_valid_str t t_1 a) : Memory.addr_le a a ∧ Memory.addr_le a (Memory.shift a (A_Strlen.l_strlen t_1 a))
  := sorry
end strlen_Why3_ide_VCstrlen_loop_inv_established_goal4

import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace check_bytes8_Why3_ide_VCcheck_bytes8_loop_inv_4_established_goal7
theorem goal7 (a : Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (i_1 : ℤ) (a_1 : Memory.addr) (t_1 : Memory.addr -> ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.linked t) (fact2 : Cint.is_uint8 i) (fact3 : Cint.is_uint32 i_1) (fact4 : Memory.addr_lt a_1 a) (fact5 : Memory.addr_le a a_1) (fact6 : Memory.valid_rd t (Memory.shift a (0 : ℤ)) i_1) : t_1 a_1 = i
  := sorry
end check_bytes8_Why3_ide_VCcheck_bytes8_loop_inv_4_established_goal7

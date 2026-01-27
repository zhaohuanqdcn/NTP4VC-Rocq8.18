import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace memset_Why3_ide_VCmemset_loop_inv_4_established_goal7
theorem goal7 (a : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (i_1 : ℤ) (i : ℤ) (a_1 : Memory.addr) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.linked t) (fact2 : Memory.sconst t_1) (fact3 : Cint.is_sint32 i_1) (fact4 : Cint.is_uint64 i) (fact5 : Memory.addr_lt a_1 a) (fact6 : Memory.addr_le a a_1) (fact7 : Memory.valid_rw t (Memory.shift a (0 : ℤ)) i) : t_1 a_1 = Cint.to_sint8 i_1
  := sorry
end memset_Why3_ide_VCmemset_loop_inv_4_established_goal7

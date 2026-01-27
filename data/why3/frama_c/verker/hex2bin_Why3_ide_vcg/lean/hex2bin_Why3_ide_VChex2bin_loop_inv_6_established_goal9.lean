import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.Compound.Compound
import frama_c.verker.lib.lean.A_Ctype.A_Ctype
open Classical
open Lean4Why3
namespace hex2bin_Why3_ide_VChex2bin_loop_inv_6_established_goal9
theorem goal9 (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (i : ℤ) (a_2 : Memory.addr) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact2 : Memory.linked t) (fact3 : Memory.sconst t_1) (fact4 : Cint.is_uint64 i) (fact5 : Memory.addr_lt a_2 a) (fact6 : Memory.addr_le a a_2) (fact7 : Memory.valid_rw t (Memory.shift a_1 (0 : ℤ)) ((1 : ℤ) + i)) (fact8 : Memory.valid_rd t (Memory.shift a (0 : ℤ)) ((1 : ℤ) + (2 : ℤ) * i)) : A_Ctype.p_isxdigit (t_1 a_2)
  := sorry
end hex2bin_Why3_ide_VChex2bin_loop_inv_6_established_goal9

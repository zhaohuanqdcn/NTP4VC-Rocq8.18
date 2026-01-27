import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.iota.lib.lean.Compound.Compound
import frama_c.standard_algorithms.iota.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace iota_Why3_ide_VCiota_loop_inv_increment_established_goal4
theorem goal4 (a : Memory.addr) (i : ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : i + i_1 ≤ (2147483647 : ℤ)) (fact2 : Memory.linked t) (fact3 : Cint.is_uint32 i_1) (fact4 : Cint.is_sint32 i) (fact5 : Memory.valid_rw t (Memory.shift a (0 : ℤ)) i_1) : Axiomatic.p_iota t_1 a (0 : ℤ) i
  := sorry
end iota_Why3_ide_VCiota_loop_inv_increment_established_goal4

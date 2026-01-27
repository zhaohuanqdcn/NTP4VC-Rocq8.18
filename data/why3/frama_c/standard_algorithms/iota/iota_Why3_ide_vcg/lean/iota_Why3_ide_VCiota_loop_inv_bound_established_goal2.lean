import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.iota.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace iota_Why3_ide_VCiota_loop_inv_bound_established_goal2
theorem goal2 (a : Memory.addr) (i : ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : i + i_1 ≤ (2147483647 : ℤ)) (fact2 : Memory.linked t) (fact3 : Cint.is_uint32 i_1) (fact4 : Cint.is_sint32 i) (fact5 : Memory.valid_rw t (Memory.shift a (0 : ℤ)) i_1) : (0 : ℤ) ≤ i_1
  := sorry
end iota_Why3_ide_VCiota_loop_inv_bound_established_goal2

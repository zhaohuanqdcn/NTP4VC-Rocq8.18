import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.adjacent_find.lib.lean.Compound.Compound
import frama_c.standard_algorithms.adjacent_find.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace adjacent_find_Why3_ide_VCadjacent_find_loop_inv_none_established_goal4
theorem goal4 (a : Memory.addr) (i : ℤ) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : (2 : ℤ) ≤ i) (fact2 : Memory.linked t) (fact3 : Cint.is_uint32 i) (fact4 : Memory.valid_rd t (Memory.shift a (0 : ℤ)) i) : ¬Axiomatic.p_hasequalneighbors t_1 a (1 : ℤ)
  := sorry
end adjacent_find_Why3_ide_VCadjacent_find_loop_inv_none_established_goal4

import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.search.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace search_Why3_ide_VCsearch_loop_inv_bound_established_goal1
theorem goal1 (i : ℤ) (i_1 : ℤ) (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) (fact0 : i ≤ i_1) (fact1 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact2 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact3 : Memory.linked t) (fact4 : Cint.is_uint32 i) (fact5 : Cint.is_uint32 i_1) (fact6 : Memory.valid_rd t (Memory.shift a (0 : ℤ)) i) (fact7 : Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i_1) : i ≤ (1 : ℤ) + i_1
  := sorry
end search_Why3_ide_VCsearch_loop_inv_bound_established_goal1

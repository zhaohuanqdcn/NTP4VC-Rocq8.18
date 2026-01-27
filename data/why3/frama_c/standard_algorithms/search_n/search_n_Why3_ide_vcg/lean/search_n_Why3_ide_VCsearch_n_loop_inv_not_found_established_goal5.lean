import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.search_n.lib.lean.Compound.Compound
import frama_c.standard_algorithms.search_n.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace search_n_Why3_ide_VCsearch_n_loop_inv_not_found_established_goal5
theorem goal5 (i : ℤ) (i_1 : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) (i_2 : ℤ) (t_1 : Memory.addr -> ℤ) (fact0 : (0 : ℤ) < i) (fact1 : i ≤ i_1) (fact2 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact3 : Memory.linked t) (fact4 : Cint.is_uint32 i) (fact5 : Cint.is_uint32 i_1) (fact6 : Cint.is_sint32 i_2) (fact7 : Memory.valid_rd t (Memory.shift a (0 : ℤ)) i_1) : ¬Axiomatic.p_hasconstantsubrange t_1 a (0 : ℤ) i i_2
  := sorry
end search_n_Why3_ide_VCsearch_n_loop_inv_not_found_established_goal5

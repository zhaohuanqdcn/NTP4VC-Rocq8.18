import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.partial_sort.lib.lean.Compound.Compound
import frama_c.standard_algorithms.partial_sort.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace partial_sort_Why3_ide_VCpartial_sort_post_sorted_goal0
theorem goal0 (i_1 : ℤ) (i : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (fact0 : i_1 ≤ (0 : ℤ)) (fact1 : i_1 ≤ i) (fact2 : (0 : ℤ) ≤ i_1) (fact3 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact4 : Memory.linked t) (fact5 : Cint.is_uint32 i) (fact6 : Cint.is_uint32 i_1) (fact7 : Memory.valid_rw t (Memory.shift a (0 : ℤ)) i) : Axiomatic.p_sorted_1' t_1 a (0 : ℤ) (0 : ℤ)
  := sorry
end partial_sort_Why3_ide_VCpartial_sort_post_sorted_goal0

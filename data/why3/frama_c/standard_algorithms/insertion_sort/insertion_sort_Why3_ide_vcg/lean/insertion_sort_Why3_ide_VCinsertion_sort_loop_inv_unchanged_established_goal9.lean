import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.insertion_sort.lib.lean.Compound.Compound
import frama_c.standard_algorithms.insertion_sort.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace insertion_sort_Why3_ide_VCinsertion_sort_loop_inv_unchanged_established_goal9
theorem goal9 (a : Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (t_1 : Memory.addr -> ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.linked t) (fact2 : Cint.is_uint32 i) (fact3 : Memory.valid_rw t (Memory.shift a (0 : ℤ)) i) : Axiomatic.p_unchanged_1' t_1 t_1 a (0 : ℤ) i
  := sorry
end insertion_sort_Why3_ide_VCinsertion_sort_loop_inv_unchanged_established_goal9

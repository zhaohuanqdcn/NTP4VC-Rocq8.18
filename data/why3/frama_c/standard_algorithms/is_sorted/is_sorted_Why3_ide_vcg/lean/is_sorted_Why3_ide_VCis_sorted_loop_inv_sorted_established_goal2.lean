import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.is_sorted.lib.lean.Compound.Compound
import frama_c.standard_algorithms.is_sorted.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace is_sorted_Why3_ide_VCis_sorted_loop_inv_sorted_established_goal2
theorem goal2 (i : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (fact0 : (0 : ℤ) < i) (fact1 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact2 : Memory.linked t) (fact3 : Cint.is_uint32 i) (fact4 : Memory.valid_rd t (Memory.shift a (0 : ℤ)) i) : Axiomatic.p_weaklysorted_1' t_1 a (0 : ℤ) (1 : ℤ)
  := sorry
end is_sorted_Why3_ide_VCis_sorted_loop_inv_sorted_established_goal2

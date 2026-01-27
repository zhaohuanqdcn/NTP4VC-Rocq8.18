import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.Globals.Globals
import Why3.Cint.Cint
import frama_c.verker.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace bsearch_Why3_ide_VCbsearch_assign_normal_part2_goal3
theorem goal3 (i : ℤ) (i_2 : ℤ) (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) (i_1 : ℤ) (fact0 : i < i_2) (fact1 : Memory.region (2605 : ℤ) ≤ (0 : ℤ)) (fact2 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact3 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact4 : Memory.linked t) (fact5 : Cint.is_uint64 i) (fact6 : Cint.is_uint64 i_1) (fact7 : Cint.is_uint64 i_2) (fact8 : Memory.valid_rd t (Memory.shift a (0 : ℤ)) (2 : ℤ)) : ¬Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) ((1 : ℤ) + i_1)
  := sorry
end bsearch_Why3_ide_VCbsearch_assign_normal_part2_goal3

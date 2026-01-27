import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.Globals.Globals
import Why3.Cint.Cint
import frama_c.verker.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace bsearch_Why3_ide_VCbsearch_assign_exit_part1_goal0
theorem goal0 (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (fact0 : Memory.region (2605 : ℤ) ≤ (0 : ℤ)) (fact1 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact2 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact3 : Memory.linked t) (fact4 : Cint.is_uint64 i) (fact5 : Memory.valid_rd t (Memory.shift a (0 : ℤ)) (2 : ℤ)) : ¬Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) ((1 : ℤ) + i)
  := sorry
end bsearch_Why3_ide_VCbsearch_assign_exit_part1_goal0

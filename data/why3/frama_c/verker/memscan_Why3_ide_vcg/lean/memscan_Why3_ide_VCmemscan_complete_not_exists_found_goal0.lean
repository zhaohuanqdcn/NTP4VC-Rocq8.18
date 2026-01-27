import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace memscan_Why3_ide_VCmemscan_complete_not_exists_found_goal0
theorem goal0 (a_4 : Memory.addr) (t : ℤ -> ℤ) (i_1 : ℤ) (i : ℤ) (a : Memory.addr) (a_1 : Memory.addr) (t_1 : Memory.addr -> ℤ) (a_2 : Memory.addr) (a_3 : Memory.addr) (fact0 : Memory.region (Memory.addr.base a_4) ≤ (0 : ℤ)) (fact1 : Memory.linked t) (fact2 : Cint.is_sint32 i_1) (fact3 : Cint.is_uint64 i) (fact4 : Memory.valid_rd t (Memory.shift a (0 : ℤ)) i) (fact5 : Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i) : (∀(i_2 : ℤ), (0 : ℤ) ≤ i_2 → i_2 < i → ¬t_1 (Memory.shift a_2 i_2) = i_1) ∨ (∃(i_2 : ℤ), t_1 (Memory.shift a_3 i_2) = i_1 ∧ (0 : ℤ) ≤ i_2 ∧ i_2 < i)
  := sorry
end memscan_Why3_ide_VCmemscan_complete_not_exists_found_goal0

import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace memmove_Why3_ide_VCmemmove_loop_inv_9_established_goal14
theorem goal14 (a_1 : Memory.addr) (i : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) : let a_2 : Memory.addr := Memory.shift a_1 i; Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_uint64 i → ¬Memory.addr_le a_1 a → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i → Memory.valid_rw t (Memory.shift a_1 (0 : ℤ)) i → Memory.addr_le a_1 a_2 ∧ Memory.addr_le a_2 a_2
  := sorry
end memmove_Why3_ide_VCmemmove_loop_inv_9_established_goal14

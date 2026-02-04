import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.contiki_memb.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace Axiomatic12
noncomputable def p_empty_block (malloc_0 : ℤ -> ℤ) (s : Memory.addr) := malloc_0 (Memory.addr.base s) = (0 : ℤ) ∧ Memory.base_offset (Memory.addr.offset s) = (0 : ℤ)
noncomputable def p_valid_or_empty (malloc_0 : ℤ -> ℤ) (s : Memory.addr) (n : ℤ) := Memory.valid_rw malloc_0 (Memory.shift s (0 : ℤ)) n ∧ (p_empty_block malloc_0 s ∨ Memory.valid_rd malloc_0 s (1 : ℤ))
end Axiomatic12

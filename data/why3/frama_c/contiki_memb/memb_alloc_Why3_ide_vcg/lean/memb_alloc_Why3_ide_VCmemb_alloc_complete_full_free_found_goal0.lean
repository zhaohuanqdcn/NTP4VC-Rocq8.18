import Why3.Base
import Why3.Qed.Qed
import frama_c.contiki_memb.lib.lean.Axiomatic13.Axiomatic13
import Why3.Memory.Memory
import frama_c.contiki_memb.lib.lean.Compound.Compound
import frama_c.contiki_memb.lib.lean.A_OccArray.A_OccArray
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace memb_alloc_Why3_ide_VCmemb_alloc_complete_full_free_found_goal0
theorem goal0 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (t_3 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (t_2 : Memory.addr -> ℤ) : let x : ℤ := t_1 (Memory.shift a (1 : ℤ)); Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.framed t_3 → Memory.linked t → Memory.sconst t_2 → Cint.is_uint16 x → Axiomatic13.p_valid_memb t t_3 t_1 a → Axiomatic13.p__memb_full t_3 t_2 t_1 a ∨ (∃(i : ℤ), t_2 (Memory.shift (t_3 (Memory.shift a (2 : ℤ))) i) = (0 : ℤ) ∧ (0 : ℤ) ≤ i ∧ i < x)
  := sorry
end memb_alloc_Why3_ide_VCmemb_alloc_complete_full_free_found_goal0

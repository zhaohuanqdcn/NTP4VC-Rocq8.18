import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace memchr_inv_Why3_ide_VCmemchr_inv_call_check_bytes8_0_pre_3_goal2
theorem goal2 (t_2 : Memory.addr -> ℤ) (a : Memory.addr) (i : ℤ) (i_1 : ℤ) (a_2 : Memory.addr) (i_2 : ℤ) (t : ℤ -> ℤ) (t_1 : ℤ -> ℤ) (a_1 : Memory.addr) : let x : ℤ := t_2 a; ¬i = (0 : ℤ) → ¬x = i_1 → Cint.to_uint32 (Int.tmod (Memory.int_of_addr a_2) (8 : ℤ)) = (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → (17 : ℤ) ≤ i_2 → Memory.linked t → Cint.is_uint32 i → Cint.is_uint64 i_1 → Cint.is_uint64 i_2 → Cint.is_uint64 x → Memory.valid_rw t (Memory.shift a_2 (0 : ℤ)) i_2 → Memory.valid_rd t_1 (Memory.shift a_1 (0 : ℤ)) (8 : ℤ)
  := sorry
end memchr_inv_Why3_ide_VCmemchr_inv_call_check_bytes8_0_pre_3_goal2

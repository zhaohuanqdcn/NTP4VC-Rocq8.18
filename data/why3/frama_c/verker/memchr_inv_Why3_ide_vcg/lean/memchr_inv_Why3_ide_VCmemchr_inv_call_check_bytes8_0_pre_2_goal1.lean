import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace memchr_inv_Why3_ide_VCmemchr_inv_call_check_bytes8_0_pre_2_goal1
theorem goal1 (a_1 : Memory.addr) (i : ℤ) (t : ℤ -> ℤ) (a : Memory.addr) : let x : ℤ := Cint.to_uint32 (Int.tmod (Memory.int_of_addr a_1) (8 : ℤ)); ¬x = (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → (17 : ℤ) ≤ i → Memory.linked t → Cint.is_uint64 i → Memory.valid_rw t (Memory.shift a_1 (0 : ℤ)) i → Memory.valid_rd t (Memory.shift a (0 : ℤ)) (Cint.to_uint32 ((8 : ℤ) - x))
  := sorry
end memchr_inv_Why3_ide_VCmemchr_inv_call_check_bytes8_0_pre_2_goal1

import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace memcmp_Why3_ide_VCmemcmp_loop_inv_C2_RANGE_established_goal5
theorem goal5 (a_1 : Memory.addr) (a_2 : Memory.addr) (i : ℤ) (t : ℤ -> ℤ) (a : Memory.addr) (a_3 : Memory.addr) : let a_4 : Memory.addr := Memory.shift a_1 (0 : ℤ); let a_5 : Memory.addr := Memory.shift a_2 (0 : ℤ); (0 : ℤ) ≤ i → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Memory.valid_rw t a_4 i → Memory.valid_rw t a_5 i → Memory.separated a_5 i a_4 i → Memory.shift a (0 : ℤ) = a_3
  := sorry
end memcmp_Why3_ide_VCmemcmp_loop_inv_C2_RANGE_established_goal5

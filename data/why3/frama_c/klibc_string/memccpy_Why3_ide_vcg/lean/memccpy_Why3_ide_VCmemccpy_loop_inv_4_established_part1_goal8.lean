import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace memccpy_Why3_ide_VCmemccpy_loop_inv_4_established_part1_goal8
theorem goal8 (a : Memory.addr) (a_1 : Memory.addr) (i : ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) : let a_2 : Memory.addr := Memory.shift a (0 : ℤ); let a_3 : Memory.addr := Memory.shift a_1 (0 : ℤ); (0 : ℤ) < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → -(128 : ℤ) ≤ i_1 → i_1 ≤ (127 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_uint32 i → Cint.is_sint32 i_1 → Memory.valid_rw t a_2 i → Memory.valid_rw t a_3 i → Memory.separated a_2 i a_3 i → Memory.addr_le a a
  := sorry
end memccpy_Why3_ide_VCmemccpy_loop_inv_4_established_part1_goal8

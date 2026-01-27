import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace memcpy_Why3_ide_VCmemcpy_assign_part4_goal15
theorem goal15 (a : Memory.addr) (a_1 : Memory.addr) (i : ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) : let a_2 : Memory.addr := Memory.shift a (0 : ℤ); let a_3 : Memory.addr := Memory.shift a_1 (0 : ℤ); i < i_1 → (0 : ℤ) ≤ i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_uint32 i → Cint.is_uint32 i_1 → Memory.valid_rw t a_2 i_1 → Memory.valid_rw t a_3 i_1 → ¬Memory.invalid t a_3 (i_1 - i) → Memory.separated a_2 i_1 a_3 i_1 → (0 : ℤ) ≤ i
  := sorry
end memcpy_Why3_ide_VCmemcpy_assign_part4_goal15

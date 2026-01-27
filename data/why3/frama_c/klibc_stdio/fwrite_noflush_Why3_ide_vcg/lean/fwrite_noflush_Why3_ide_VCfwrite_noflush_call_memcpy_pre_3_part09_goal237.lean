import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_stdio.lib.lean.Axiomatic3.Axiomatic3
open Classical
open Lean4Why3
namespace fwrite_noflush_Why3_ide_VCfwrite_noflush_call_memcpy_pre_3_part09_goal237
theorem goal237 (a_2 : Memory.addr) (t_1 : Memory.addr -> ℤ) (a_1 : Memory.addr) (i_2 : ℤ) (a : Memory.addr) (i_1 : ℤ) (i_4 : ℤ) (i : ℤ) (t_3 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (t_2 : Memory.addr -> ℤ) (i_3 : ℤ) : let x : ℤ := Memory.addr.base a_2; let x_1 : ℤ := t_1 (Memory.shift a_1 (9 : ℤ)); ¬i_2 = (0 : ℤ) → x = Memory.addr.base a → t_1 (Memory.shift a_1 (7 : ℤ)) = (0 : ℤ) → (0 : ℤ) ≤ i_1 → (0 : ℤ) ≤ i_2 → i_1 ≤ i_2 → (0 : ℤ) ≤ i_4 → i_2 ≤ i_4 → (0 : ℤ) < x_1 → i_2 < x_1 → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → -(1 : ℤ) ≤ i → Memory.framed t_3 → Memory.linked t → Memory.sconst t_2 → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_uint32 i_4 → Cint.is_sint32 i → Cint.is_sint32 i_3 → Memory.addr_le a_2 a → Cint.is_uint32 x_1 → Axiomatic3.p_valid_io_file_pvt t t_3 t_1 a_1 → Memory.addr_le a (Memory.shift a_2 i_4) → Memory.valid_rw t (Memory.shift a_2 (0 : ℤ)) i_4 → (i = -(1 : ℤ) → i_3 = (4 : ℤ) ∨ i_3 = (11 : ℤ)) → Memory.valid_rw t (Memory.shift (t_3 (Memory.shift a_1 (5 : ℤ))) (0 : ℤ)) i_2
  := sorry
end fwrite_noflush_Why3_ide_VCfwrite_noflush_call_memcpy_pre_3_part09_goal237

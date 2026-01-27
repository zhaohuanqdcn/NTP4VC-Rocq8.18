import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_stdio.lib.lean.Axiomatic3.Axiomatic3
open Classical
open Lean4Why3
namespace fwrite_noflush_Why3_ide_VCfwrite_noflush_loop_inv_5_preserved_part37_goal45
theorem goal45 (a_2 : Memory.addr) (t_1 : Memory.addr -> ℤ) (a_1 : Memory.addr) (a : Memory.addr) (t_4 : Memory.addr -> Memory.addr) (i_3 : ℤ) (t_2 : Memory.addr -> ℤ) (t_3 : Memory.addr -> ℤ) (i_7 : ℤ) (i_5 : ℤ) (i_8 : ℤ) (i : ℤ) (i_4 : ℤ) (t : ℤ -> ℤ) (i_6 : ℤ) (i_1 : ℤ) (i_2 : ℤ) : let x : ℤ := Memory.addr.base a_2; let x_1 : ℤ := t_1 (Memory.shift a_1 (9 : ℤ)); let a_3 : Memory.addr := Memory.shift a (0 : ℤ); let a_4 : Memory.addr := t_4 (Memory.shift a_1 (5 : ℤ)); let a_5 : Memory.addr := Memory.shift a_4 i_3; let a_6 : Memory.addr := Memory.shift a_1 (0 : ℤ); let a_7 : Memory.addr -> ℤ := Memory.havoc t_2 t_3 a_5 i_7; ¬i_3 = (0 : ℤ) → ¬i_7 = (0 : ℤ) → x = Memory.addr.base a → t_1 (Memory.shift a_1 (7 : ℤ)) = (0 : ℤ) → (0 : ℤ) ≤ i_5 → (0 : ℤ) ≤ i_7 → i_5 ≤ i_7 → (0 : ℤ) ≤ i_8 → i_7 ≤ i_8 → x_1 ≤ i → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → i_7 < Cint.to_uint32 (x_1 - i_3) → -(1 : ℤ) ≤ i_4 → Memory.framed t_4 → Memory.linked t → Memory.sconst t_3 → Cint.is_uint32 i → Cint.is_uint32 i_3 → Cint.is_uint32 i_5 → Cint.is_uint32 i_7 → Cint.is_uint32 i_8 → Cint.is_sint32 i_4 → Cint.is_sint32 i_6 → Memory.addr_le a_2 a → Cint.is_uint32 x_1 → Axiomatic3.p_valid_io_file_pvt t t_4 t_1 a_1 → Memory.addr_le a (Memory.shift a_2 i_8) → Memory.valid_rw t a_3 i_7 → Memory.valid_rw t (Memory.shift a_2 (0 : ℤ)) i_8 → Memory.valid_rw t a_5 i_7 → Memory.separated a_3 i_7 a_5 i_7 → Axiomatic3.p_valid_io_file_pvt t t_4 (Function.update (Function.update (Function.update t_1 (Memory.shift a_1 (8 : ℤ)) i) (Memory.shift a_6 (1 : ℤ)) i_1) (Memory.shift a_6 (2 : ℤ)) i_2) a_1 → (i_4 = -(1 : ℤ) → i_6 = (4 : ℤ) ∨ i_6 = (11 : ℤ)) → (∀(i_9 : ℤ), (0 : ℤ) ≤ i_9 → i_9 < i_7 → a_7 (Memory.shift a_4 (i_9 + i_3)) = a_7 (Memory.shift a i_9)) → Memory.addr_le a_2 (Memory.shift a i_7)
  := sorry
end fwrite_noflush_Why3_ide_VCfwrite_noflush_loop_inv_5_preserved_part37_goal45

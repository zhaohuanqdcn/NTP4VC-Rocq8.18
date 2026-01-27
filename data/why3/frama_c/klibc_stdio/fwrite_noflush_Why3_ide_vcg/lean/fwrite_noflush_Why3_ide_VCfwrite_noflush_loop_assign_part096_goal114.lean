import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_stdio.lib.lean.Axiomatic3.Axiomatic3
open Classical
open Lean4Why3
namespace fwrite_noflush_Why3_ide_VCfwrite_noflush_loop_assign_part096_goal114
theorem goal114 (a_3 : Memory.addr) (t_1 : Memory.addr -> ℤ) (a_1 : Memory.addr) (i : ℤ) (a : Memory.addr) (t_4 : Memory.addr -> Memory.addr) (t_2 : Memory.addr -> ℤ) (t_3 : Memory.addr -> ℤ) (a_2 : Memory.addr) (i_4 : ℤ) (i_2 : ℤ) (i_5 : ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) (i_3 : ℤ) : let x : ℤ := Memory.addr.base a_3; let x_1 : ℤ := t_1 (Memory.shift a_1 (9 : ℤ)); let x_2 : ℤ := Cint.to_uint32 (x_1 - i); let a_4 : Memory.addr := Memory.shift (Memory.shift a_1 (0 : ℤ)) (1 : ℤ); let a_5 : Memory.addr := Memory.shift a (0 : ℤ); let a_6 : Memory.addr := t_4 (Memory.shift a_1 (5 : ℤ)); let a_7 : Memory.addr := Memory.shift a_6 i; let a_8 : Memory.addr -> ℤ := Memory.havoc t_2 t_3 a_7 x_2; let a_9 : Memory.addr := Memory.shift a_2 (0 : ℤ); ¬i = (0 : ℤ) → ¬i_4 = (0 : ℤ) → x = Memory.addr.base a → t_1 (Memory.shift a_1 (7 : ℤ)) = (0 : ℤ) → ¬x_2 = (0 : ℤ) → (0 : ℤ) ≤ i_2 → (0 : ℤ) ≤ i_4 → i_2 ≤ i_4 → (0 : ℤ) ≤ i_5 → i_4 ≤ i_5 → i < x_1 → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → x_2 ≤ i_4 → -(1 : ℤ) ≤ i_1 → Memory.framed t_4 → Memory.linked t → Memory.sconst t_3 → Cint.is_uint32 i → Cint.is_uint32 i_2 → Cint.is_uint32 i_4 → Cint.is_uint32 i_5 → Cint.is_sint32 i_1 → Cint.is_sint32 i_3 → Memory.addr_le a_3 a → Cint.is_uint32 x_1 → Axiomatic3.p_valid_io_file_pvt t t_4 t_1 a_1 → Memory.addr_le a (Memory.shift a_3 i_5) → Memory.valid_rw t (Memory.shift a_3 (0 : ℤ)) i_5 → ¬Memory.invalid t a_4 (1 : ℤ) → Memory.valid_rw t a_5 x_2 → Memory.valid_rw t a_7 x_2 → Memory.separated a_5 x_2 a_7 x_2 → (i_1 = -(1 : ℤ) → i_3 = (4 : ℤ) ∨ i_3 = (11 : ℤ)) → (∀(i_6 : ℤ), (0 : ℤ) ≤ i_6 → i_6 < x_2 → a_8 (Memory.shift a_6 (i_6 + i)) = a_8 (Memory.shift a i_6)) → a_4 = Memory.shift a_2 (8 : ℤ) ∨ Memory.shift a_9 (1 : ℤ) = a_4 ∨ Memory.shift a_9 (2 : ℤ) = a_4
  := sorry
end fwrite_noflush_Why3_ide_VCfwrite_noflush_loop_assign_part096_goal114

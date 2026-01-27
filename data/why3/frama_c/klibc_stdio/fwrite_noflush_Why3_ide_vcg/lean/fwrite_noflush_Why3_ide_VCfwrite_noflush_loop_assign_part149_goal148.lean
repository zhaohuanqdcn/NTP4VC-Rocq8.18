import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_stdio.lib.lean.Axiomatic3.Axiomatic3
open Classical
open Lean4Why3
namespace fwrite_noflush_Why3_ide_VCfwrite_noflush_loop_assign_part149_goal148
theorem goal148 (a_2 : Memory.addr) (a_1 : Memory.addr) (t_1 : Memory.addr -> ℤ) (i_6 : ℤ) (a : Memory.addr) (i_4 : ℤ) (i_7 : ℤ) (i : ℤ) (i_3 : ℤ) (t_3 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (t_2 : Memory.addr -> ℤ) (i_5 : ℤ) (i_1 : ℤ) (i_2 : ℤ) : let x : ℤ := Memory.addr.base a_2; let a_3 : Memory.addr := Memory.shift a_1 (7 : ℤ); let x_1 : ℤ := t_1 (Memory.shift a_1 (9 : ℤ)); let a_4 : Memory.addr := Memory.shift a_1 (0 : ℤ); let x_2 : ℤ := t_1 (Memory.shift a_4 (0 : ℤ)); ¬i_6 = (0 : ℤ) → x = Memory.addr.base a → t_1 a_3 = (0 : ℤ) → (0 : ℤ) ≤ i_4 → (0 : ℤ) ≤ i_6 → i_4 ≤ i_6 → (0 : ℤ) ≤ i_7 → i_6 ≤ i_7 → x_1 ≤ i → x_1 ≤ i_6 → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → (0 : ℤ) ≤ x_2 → -(1 : ℤ) ≤ i_3 → -(1 : ℤ) ≤ i_6 → Memory.framed t_3 → Memory.linked t → Memory.sconst t_2 → Cint.is_uint32 i → Cint.is_uint32 i_4 → Cint.is_uint32 i_6 → Cint.is_uint32 i_7 → Cint.is_sint32 i_3 → Cint.is_sint32 i_5 → Memory.addr_le a_2 a → Cint.is_uint32 x_1 → Axiomatic3.p_valid_io_file_pvt t t_3 t_1 a_1 → ¬Memory.invalid t a_3 (1 : ℤ) → Memory.addr_le a (Memory.shift a_2 i_7) → Memory.valid_rw t (Memory.shift a (0 : ℤ)) i_6 → Memory.valid_rw t (Memory.shift a_2 (0 : ℤ)) i_7 → Cint.is_sint32 x_2 → Axiomatic3.p_valid_io_file_pvt t t_3 (Function.update (Function.update (Function.update t_1 (Memory.shift a_1 (8 : ℤ)) i) (Memory.shift a_4 (1 : ℤ)) i_1) (Memory.shift a_4 (2 : ℤ)) i_2) a_1 → ¬(i_3 = -(1 : ℤ) → i_5 = (4 : ℤ) ∨ i_5 = (11 : ℤ))
  := sorry
end fwrite_noflush_Why3_ide_VCfwrite_noflush_loop_assign_part149_goal148

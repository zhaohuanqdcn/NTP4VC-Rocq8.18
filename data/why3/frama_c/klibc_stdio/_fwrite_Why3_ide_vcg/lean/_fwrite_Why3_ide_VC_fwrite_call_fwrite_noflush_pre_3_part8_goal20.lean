import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_stdio.lib.lean.Axiomatic3.Axiomatic3
open Classical
open Lean4Why3
namespace _fwrite_Why3_ide_VC_fwrite_call_fwrite_noflush_pre_3_part8_goal20
theorem goal20 (i_7 : ℤ) (i_8 : ℤ) (a_4 : Memory.addr) (a_5 : Memory.addr) (t_1 : Memory.addr -> ℤ) (i : ℤ) (i_1 : ℤ) (i_2 : ℤ) (a_2 : Memory.addr) (a : Memory.addr) (t_2 : Memory.addr -> ℤ) (t_3 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (a_1 : Memory.addr) (a_3 : Memory.addr) (i_3 : ℤ) (i_4 : ℤ) (i_5 : ℤ) (i_6 : ℤ) : let x : ℤ := i_7 + i_8; let a_6 : Memory.addr := Memory.shift a_4 (0 : ℤ); let a_7 : Memory.addr := Memory.shift a_5 (8 : ℤ); let a_8 : Memory.addr := Memory.shift a_5 (0 : ℤ); let a_9 : Memory.addr := Memory.shift a_8 (1 : ℤ); let a_10 : Memory.addr := Memory.shift a_8 (2 : ℤ); let m : Memory.addr -> ℤ := Function.update (Function.update (Function.update t_1 a_7 i) a_9 i_1) a_10 i_2; ¬i_7 = (0 : ℤ) → ¬i_8 = (0 : ℤ) → Memory.shift a_2 (0 : ℤ) = Memory.shift a (0 : ℤ) → t_1 (Memory.shift a_5 (10 : ℤ)) = (1 : ℤ) → t_2 (Memory.shift a_4 (Cint.to_uint32 (i_8 - (1 : ℤ)))) = (10 : ℤ) → (0 : ℤ) ≤ i_7 → (0 : ℤ) ≤ i_8 → (0 : ℤ) ≤ x → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_4) ≤ (0 : ℤ) → Memory.framed t_3 → Memory.linked t → Memory.sconst t_2 → Cint.is_uint32 i_7 → Cint.is_uint32 i_8 → Cint.is_uint32 x → Axiomatic3.p_valid_io_file_pvt t t_3 t_1 a_1 → Axiomatic3.p_valid_io_file_pvt t t_3 t_1 a_3 → Axiomatic3.p_valid_io_file_pvt t t_3 t_1 a_5 → Memory.valid_rw t a_6 i_8 → Memory.valid_rw t a_6 x → Axiomatic3.p_valid_io_file_pvt t t_3 m a_5 → (∀(i_9 : ℤ), i_8 < i_9 → i_9 ≤ x → ¬t_2 (Memory.shift a_4 (i_9 - (1 : ℤ))) = (10 : ℤ)) → Axiomatic3.p_valid_io_file_pvt t t_3 (Function.update (Function.update (Function.update (Function.update m a_7 i_3) a_10 i_4) a_9 i_5) (Memory.shift a_5 (7 : ℤ)) i_6) a_5
  := sorry
end _fwrite_Why3_ide_VC_fwrite_call_fwrite_noflush_pre_3_part8_goal20

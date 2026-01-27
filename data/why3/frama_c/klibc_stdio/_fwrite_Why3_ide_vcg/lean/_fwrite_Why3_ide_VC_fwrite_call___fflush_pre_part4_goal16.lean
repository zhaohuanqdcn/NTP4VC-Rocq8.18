import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_stdio.lib.lean.Axiomatic3.Axiomatic3
open Classical
open Lean4Why3
namespace _fwrite_Why3_ide_VC_fwrite_call___fflush_pre_part4_goal16
theorem goal16 (i_3 : ℤ) (i_4 : ℤ) (a_4 : Memory.addr) (a_5 : Memory.addr) (a_2 : Memory.addr) (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) (i_5 : ℤ) (t_3 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (a_1 : Memory.addr) (a_3 : Memory.addr) (i : ℤ) (i_1 : ℤ) (i_2 : ℤ) : let x : ℤ := i_3 + i_4; let a_6 : Memory.addr := Memory.shift a_4 (0 : ℤ); let a_7 : Memory.addr := Memory.shift a_5 (0 : ℤ); ¬i_4 = (0 : ℤ) → Memory.shift a_2 (0 : ℤ) = Memory.shift a (0 : ℤ) → t_1 (Memory.shift a_5 (10 : ℤ)) = (1 : ℤ) → t_2 (Memory.shift a_4 (Cint.to_uint32 (i_4 - (1 : ℤ)))) = (10 : ℤ) → (0 : ℤ) ≤ i_3 → (0 : ℤ) ≤ i_4 → (0 : ℤ) ≤ i_5 → (0 : ℤ) ≤ x → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_4) ≤ (0 : ℤ) → Memory.framed t_3 → Memory.linked t → Memory.sconst t_2 → Cint.is_uint32 i_3 → Cint.is_uint32 i_4 → Cint.is_uint32 i_5 → Cint.is_uint32 x → Axiomatic3.p_valid_io_file_pvt t t_3 t_1 a_1 → Axiomatic3.p_valid_io_file_pvt t t_3 t_1 a_3 → Axiomatic3.p_valid_io_file_pvt t t_3 t_1 a_5 → Memory.valid_rw t a_6 i_4 → Memory.valid_rw t a_6 x → (∀(i_6 : ℤ), i_4 < i_6 → i_6 ≤ x → ¬t_2 (Memory.shift a_4 (i_6 - (1 : ℤ))) = (10 : ℤ)) → Axiomatic3.p_valid_io_file_pvt t t_3 (Function.update (Function.update (Function.update t_1 (Memory.shift a_5 (8 : ℤ)) i) (Memory.shift a_7 (1 : ℤ)) i_1) (Memory.shift a_7 (2 : ℤ)) i_2) a_5
  := sorry
end _fwrite_Why3_ide_VC_fwrite_call___fflush_pre_part4_goal16

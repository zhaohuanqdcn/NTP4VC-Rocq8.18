import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_stdio.lib.lean.Axiomatic3.Axiomatic3
open Classical
open Lean4Why3
namespace fseek_Why3_ide_VCfseek_call___fflush_pre_goal20
theorem goal20 (t_1 : Memory.addr -> ℤ) (a_4 : Memory.addr) (a_2 : Memory.addr) (a : Memory.addr) (i : ℤ) (t_2 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (i_1 : ℤ) (a_1 : Memory.addr) (a_3 : Memory.addr) : let x : ℤ := t_1 (Memory.shift a_4 (8 : ℤ)); Memory.shift a_2 (0 : ℤ) = Memory.shift a (0 : ℤ) → ¬x = (0 : ℤ) → (0 : ℤ) ≤ i → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.framed t_2 → Memory.linked t → Cint.is_sint32 i_1 → Cint.is_sint64 i → Cint.is_uint32 x → Axiomatic3.p_valid_io_file_pvt t t_2 t_1 a_1 → Axiomatic3.p_valid_io_file_pvt t t_2 t_1 a_3 → i_1 = (0 : ℤ) ∨ i_1 = (1 : ℤ) ∨ i_1 = (2 : ℤ) → Axiomatic3.p_valid_io_file_pvt t t_2 t_1 a_4
  := sorry
end fseek_Why3_ide_VCfseek_call___fflush_pre_goal20

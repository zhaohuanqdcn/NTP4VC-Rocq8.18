import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_stdio.lib.lean.Axiomatic3.Axiomatic3
open Classical
open Lean4Why3
namespace fseek_Why3_ide_VCfseek_assign_normal_part26_goal16
theorem goal16 (a_2 : Memory.addr) (t_1 : Memory.addr -> ℤ) (a_8 : Memory.addr) (a : Memory.addr) (i : ℤ) (t_2 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (a_1 : Memory.addr) (a_3 : Memory.addr) (a_7 : Memory.addr) (a_4 : Memory.addr) (a_6 : Memory.addr) (a_5 : Memory.addr) : let a_9 : Memory.addr := Memory.shift a_2 (0 : ℤ); let x : ℤ := t_1 (Memory.shift a_8 (8 : ℤ)); let a_10 : Memory.addr := Memory.shift a_8 (0 : ℤ); let x_1 : ℤ := t_1 (Memory.shift a_10 (0 : ℤ)); let a_11 : Memory.addr := Memory.shift a_10 (2 : ℤ); a_9 = Memory.shift a (0 : ℤ) → ¬x = (0 : ℤ) → (0 : ℤ) ≤ i → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → (0 : ℤ) ≤ x_1 → Memory.framed t_2 → Memory.linked t → Cint.is_sint64 i → Cint.is_uint32 x → Axiomatic3.p_valid_io_file_pvt t t_2 t_1 a_1 → Axiomatic3.p_valid_io_file_pvt t t_2 t_1 a_3 → Axiomatic3.p_valid_io_file_pvt t t_2 t_1 a_8 → Cint.is_sint32 x_1 → ¬Memory.invalid t a_11 (1 : ℤ) → a_11 = Memory.shift a_7 (7 : ℤ) ∨ a_11 = Memory.shift a_4 (8 : ℤ) ∨ a_11 = Memory.shift a_9 (1 : ℤ) ∨ a_11 = Memory.shift (Memory.shift a_6 (0 : ℤ)) (1 : ℤ) ∨ a_11 = Memory.shift a_9 (2 : ℤ) ∨ a_11 = Memory.shift (Memory.shift a_5 (0 : ℤ)) (2 : ℤ)
  := sorry
end fseek_Why3_ide_VCfseek_assign_normal_part26_goal16

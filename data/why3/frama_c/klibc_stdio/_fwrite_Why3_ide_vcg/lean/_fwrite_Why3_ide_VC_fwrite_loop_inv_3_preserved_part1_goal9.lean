import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_stdio.lib.lean.Axiomatic3.Axiomatic3
open Classical
open Lean4Why3
namespace _fwrite_Why3_ide_VC_fwrite_loop_inv_3_preserved_part1_goal9
theorem goal9 (t_2 : Memory.addr -> ℤ) (a_4 : Memory.addr) (i_1 : ℤ) (i : ℤ) (a_2 : Memory.addr) (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (a_5 : Memory.addr) (t_3 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (a_1 : Memory.addr) (a_3 : Memory.addr) : let x : ℤ := t_2 (Memory.shift a_4 (Cint.to_uint32 (i_1 - (1 : ℤ)))); let x_1 : ℤ := i + i_1; ¬i_1 = (0 : ℤ) → Memory.shift a_2 (0 : ℤ) = Memory.shift a (0 : ℤ) → t_1 (Memory.shift a_5 (10 : ℤ)) = (1 : ℤ) → ¬x = (10 : ℤ) → (0 : ℤ) ≤ i → (0 : ℤ) ≤ i_1 → (0 : ℤ) ≤ x_1 → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_4) ≤ (0 : ℤ) → Memory.framed t_3 → Memory.linked t → Memory.sconst t_2 → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 x_1 → Axiomatic3.p_valid_io_file_pvt t t_3 t_1 a_1 → Axiomatic3.p_valid_io_file_pvt t t_3 t_1 a_3 → Memory.valid_rw t (Memory.shift a_4 (0 : ℤ)) x_1 → Cint.is_sint8 x → (∀(i_2 : ℤ), i_1 < i_2 → i_2 ≤ x_1 → ¬t_2 (Memory.shift a_4 (i_2 - (1 : ℤ))) = (10 : ℤ)) → Cint.to_uint32 ((1 : ℤ) + i) ≤ x_1
  := sorry
end _fwrite_Why3_ide_VC_fwrite_loop_inv_3_preserved_part1_goal9

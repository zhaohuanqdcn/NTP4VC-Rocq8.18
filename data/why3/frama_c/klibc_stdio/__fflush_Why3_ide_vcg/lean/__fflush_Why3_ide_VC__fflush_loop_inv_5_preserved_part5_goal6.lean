import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_stdio.lib.lean.Axiomatic3.Axiomatic3
open Classical
open Lean4Why3
namespace __fflush_Why3_ide_VC__fflush_loop_inv_5_preserved_part5_goal6
theorem goal6 (t_2 : Memory.addr -> Memory.addr) (a_1 : Memory.addr) (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (i : ℤ) (i_2 : ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) : let a_2 : Memory.addr := t_2 (Memory.shift a_1 (5 : ℤ)); let x : ℤ := Memory.addr.base a_2; let x_1 : ℤ := Memory.addr.base a; let x_2 : ℤ := Memory.addr.base (t_2 (Memory.shift a_1 (6 : ℤ))); let x_3 : ℤ := t_1 (Memory.shift (Memory.shift a_1 (0 : ℤ)) (0 : ℤ)); let x_4 : ℤ := t_1 (Memory.shift a_1 (9 : ℤ)); ¬i = (0 : ℤ) → ¬i_2 = -(1 : ℤ) → ¬i_2 = (0 : ℤ) → t_1 (Memory.shift a_1 (7 : ℤ)) = (0 : ℤ) → x = x_1 → x_2 = x_1 → x_2 = x → (0 : ℤ) ≤ i → i_1 ≤ i → i_2 ≤ i → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → (0 : ℤ) ≤ x_3 → -(1 : ℤ) ≤ i_1 → -(1 : ℤ) ≤ i_2 → Memory.framed t_2 → Memory.linked t → Cint.is_uint32 i → Cint.is_sint32 i_1 → Cint.is_sint32 i_2 → Cint.is_uint32 x_4 → Cint.is_uint32 (t_1 (Memory.shift a_1 (8 : ℤ))) → Axiomatic3.p_valid_io_file_pvt t t_2 t_1 a_1 → Memory.addr_le a_2 a → Memory.valid_rw t (Memory.shift a (0 : ℤ)) i → Cint.is_sint32 x_3 → Memory.addr_le a (Memory.shift a_2 ((32 : ℤ) + x_4)) → Memory.addr_le a_2 (Memory.shift a i_2)
  := sorry
end __fflush_Why3_ide_VC__fflush_loop_inv_5_preserved_part5_goal6

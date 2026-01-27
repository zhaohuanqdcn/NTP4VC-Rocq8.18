import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import frama_c.klibc_stdio.lib.lean.Axiomatic3.Axiomatic3
open Classical
open Lean4Why3
namespace __init_stdio_Why3_ide_VC__init_stdio_assign_exit_part3_goal8
theorem goal8 (t_1 : Memory.addr -> ℤ) (a_2 : Memory.addr) (a_3 : Memory.addr) (a_9 : Memory.addr) (a_6 : Memory.addr) (a_7 : Memory.addr) (a_8 : Memory.addr) (t_4 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (t_3 : Memory.addr -> ℤ) (i : ℤ) (i_1 : ℤ) (i_2 : ℤ) (t_2 : Memory.addr -> ℤ) (a_4 : Memory.addr) (a_5 : Memory.addr) (a_10 : Memory.addr) (a_1 : Memory.addr) (a : Memory.addr) : let x : ℤ := t_1 (Memory.shift a_2 (10 : ℤ)); let x_1 : ℤ := t_1 (Memory.shift a_3 (10 : ℤ)); let x_2 : ℤ := t_1 (Memory.shift a_9 (0 : ℤ)); Memory.region (Memory.addr.base a_6) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_7) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_8) ≤ (0 : ℤ) → Memory.framed t_4 → Memory.linked t → Memory.sconst t_3 → Cint.is_sint32 i → Cint.is_sint32 i_1 → Cint.is_sint32 i_2 → Memory.valid_rw t a_6 (3 : ℤ) → Memory.valid_rw t a_7 (3 : ℤ) → Memory.valid_rw t a_8 (3 : ℤ) → Cint.is_uint32 x → Cint.is_uint32 x_1 → Cint.is_uint32 (t_2 (Memory.shift a_4 (10 : ℤ))) → Cint.is_uint32 (t_2 (Memory.shift a_5 (10 : ℤ))) → Cint.is_sint32 x_2 → Cint.is_sint32 (t_2 (Memory.shift a_10 (0 : ℤ))) → (Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_9 → i_1 = (12 : ℤ)) → (¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_9 → Memory.shift a_1 (0 : ℤ) = a_9) → (¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_9 → x_2 = (0 : ℤ)) → (¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_9 → Axiomatic3.p_valid_io_file_pvt t t_4 t_1 a) → ¬(¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_9 → x = (1 : ℤ) ∨ x_1 = (2 : ℤ))
  := sorry
end __init_stdio_Why3_ide_VC__init_stdio_assign_exit_part3_goal8

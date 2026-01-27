import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import frama_c.klibc_stdio.lib.lean.Axiomatic3.Axiomatic3
open Classical
open Lean4Why3
namespace __init_stdio_Why3_ide_VC__init_stdio_assign_normal_part3_goal11
theorem goal11 (t_1 : Memory.addr -> ℤ) (a_2 : Memory.addr) (a_3 : Memory.addr) (a_6 : Memory.addr) (a_7 : Memory.addr) (a_11 : Memory.addr) (a_12 : Memory.addr) (a_8 : Memory.addr) (a_9 : Memory.addr) (a_10 : Memory.addr) (t_3 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (t_2 : Memory.addr -> ℤ) (i : ℤ) (i_1 : ℤ) (a_1 : Memory.addr) (a_5 : Memory.addr) (a : Memory.addr) (a_4 : Memory.addr) : let x : ℤ := t_1 (Memory.shift a_2 (10 : ℤ)); let x_1 : ℤ := t_1 (Memory.shift a_3 (10 : ℤ)); let x_2 : ℤ := t_1 (Memory.shift a_6 (10 : ℤ)); let x_3 : ℤ := t_1 (Memory.shift a_7 (10 : ℤ)); let x_4 : ℤ := t_1 (Memory.shift a_11 (0 : ℤ)); let x_5 : ℤ := t_1 (Memory.shift a_12 (0 : ℤ)); Memory.region (Memory.addr.base a_8) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_9) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_10) ≤ (0 : ℤ) → Memory.framed t_3 → Memory.linked t → Memory.sconst t_2 → Cint.is_sint32 i → Cint.is_sint32 i_1 → Memory.valid_rw t a_8 (3 : ℤ) → Memory.valid_rw t a_9 (3 : ℤ) → Memory.valid_rw t a_10 (3 : ℤ) → Cint.is_uint32 x → Cint.is_uint32 x_1 → Cint.is_uint32 x_2 → Cint.is_uint32 x_3 → Cint.is_sint32 x_4 → Cint.is_sint32 x_5 → (Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_11 → i = (12 : ℤ)) → (Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_12 → i_1 = (12 : ℤ)) → (¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_11 → Memory.shift a_1 (0 : ℤ) = a_11) → (¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_12 → Memory.shift a_5 (0 : ℤ) = a_12) → (¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_11 → x_4 = (0 : ℤ)) → (¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_12 → x_5 = (1 : ℤ)) → (¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_11 → Axiomatic3.p_valid_io_file_pvt t t_3 t_1 a) → (¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_12 → Axiomatic3.p_valid_io_file_pvt t t_3 t_1 a_4) → (¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_11 → x = (1 : ℤ) ∨ x_1 = (2 : ℤ)) → ¬(¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_12 → x_2 = (1 : ℤ) ∨ x_3 = (2 : ℤ))
  := sorry
end __init_stdio_Why3_ide_VC__init_stdio_assign_normal_part3_goal11

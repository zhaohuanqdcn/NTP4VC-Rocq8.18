import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import frama_c.klibc_stdio.lib.lean.Axiomatic3.Axiomatic3
open Classical
open Lean4Why3
namespace __init_stdio_Why3_ide_VC__init_stdio_assign_normal_part2_goal10
theorem goal10 (t_1 : Memory.addr -> ℤ) (a_2 : Memory.addr) (a_3 : Memory.addr) (a_7 : Memory.addr) (a_4 : Memory.addr) (a_5 : Memory.addr) (a_6 : Memory.addr) (t_3 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (t_2 : Memory.addr -> ℤ) (i : ℤ) (a_1 : Memory.addr) (a : Memory.addr) : let x : ℤ := t_1 (Memory.shift a_2 (10 : ℤ)); let x_1 : ℤ := t_1 (Memory.shift a_3 (10 : ℤ)); let x_2 : ℤ := t_1 (Memory.shift a_7 (0 : ℤ)); Memory.region (Memory.addr.base a_4) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_5) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_6) ≤ (0 : ℤ) → Memory.framed t_3 → Memory.linked t → Memory.sconst t_2 → Cint.is_sint32 i → Memory.valid_rw t a_4 (3 : ℤ) → Memory.valid_rw t a_5 (3 : ℤ) → Memory.valid_rw t a_6 (3 : ℤ) → Cint.is_uint32 x → Cint.is_uint32 x_1 → Cint.is_sint32 x_2 → (Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_7 → i = (12 : ℤ)) → (¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_7 → Memory.shift a_1 (0 : ℤ) = a_7) → (¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_7 → x_2 = (0 : ℤ)) → (¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_7 → Axiomatic3.p_valid_io_file_pvt t t_3 t_1 a) → ¬(¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_7 → x = (1 : ℤ) ∨ x_1 = (2 : ℤ))
  := sorry
end __init_stdio_Why3_ide_VC__init_stdio_assign_normal_part2_goal10

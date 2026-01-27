import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import frama_c.klibc_stdio.lib.lean.Axiomatic3.Axiomatic3
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace rewind_Why3_ide_VCrewind_assign_normal_part2_goal7
theorem goal7 (a_2 : Memory.addr) (a_5 : Memory.addr) (a : Memory.addr) (t_2 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (t_1 : Memory.addr -> ℤ) (a_1 : Memory.addr) (a_3 : Memory.addr) (a_4 : Memory.addr) (a_9 : Memory.addr) (a_6 : Memory.addr) (a_8 : Memory.addr) (a_7 : Memory.addr) : let a_10 : Memory.addr := Memory.shift a_2 (0 : ℤ); let a_11 : Memory.addr := Memory.shift a_5 (0 : ℤ); let a_12 : Memory.addr := Memory.shift a_11 (2 : ℤ); a_10 = Memory.shift a (0 : ℤ) → a_11 = a_10 → Memory.region (Memory.addr.base a_5) ≤ (0 : ℤ) → Memory.framed t_2 → Memory.linked t → Cint.is_sint32 i → Axiomatic3.p_valid_io_file_pvt t t_2 t_1 a_1 → Axiomatic3.p_valid_io_file_pvt t t_2 t_1 a_3 → Axiomatic3.p_valid_io_file_pvt t t_2 t_1 a_4 → Axiomatic3.p_valid_file t t_1 a_10 → ¬Memory.invalid t a_12 (1 : ℤ) → i = -(1 : ℤ) ∨ i = (0 : ℤ) → a_12 = Memory.shift a_9 (7 : ℤ) ∨ a_12 = Memory.shift a_6 (8 : ℤ) ∨ a_12 = Memory.shift a_10 (1 : ℤ) ∨ a_12 = Memory.shift (Memory.shift a_8 (0 : ℤ)) (1 : ℤ) ∨ a_12 = Memory.shift a_10 (2 : ℤ) ∨ Memory.shift (Memory.shift a_7 (0 : ℤ)) (2 : ℤ) = a_12
  := sorry
end rewind_Why3_ide_VCrewind_assign_normal_part2_goal7

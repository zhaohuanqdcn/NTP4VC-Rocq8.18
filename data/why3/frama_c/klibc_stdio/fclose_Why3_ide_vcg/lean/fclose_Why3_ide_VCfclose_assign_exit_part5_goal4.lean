import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_stdio.lib.lean.Axiomatic3.Axiomatic3
open Classical
open Lean4Why3
namespace fclose_Why3_ide_VCfclose_assign_exit_part5_goal4
theorem goal4 (a_2 : Memory.addr) (a_4 : Memory.addr) (a_6 : Memory.addr) (a : Memory.addr) (t_3 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (t_1 : Memory.addr -> ℤ) (a_1 : Memory.addr) (a_3 : Memory.addr) (a_5 : Memory.addr) (t_2 : Memory.addr -> ℤ) (a_10 : Memory.addr) (a_7 : Memory.addr) (a_9 : Memory.addr) (a_8 : Memory.addr) (a_11 : Memory.addr) (a_12 : Memory.addr) : let a_13 : Memory.addr := Memory.shift a_2 (0 : ℤ); let a_14 : Memory.addr := Memory.shift (Memory.shift a_4 (0 : ℤ)) (2 : ℤ); let a_15 : Memory.addr := Memory.shift a_6 (0 : ℤ); a_13 = Memory.shift a (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.framed t_3 → Memory.linked t → Cint.is_sint32 i → Axiomatic3.p_valid_io_file_pvt t t_3 t_1 a_1 → Axiomatic3.p_valid_io_file_pvt t t_3 t_1 a_3 → ¬Memory.invalid t a_14 (1 : ℤ) → Axiomatic3.p_valid_io_file_pvt t t_3 t_1 a_5 ∧ (a_13 = Memory.addr.mk (0 : ℤ) (0 : ℤ) ∨ a_15 = a_13) ∨ t_2 = t_1 ∧ Axiomatic3.p_valid_io_file_pvt t t_3 t_2 a_5 ∧ (a_13 = Memory.addr.mk (0 : ℤ) (0 : ℤ) ∨ a_15 = a_13) → a_14 = Memory.shift a_10 (7 : ℤ) ∨ a_14 = Memory.shift a_7 (8 : ℤ) ∨ a_14 = Memory.shift (Memory.shift a_9 (0 : ℤ)) (1 : ℤ) ∨ Memory.shift (Memory.shift a_8 (0 : ℤ)) (2 : ℤ) = a_14 ∨ Memory.shift (t_3 (Memory.shift a_11 (3 : ℤ))) (4 : ℤ) = a_14 ∨ Memory.shift (t_3 (Memory.shift a_12 (4 : ℤ))) (3 : ℤ) = a_14
  := sorry
end fclose_Why3_ide_VCfclose_assign_exit_part5_goal4

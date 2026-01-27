import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_stdio.lib.lean.Axiomatic3.Axiomatic3
open Classical
open Lean4Why3
namespace __fflush_Why3_ide_VC__fflush_assign_normal_part07_goal25
theorem goal25 (a_3 : Memory.addr) (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (a_2 : Memory.addr) (t_2 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (a_1 : Memory.addr) : let a_4 : Memory.addr := Memory.shift a_3 (0 : ℤ); let a_5 : Memory.addr := Memory.shift a_3 (7 : ℤ); let x : ℤ := t_1 a_5; let a_6 : Memory.addr := Memory.shift (Memory.shift a (0 : ℤ)) (2 : ℤ); a_4 = Memory.shift a_2 (0 : ℤ) → ¬x = (0 : ℤ) → Memory.region (Memory.addr.base a_3) ≤ (0 : ℤ) → Memory.framed t_2 → Memory.linked t → Cint.is_sint32 i → Cint.is_uint32 x → Axiomatic3.p_valid_io_file_pvt t t_2 t_1 a_1 → Axiomatic3.p_valid_io_file_pvt t t_2 t_1 a_3 → ¬Memory.invalid t a_6 (1 : ℤ) → i = -(1 : ℤ) ∨ i = (0 : ℤ) → a_6 = a_5 ∨ a_6 = Memory.shift a_3 (8 : ℤ) ∨ a_6 = Memory.shift a_4 (1 : ℤ) ∨ Memory.shift a_4 (2 : ℤ) = a_6
  := sorry
end __fflush_Why3_ide_VC__fflush_assign_normal_part07_goal25

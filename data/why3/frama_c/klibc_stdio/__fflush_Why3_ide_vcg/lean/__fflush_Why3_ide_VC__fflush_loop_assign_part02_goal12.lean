import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_stdio.lib.lean.Axiomatic3.Axiomatic3
open Classical
open Lean4Why3
namespace __fflush_Why3_ide_VC__fflush_loop_assign_part02_goal12
theorem goal12 (t_2 : Memory.addr -> Memory.addr) (a_2 : Memory.addr) (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (a_1 : Memory.addr) (i : ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) : let a_3 : Memory.addr := t_2 (Memory.shift a_2 (5 : ℤ)); let x : ℤ := Memory.addr.base a_3; let x_1 : ℤ := Memory.addr.base a; let x_2 : ℤ := Memory.addr.base (t_2 (Memory.shift a_2 (6 : ℤ))); let x_3 : ℤ := t_1 (Memory.shift (Memory.shift a_2 (0 : ℤ)) (0 : ℤ)); let x_4 : ℤ := t_1 (Memory.shift a_2 (9 : ℤ)); let a_4 : Memory.addr := Memory.shift a_2 (8 : ℤ); let a_5 : Memory.addr := Memory.shift a_1 (0 : ℤ); ¬i = (0 : ℤ) → t_1 (Memory.shift a_2 (7 : ℤ)) = (0 : ℤ) → x = x_1 → x_2 = x_1 → x_2 = x → (0 : ℤ) ≤ i → i_1 ≤ i → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → (0 : ℤ) ≤ x_3 → -(1 : ℤ) ≤ i → -(1 : ℤ) ≤ i_1 → Memory.framed t_2 → Memory.linked t → Cint.is_uint32 i → Cint.is_sint32 i_1 → Cint.is_uint32 x_4 → Cint.is_uint32 (t_1 a_4) → Axiomatic3.p_valid_io_file_pvt t t_2 t_1 a_2 → ¬Memory.invalid t a_4 (1 : ℤ) → Memory.addr_le a_3 a → Memory.valid_rw t (Memory.shift a (0 : ℤ)) i → Cint.is_sint32 x_3 → Memory.addr_le a (Memory.shift a_3 ((32 : ℤ) + x_4)) → a_4 = Memory.shift a_1 (8 : ℤ) ∨ Memory.shift a_5 (1 : ℤ) = a_4 ∨ Memory.shift a_5 (2 : ℤ) = a_4
  := sorry
end __fflush_Why3_ide_VC__fflush_loop_assign_part02_goal12

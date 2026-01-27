import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace memmove_Why3_ide_VCmemmove_loop_assign_part5_goal30
theorem goal30 (a_1 : Memory.addr) (i : ℤ) (i_1 : ℤ) (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) (t : ℤ -> ℤ) : let a_2 : Memory.addr := Memory.shift a_1 (0 : ℤ); let x : ℤ := i - i_1; let a_3 : Memory.addr := Memory.shift a_1 x; let a_4 : Memory.addr := Memory.shift a x; let a_5 : Memory.addr -> ℤ := Memory.havoc t_1 t_2 a_2 x; ¬i_1 = (0 : ℤ) → (0 : ℤ) ≤ i → i_1 ≤ i → (0 : ℤ) ≤ i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_2 → Cint.is_uint32 i → Cint.is_uint32 i_1 → Memory.addr_lt a_1 a → Memory.valid_rw t (Memory.shift a (0 : ℤ)) i → Memory.valid_rw t a_2 i → Memory.addr_lt a_3 a_4 → Memory.addr_le a a_4 → Memory.addr_le a_1 a_3 → Memory.addr_le a_4 (Memory.shift a i) → Memory.addr_le a_3 (Memory.shift a_1 i) → ¬Memory.invalid t a_3 (1 : ℤ) → (∀(i_2 : ℤ), (0 : ℤ) ≤ i_2 → i_2 + i_1 < i → a_5 (Memory.shift a_1 i_2) = t_2 (Memory.shift a i_2)) → (∀(i_2 : ℤ), let a_6 : Memory.addr := Memory.shift a_1 i_2; i_2 < i → i ≤ i_2 + i_1 → a_5 a_6 = t_2 a_6) → Memory.included a_3 (1 : ℤ) a_2 (i - Cint.to_uint32 (i_1 - (1 : ℤ)))
  := sorry
end memmove_Why3_ide_VCmemmove_loop_assign_part5_goal30

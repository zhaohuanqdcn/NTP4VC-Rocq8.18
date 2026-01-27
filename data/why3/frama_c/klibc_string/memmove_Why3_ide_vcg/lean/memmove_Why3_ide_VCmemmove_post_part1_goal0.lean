import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace memmove_Why3_ide_VCmemmove_post_part1_goal0
theorem goal0 (a_1 : Memory.addr) (i : ℤ) (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) : let a_2 : Memory.addr := Memory.shift a_1 i; let a_3 : Memory.addr := Memory.shift a i; let a_4 : Memory.addr := Memory.shift a_1 (0 : ℤ); let a_5 : Memory.addr -> ℤ := Memory.havoc t_1 t_2 a_4 i; (0 : ℤ) ≤ i → (0 : ℤ) ≤ i_1 → i_1 < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_2 → Cint.is_uint32 i → Memory.addr_lt a_1 a → Memory.addr_lt a_2 a_3 → Memory.addr_le a a_3 → Memory.addr_le a_1 a_2 → Memory.addr_le a_3 a_3 → Memory.addr_le a_2 a_2 → Memory.valid_rw t (Memory.shift a (0 : ℤ)) i → Memory.valid_rw t a_4 i → (∀(i_2 : ℤ), (0 : ℤ) ≤ i_2 → i_2 < i → a_5 (Memory.shift a_1 i_2) = t_2 (Memory.shift a i_2)) → a_5 (Memory.shift a_1 i_1) = t_2 (Memory.shift a i_1)
  := sorry
end memmove_Why3_ide_VCmemmove_post_part1_goal0

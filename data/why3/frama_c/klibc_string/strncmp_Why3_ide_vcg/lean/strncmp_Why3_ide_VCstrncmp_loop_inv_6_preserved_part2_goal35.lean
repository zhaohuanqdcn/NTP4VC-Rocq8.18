import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace strncmp_Why3_ide_VCstrncmp_loop_inv_6_preserved_part2_goal35
theorem goal35 (i_1 : ℤ) (i : ℤ) (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (a_1 : Memory.addr) (t : ℤ -> ℤ) : let x_1 : ℤ := i_1 - i; let a_2 : Memory.addr := Memory.shift a x_1; let x_2 : ℤ := t_1 a_2; let a_3 : Memory.addr := Memory.shift a_1 x_1; let a_4 : Memory.addr := Memory.shift a (0 : ℤ); let a_5 : Memory.addr := Memory.shift a_1 (0 : ℤ); let a_6 : Memory.addr := Memory.shift a i_1; ¬i = (0 : ℤ) → ¬x_2 = (0 : ℤ) → t_1 a_3 = x_2 → (0 : ℤ) ≤ i → (0 : ℤ) ≤ i_1 → i ≤ i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_uint32 i → Cint.is_uint32 i_1 → Memory.valid_rw t a_4 i_1 → Memory.valid_rw t a_5 i_1 → Memory.separated a_5 i_1 a_4 i_1 → Memory.addr_le a a_2 → Memory.addr_le a_1 a_3 → Memory.addr_le a_2 a_6 → Memory.addr_le a_3 (Memory.shift a_1 i_1) → Cint.is_sint8 x_2 → (∀(i_2 : ℤ), (0 : ℤ) ≤ i_2 → i_2 + i < i_1 → t_1 (Memory.shift a_1 i_2) = t_1 (Memory.shift a i_2)) → Memory.addr_le (Memory.shift a ((1 : ℤ) + i_1 - i)) a_6
  := sorry
end strncmp_Why3_ide_VCstrncmp_loop_inv_6_preserved_part2_goal35

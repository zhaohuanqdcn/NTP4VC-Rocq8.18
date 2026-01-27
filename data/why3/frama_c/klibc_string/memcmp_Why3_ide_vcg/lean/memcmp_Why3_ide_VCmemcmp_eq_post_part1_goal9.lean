import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace memcmp_Why3_ide_VCmemcmp_eq_post_part1_goal9
theorem goal9 (i : ℤ) (i_1 : ℤ) (t_1 : Memory.addr -> ℤ) (a_5 : Memory.addr) (a_4 : Memory.addr) (a_6 : Memory.addr) (a_7 : Memory.addr) (t : ℤ -> ℤ) (a_1 : Memory.addr) (a : Memory.addr) (a_3 : Memory.addr) (a_2 : Memory.addr) : let x : ℤ := i - i_1; let x_1 : ℤ := t_1 (Memory.shift a_5 x); let x_2 : ℤ := t_1 (Memory.shift a_4 x); let a_8 : Memory.addr := Memory.shift a_6 (0 : ℤ); let a_9 : Memory.addr := Memory.shift a_7 (0 : ℤ); ¬i_1 = (0 : ℤ) → ¬x_1 = x_2 → (0 : ℤ) ≤ i → i_1 ≤ i → (0 : ℤ) ≤ i_1 → Memory.region (Memory.addr.base a_6) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_7) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Memory.valid_rw t a_8 i → Memory.valid_rw t a_9 i → Memory.separated a_9 i a_8 i → Cint.is_uint8 x_2 → Cint.is_uint8 x_1 → Cint.is_sint32 (x_1 - x_2) → (∀(i_2 : ℤ), (0 : ℤ) ≤ i_2 → i_2 < i → t_1 (Memory.shift a_1 i_2) = t_1 (Memory.shift a i_2)) → ¬(∀(i_2 : ℤ), (0 : ℤ) ≤ i_2 → i_2 + i_1 < i → t_1 (Memory.shift a_3 i_2) = t_1 (Memory.shift a_2 i_2))
  := sorry
end memcmp_Why3_ide_VCmemcmp_eq_post_part1_goal9

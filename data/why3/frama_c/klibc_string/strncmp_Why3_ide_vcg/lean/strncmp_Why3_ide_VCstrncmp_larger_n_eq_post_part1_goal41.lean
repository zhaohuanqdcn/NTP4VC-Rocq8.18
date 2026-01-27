import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace strncmp_Why3_ide_VCstrncmp_larger_n_eq_post_part1_goal41
theorem goal41 (i : ℤ) (i_1 : ℤ) (a_1 : Memory.addr) (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (t : ℤ -> ℤ) : let x : ℤ := i - i_1; let a_2 : Memory.addr := Memory.shift a_1 x; let x_1 : ℤ := t_1 a_2; let a_3 : Memory.addr := Memory.shift a x; let x_2 : ℤ := t_1 a_3; let a_4 : Memory.addr := Memory.shift a (0 : ℤ); let a_5 : Memory.addr := Memory.shift a_1 (0 : ℤ); ¬i_1 = (0 : ℤ) → ¬x_1 = x_2 → (0 : ℤ) ≤ i → i_1 ≤ i → (0 : ℤ) ≤ i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_uint32 i → Cint.is_uint32 i_1 → Memory.valid_rw t a_4 i → Memory.valid_rw t a_5 i → Memory.separated a_5 i a_4 i → Memory.addr_le a a_3 → Memory.addr_le a_1 a_2 → Memory.addr_le a_3 (Memory.shift a i) → Memory.addr_le a_2 (Memory.shift a_1 i) → Cint.is_sint8 x_2 → Cint.is_sint8 x_1 → Cint.is_sint32 (x_1 - x_2) → (∀(i_2 : ℤ), (0 : ℤ) ≤ i_2 → i_2 < i → t_1 (Memory.shift a_1 i_2) = t_1 (Memory.shift a i_2)) → (∀(i_2 : ℤ), (0 : ℤ) ≤ i_2 → i_2 + i_1 < i → t_1 (Memory.shift a_1 i_2) = t_1 (Memory.shift a i_2)) → (∀(i_2 : ℤ), (0 : ℤ) ≤ i_2 → i_2 < i → ¬t_1 (Memory.shift a i_2) = (0 : ℤ)) → ¬(∀(i_2 : ℤ), (0 : ℤ) ≤ i_2 → i_2 < i → ¬t_1 (Memory.shift a_1 i_2) = (0 : ℤ))
  := sorry
end strncmp_Why3_ide_VCstrncmp_larger_n_eq_post_part1_goal41

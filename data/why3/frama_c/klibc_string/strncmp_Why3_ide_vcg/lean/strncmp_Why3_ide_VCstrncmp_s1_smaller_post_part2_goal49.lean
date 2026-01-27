import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Compound.Compound
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace strncmp_Why3_ide_VCstrncmp_s1_smaller_post_part2_goal49
theorem goal49 (i : ℤ) (i_1 : ℤ) (a : Memory.addr) (a_1 : Memory.addr) (t_1 : Memory.addr -> ℤ) (i_2 : ℤ) (t : ℤ -> ℤ) : let x : ℤ := i - i_1; let a_2 : Memory.addr := Memory.shift a x; let a_3 : Memory.addr := Memory.shift a_1 x; let a_4 : Memory.addr := Memory.shift a (0 : ℤ); let a_5 : Memory.addr := Memory.shift a_1 (0 : ℤ); ¬i_1 = (0 : ℤ) → t_1 a_2 = (0 : ℤ) → t_1 a_3 = (0 : ℤ) → (0 : ℤ) ≤ i → i_1 ≤ i → (0 : ℤ) ≤ i_1 → (0 : ℤ) ≤ i_2 → i_2 < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_uint32 i → Cint.is_uint32 i_1 → Axiomatic.p_length_of_str_is t t_1 a_1 i_2 → Memory.valid_rw t a_4 i → Memory.valid_rw t a_5 i → Memory.separated a_5 i a_4 i → Memory.addr_le a a_2 → Memory.addr_le a_1 a_3 → Memory.addr_le a_2 (Memory.shift a i) → Memory.addr_le a_3 (Memory.shift a_1 i) → (∀(i_3 : ℤ), (0 : ℤ) ≤ i_3 → i_3 + i_1 < i → t_1 (Memory.shift a_1 i_3) = t_1 (Memory.shift a i_3)) → ¬(∀(i_3 : ℤ), (0 : ℤ) ≤ i_3 → i_3 < i → ¬t_1 (Memory.shift a i_3) = (0 : ℤ))
  := sorry
end strncmp_Why3_ide_VCstrncmp_s1_smaller_post_part2_goal49

import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Axiomatic1.Axiomatic1
import frama_c.klibc_string.lib.lean.A_Length.A_Length
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace memchr_Why3_ide_VCmemchr_found_post_part1_goal8
theorem goal8 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (i_2 : ℤ) (i : ℤ) (i_1 : ℤ) (i_3 : ℤ) (t : ℤ -> ℤ) : let x : ℤ := t_1 (Memory.shift a i_2); let x_1 : ℤ := i - i_1; let a_1 : Memory.addr := Memory.shift a x_1; let x_2 : ℤ := t_1 a_1; ¬i_1 = (0 : ℤ) → x = Cint.to_sint8 i_3 → x_2 = x → (0 : ℤ) < i → i_1 ≤ i → (0 : ℤ) ≤ i_1 → (0 : ℤ) ≤ i_2 → i_2 < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → -(128 : ℤ) ≤ i_3 → i_3 ≤ (127 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_sint32 i_3 → Memory.valid_rw t (Memory.shift a (0 : ℤ)) i → Memory.addr_le a a_1 → Memory.addr_le a_1 (Memory.shift a i) → Cint.is_sint8 x_2 → (∀(i_4 : ℤ), (0 : ℤ) ≤ i_4 → i_4 + i_1 < i → ¬x_2 = t_1 (Memory.shift a i_4)) → Axiomatic1.p_exists_first_occurence_of_char t t_1 a i_3 x_1
  := sorry
end memchr_Why3_ide_VCmemchr_found_post_part1_goal8

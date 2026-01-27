import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Compound.Compound
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace strncmp_Why3_ide_VCstrncmp_disjoint_zero_s2_smaller_s1_smaller_s1_s2_smaller____17_goal17
theorem goal17 (a : Memory.addr) (a_1 : Memory.addr) (i : ℤ) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) : let a_2 : Memory.addr := Memory.shift a (0 : ℤ); let a_3 : Memory.addr := Memory.shift a_1 (0 : ℤ); (0 : ℤ) ≤ i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_uint32 i → Memory.valid_rw t a_2 i → Memory.valid_rw t a_3 i → Memory.separated a_3 i a_2 i → (∀(i_2 : ℤ) (i_1 : ℤ), i_2 = i_1 ∨ i_1 < (0 : ℤ) ∨ i ≤ i_1 ∨ i_2 < (0 : ℤ) ∨ i ≤ i_2 ∨ ¬Axiomatic.p_length_of_str_is t t_1 a i_1 ∨ ¬Axiomatic.p_length_of_str_is t t_1 a_1 i_2) ∨ (∀(i_1 : ℤ), i_1 < (0 : ℤ) ∨ i ≤ i_1 ∨ ¬Axiomatic.p_length_of_str_is t t_1 a i_1 ∨ ¬Axiomatic.p_length_of_str_is t t_1 a_1 i_1 ∨ (∃(i_2 : ℤ), ¬t_1 (Memory.shift a_1 i_2) = t_1 (Memory.shift a i_2) ∧ (0 : ℤ) ≤ i_2 ∧ i_2 < i_1))
  := sorry
end strncmp_Why3_ide_VCstrncmp_disjoint_zero_s2_smaller_s1_smaller_s1_s2_smaller____17_goal17

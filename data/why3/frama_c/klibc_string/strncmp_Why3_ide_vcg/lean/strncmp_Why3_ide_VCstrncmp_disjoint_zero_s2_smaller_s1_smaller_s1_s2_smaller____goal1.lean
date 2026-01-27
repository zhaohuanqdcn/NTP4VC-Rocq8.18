import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Compound.Compound
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace strncmp_Why3_ide_VCstrncmp_disjoint_zero_s2_smaller_s1_smaller_s1_s2_smaller____goal1
theorem goal1 (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) : let a_2 : Memory.addr := Memory.shift a (0 : ℤ); let a_3 : Memory.addr := Memory.shift a_1 (0 : ℤ); (0 : ℤ) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_uint32 (0 : ℤ) → Memory.valid_rw t a_2 (0 : ℤ) → Memory.valid_rw t a_3 (0 : ℤ) → Memory.separated a_3 (0 : ℤ) a_2 (0 : ℤ) → ¬True ∨ (∃(i_1 : ℤ), t_1 (Memory.shift a_1 i_1) = (0 : ℤ) ∧ (0 : ℤ) ≤ i_1 ∧ i_1 < (0 : ℤ)) ∨ (∀(i_1 : ℤ), i_1 < (0 : ℤ) ∨ (0 : ℤ) ≤ i_1 ∨ ¬Axiomatic.p_length_of_str_is t t_1 a i_1)
  := sorry
end strncmp_Why3_ide_VCstrncmp_disjoint_zero_s2_smaller_s1_smaller_s1_s2_smaller____goal1

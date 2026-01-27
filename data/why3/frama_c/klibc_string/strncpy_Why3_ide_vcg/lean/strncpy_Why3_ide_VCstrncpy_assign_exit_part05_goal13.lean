import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace strncpy_Why3_ide_VCstrncpy_assign_exit_part05_goal13
theorem goal13 (a_1 : Memory.addr) (i_1 : ℤ) (i : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (i_2 : ℤ) (i_3 : ℤ) : let a_2 : Memory.addr := Memory.shift a_1 (0 : ℤ); i_1 ≤ i → (0 : ℤ) ≤ i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_uint32 i → Cint.is_uint32 i_1 → Axiomatic.p_length_of_str_is t t_1 a i_2 → Axiomatic.p_length_of_str_is t t_1 a i_3 → Memory.valid_rw t a_2 i_1 → Memory.separated (Memory.shift a (0 : ℤ)) i_1 a_2 i_1 → ¬Memory.invalid t a_2 ((1 : ℤ) + i - i_1) → i < (2 : ℤ) * i_1
  := sorry
end strncpy_Why3_ide_VCstrncpy_assign_exit_part05_goal13

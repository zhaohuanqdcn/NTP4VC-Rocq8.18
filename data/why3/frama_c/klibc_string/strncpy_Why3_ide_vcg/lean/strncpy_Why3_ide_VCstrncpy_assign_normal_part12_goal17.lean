import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace strncpy_Why3_ide_VCstrncpy_assign_normal_part12_goal17
theorem goal17 (a_1 : Memory.addr) (i : ℤ) (i_1 : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (i_4 : ℤ) (i_2 : ℤ) (i_3 : ℤ) : let a_2 : Memory.addr := Memory.shift a_1 (0 : ℤ); let x : ℤ := i - i_1; let a_3 : Memory.addr := Memory.shift a x; let a_4 : Memory.addr := Memory.shift a_1 x; ¬i = (0 : ℤ) → (0 : ℤ) ≤ i → (0 : ℤ) ≤ i_1 → i ≤ i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_sint8 i_4 → Cint.is_uint32 i → Cint.is_uint32 i_1 → Axiomatic.p_length_of_str_is t t_1 a i_2 → Axiomatic.p_length_of_str_is t t_1 a i_3 → Memory.valid_rw t a_2 i_1 → Memory.separated (Memory.shift a (0 : ℤ)) i_1 a_2 i_1 → Memory.addr_le a a_3 → Memory.addr_le a_1 a_4 → Memory.addr_le a_3 (Memory.shift a i_1) → Memory.addr_le a_4 (Memory.shift a_1 i_1) → ¬Memory.invalid t a_4 (1 : ℤ) → (¬i_1 = i → ¬i_4 = (0 : ℤ)) → Memory.included a_4 (1 : ℤ) a_2 i_1
  := sorry
end strncpy_Why3_ide_VCstrncpy_assign_normal_part12_goal17

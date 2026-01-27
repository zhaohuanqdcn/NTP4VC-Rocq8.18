import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace strncpy_Why3_ide_VCstrncpy_call_memset_pre_2_part2_goal21
theorem goal21 (a_1 : Memory.addr) (i : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (i_3 : ℤ) (i_1 : ℤ) (i_2 : ℤ) : let a_2 : Memory.addr := Memory.shift a_1 (0 : ℤ); let x : ℤ := -i; let a_3 : Memory.addr := Memory.shift a x; let a_4 : Memory.addr := Memory.shift a_1 x; (0 : ℤ) ≤ i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_sint8 i_3 → Cint.is_uint32 i → Axiomatic.p_length_of_str_is t t_1 a i_1 → Axiomatic.p_length_of_str_is t t_1 a i_2 → Memory.valid_rw t a_2 i → Memory.addr_le a a_3 → Memory.addr_le a_1 a_4 → Memory.addr_le a_3 (Memory.shift a i) → Memory.addr_le a_4 (Memory.shift a_1 i) → Memory.separated (Memory.shift a (0 : ℤ)) i a_2 i → (¬i = (0 : ℤ) → ¬i_3 = (0 : ℤ)) → Memory.valid_rw t a_4 (0 : ℤ)
  := sorry
end strncpy_Why3_ide_VCstrncpy_call_memset_pre_2_part2_goal21

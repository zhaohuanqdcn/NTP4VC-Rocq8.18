import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace strncpy_Why3_ide_VCstrncpy_loop_assign_part2_goal11
theorem goal11 (a_1 : Memory.addr) (a : Memory.addr) (i : ℤ) (i_1 : ℤ) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) (t : ℤ -> ℤ) (i_2 : ℤ) (i_3 : ℤ) : let a_2 : Memory.addr := Memory.shift a_1 (0 : ℤ); let a_3 : Memory.addr := Memory.shift a (0 : ℤ); let x_1 : ℤ := (1 : ℤ) + i - i_1; ¬i_1 = (0 : ℤ) → ¬Memory.havoc t_1 t_2 a_2 (1 : ℤ) a_3 = (0 : ℤ) → (0 : ℤ) ≤ i → i_1 ≤ i → (0 : ℤ) ≤ i_1 → i ≤ i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_2 → Cint.is_uint32 i → Cint.is_uint32 i_1 → Axiomatic.p_length_of_str_is t t_2 a i_2 → Axiomatic.p_length_of_str_is t t_2 a i_3 → Memory.addr_le a a_3 → Memory.addr_le a_1 a_2 → Memory.addr_le a_3 (Memory.shift a i_1) → Memory.addr_le a_2 (Memory.shift a_1 i_1) → Memory.valid_rw t a_2 i_1 → Memory.separated a_3 i_1 a_2 i_1 → ¬Memory.invalid t a_2 x_1 → Cint.is_sint8 (Memory.havoc t_1 t_2 a_2 x_1 (Memory.shift a (i - i_1))) → i_1 ≤ Cint.to_uint32 (i_1 - (1 : ℤ))
  := sorry
end strncpy_Why3_ide_VCstrncpy_loop_assign_part2_goal11

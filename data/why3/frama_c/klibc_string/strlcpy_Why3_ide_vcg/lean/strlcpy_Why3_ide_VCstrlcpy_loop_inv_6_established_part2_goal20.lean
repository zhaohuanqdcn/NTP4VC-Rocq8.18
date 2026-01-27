import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.A_Length.A_Length
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace strlcpy_Why3_ide_VCstrlcpy_loop_inv_6_established_part2_goal20
theorem goal20 (a_1 : Memory.addr) (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (i : ℤ) (i_1 : ℤ) (i_2 : ℤ) (t : ℤ -> ℤ) : let a_2 : Memory.addr := Memory.shift a_1 (0 : ℤ); let x : ℤ := A_Length.l_length t_1 a; (0 : ℤ) < i → i ≤ i_1 → i ≤ i_2 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_sint32 i → Axiomatic.p_length_of_str_is t t_1 a i_1 → Axiomatic.p_length_of_str_is t t_1 a i_2 → Memory.valid_rw t a_2 i → Memory.separated (Memory.shift a (0 : ℤ)) ((1 : ℤ) + x) a_2 i → Memory.addr_le a (Memory.shift a x)
  := sorry
end strlcpy_Why3_ide_VCstrlcpy_loop_inv_6_established_part2_goal20

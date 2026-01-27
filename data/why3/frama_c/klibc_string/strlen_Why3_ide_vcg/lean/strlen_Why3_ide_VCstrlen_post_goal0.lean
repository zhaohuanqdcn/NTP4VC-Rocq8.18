import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
import frama_c.klibc_string.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.A_Length.A_Length
open Classical
open Lean4Why3
namespace strlen_Why3_ide_VCstrlen_post_goal0
theorem goal0 (a_1 : Memory.addr) (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (t : ℤ -> ℤ) (i : ℤ) (i_1 : ℤ) : let x : ℤ := Memory.addr.base a_1; let x_1 : ℤ := Memory.addr.offset a; let x_2 : ℤ := Memory.addr.offset a_1; let x_3 : ℤ := A_Length.l_length t_1 a_1; t_1 a = (0 : ℤ) → x = Memory.addr.base a → Memory.region x ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Memory.addr_le a_1 a → Axiomatic.p_length_of_str_is t t_1 a_1 i → Axiomatic.p_length_of_str_is t t_1 a_1 i_1 → Cint.is_sint32 (x_1 - x_2) → Memory.addr_le a (Memory.shift a_1 x_3) → (∀(i_2 : ℤ), (0 : ℤ) ≤ i_2 → i_2 + x_2 < x_1 → ¬t_1 (Memory.shift a_1 i_2) = (0 : ℤ)) → x_2 + x_3 = x_1
  := sorry
end strlen_Why3_ide_VCstrlen_post_goal0

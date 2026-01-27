import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
import frama_c.klibc_string.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.A_Length.A_Length
open Classical
open Lean4Why3
namespace strlen_Why3_ide_VCstrlen_loop_inv_2_preserved_part1_goal1
theorem goal1 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (i_1 : ℤ) : let x : ℤ := t_1 a; let x_1 : ℤ := Memory.addr.base a_1; ¬x = (0 : ℤ) → x_1 = Memory.addr.base a → Memory.region x_1 ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Memory.addr_le a_1 a → Cint.is_sint8 x → Axiomatic.p_length_of_str_is t t_1 a_1 i → Axiomatic.p_length_of_str_is t t_1 a_1 i_1 → Memory.addr_le a (Memory.shift a_1 (A_Length.l_length t_1 a_1)) → (∀(i_2 : ℤ), (0 : ℤ) ≤ i_2 → i_2 + Memory.addr.offset a_1 < Memory.addr.offset a → ¬t_1 (Memory.shift a_1 i_2) = (0 : ℤ)) → Memory.addr_le a_1 (Memory.shift a (1 : ℤ))
  := sorry
end strlen_Why3_ide_VCstrlen_loop_inv_2_preserved_part1_goal1

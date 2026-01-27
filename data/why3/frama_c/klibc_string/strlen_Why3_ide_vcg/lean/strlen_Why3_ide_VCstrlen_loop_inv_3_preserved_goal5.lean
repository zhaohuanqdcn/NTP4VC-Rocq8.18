import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
import frama_c.klibc_string.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.A_Length.A_Length
open Classical
open Lean4Why3
namespace strlen_Why3_ide_VCstrlen_loop_inv_3_preserved_goal5
theorem goal5 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (a_1 : Memory.addr) (i_2 : ℤ) (t : ℤ -> ℤ) (i : ℤ) (i_1 : ℤ) : let x : ℤ := t_1 a; let x_1 : ℤ := Memory.addr.base a_1; let x_2 : ℤ := Memory.addr.offset a_1; let x_3 : ℤ := Memory.addr.offset a; ¬x = (0 : ℤ) → x_1 = Memory.addr.base a → (0 : ℤ) ≤ i_2 → Memory.region x_1 ≤ (0 : ℤ) → i_2 + x_2 ≤ x_3 → Memory.linked t → Memory.sconst t_1 → Memory.addr_le a_1 a → Cint.is_sint8 x → Axiomatic.p_length_of_str_is t t_1 a_1 i → Axiomatic.p_length_of_str_is t t_1 a_1 i_1 → Memory.addr_le a (Memory.shift a_1 (A_Length.l_length t_1 a_1)) → (∀(i_3 : ℤ), (0 : ℤ) ≤ i_3 → i_3 + x_2 < x_3 → ¬t_1 (Memory.shift a_1 i_3) = (0 : ℤ)) → ¬t_1 (Memory.shift a_1 i_2) = (0 : ℤ)
  := sorry
end strlen_Why3_ide_VCstrlen_loop_inv_3_preserved_goal5

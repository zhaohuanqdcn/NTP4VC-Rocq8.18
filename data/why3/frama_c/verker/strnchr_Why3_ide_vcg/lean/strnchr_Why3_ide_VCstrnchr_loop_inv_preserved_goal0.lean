import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_Strnlen.A_Strnlen
import frama_c.verker.lib.lean.Compound.Compound
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
open Classical
open Lean4Why3
namespace strnchr_Why3_ide_VCstrnchr_loop_inv_preserved_goal0
theorem goal0 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (i_1 : ℤ) (a_1 : Memory.addr) (i : ℤ) (t : ℤ -> ℤ) : let x : ℤ := t_1 a; let x_1 : ℤ := Cint.to_sint8 i_1; let x_2 : ℤ := Memory.addr.offset a_1; let x_3 : ℤ := Memory.addr.offset a; let x_4 : ℤ := i + x_3 - x_2; let x_5 : ℤ := A_Strnlen.l_strnlen t_1 a_1 x_4; ¬i = (0 : ℤ) → ¬x = (0 : ℤ) → ¬x = x_1 → x_2 + x_5 = x_3 + A_Strnlen.l_strnlen t_1 a i → (0 : ℤ) ≤ i → x_2 ≤ x_3 → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_sint32 i_1 → Cint.is_uint64 i → Memory.addr_le a_1 a → Cint.is_sint8 x → A_Strnlen.p_valid_strn t t_1 a i → Cint.is_uint64 x_4 → A_Strnlen.p_valid_strn t t_1 a_1 x_4 → Memory.addr_le a (Memory.shift a_1 x_5) → (∀(a_2 : Memory.addr), Memory.addr_lt a_2 a → Memory.addr_le a_1 a_2 → ¬t_1 a_2 = x_1) → x_2 + Cint.to_uint64 (i - (1 : ℤ)) ≤ i + x_3
  := sorry
end strnchr_Why3_ide_VCstrnchr_loop_inv_preserved_goal0

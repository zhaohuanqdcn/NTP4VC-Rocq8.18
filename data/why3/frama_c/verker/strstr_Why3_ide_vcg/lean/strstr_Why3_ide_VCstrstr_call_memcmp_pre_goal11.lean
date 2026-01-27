import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import frama_c.verker.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_StrStr.A_StrStr
open Classical
open Lean4Why3
namespace strstr_Why3_ide_VCstrstr_call_memcmp_pre_goal11
theorem goal11 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (a_2 : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) : let x : ℤ := A_Strlen.l_strlen t_1 a; let x_1 : ℤ := A_Strlen.l_strlen t_1 a_2; let a_3 : Memory.addr := Memory.shift a_2 x_1; let x_2 : ℤ := Memory.addr.offset a_2; let x_3 : ℤ := Memory.addr.offset a_1; ¬x = (0 : ℤ) → t_1 (Memory.shift a x) = (0 : ℤ) → t_1 a_3 = (0 : ℤ) → x_2 ≤ x_3 → (0 : ℤ) < x → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → x_3 + x ≤ x_2 + x_1 → Memory.linked t → Memory.sconst t_1 → Memory.addr_le a_2 a_1 → A_Strlen.p_valid_str t t_1 a → A_Strlen.p_valid_str t t_1 a_1 → A_Strlen.p_valid_str t t_1 a_2 → Cint.is_uint64 x → Cint.is_uint64 x_1 → Memory.addr_le a_1 a_3 → Cint.is_uint64 (x_2 + x_1 - x_3) → (∀(i : ℤ), (0 : ℤ) ≤ i → i < x → ¬t_1 (Memory.shift a i) = (0 : ℤ)) → (∀(i : ℤ), (0 : ℤ) ≤ i → i < x_1 → ¬t_1 (Memory.shift a_2 i) = (0 : ℤ)) → ¬(∀(a_4 : Memory.addr), Memory.addr_lt a_4 a_1 → Memory.addr_le a_2 a_4 → ¬A_StrStr.p_strmatch t_1 a_4 a)
  := sorry
end strstr_Why3_ide_VCstrstr_call_memcmp_pre_goal11

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
namespace strstr_Why3_ide_VCstrstr_call_memcmp_pre_5_goal15
theorem goal15 (t_1 : Memory.addr -> ℤ) (a_4 : Memory.addr) (a_6 : Memory.addr) (a_5 : Memory.addr) (t : ℤ -> ℤ) (a_3 : Memory.addr) (a_2 : Memory.addr) (a_1 : Memory.addr) (a : Memory.addr) : let x : ℤ := A_Strlen.l_strlen t_1 a_4; let x_1 : ℤ := A_Strlen.l_strlen t_1 a_6; let a_7 : Memory.addr := Memory.shift a_6 x_1; let x_2 : ℤ := Memory.addr.offset a_6; let x_3 : ℤ := Memory.addr.offset a_5; ¬x = (0 : ℤ) → t_1 (Memory.shift a_4 x) = (0 : ℤ) → t_1 a_7 = (0 : ℤ) → x_2 ≤ x_3 → (0 : ℤ) < x → Memory.region (Memory.addr.base a_4) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_6) ≤ (0 : ℤ) → x_3 + x ≤ x_2 + x_1 → Memory.linked t → Memory.sconst t_1 → Memory.addr_le a_6 a_5 → A_Strlen.p_valid_str t t_1 a_4 → A_Strlen.p_valid_str t t_1 a_5 → A_Strlen.p_valid_str t t_1 a_6 → Cint.is_uint64 x → Cint.is_uint64 x_1 → Memory.addr_le a_5 a_7 → Cint.is_uint64 (x_2 + x_1 - x_3) → (∀(i : ℤ), (0 : ℤ) ≤ i → i < x → ¬t_1 (Memory.shift a_4 i) = (0 : ℤ)) → (∀(i : ℤ), (0 : ℤ) ≤ i → i < x_1 → ¬t_1 (Memory.shift a_6 i) = (0 : ℤ)) → (∀(a_8 : Memory.addr), Memory.addr_lt a_8 a_5 → Memory.addr_le a_6 a_8 → ¬A_StrStr.p_strmatch t_1 a_8 a_4) → (Memory.addr.base a_3 = Memory.addr.base a_2) = (Memory.addr.base a_1 = Memory.addr.base a)
  := sorry
end strstr_Why3_ide_VCstrstr_call_memcmp_pre_5_goal15

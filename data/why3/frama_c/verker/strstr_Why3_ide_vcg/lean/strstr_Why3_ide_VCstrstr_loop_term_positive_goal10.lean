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
namespace strstr_Why3_ide_VCstrstr_loop_term_positive_goal10
theorem goal10 (t_2 : Memory.addr -> ℤ) (a_16 : Memory.addr) (a_18 : Memory.addr) (a_17 : Memory.addr) (i : ℤ) (a_13 : Memory.addr) (a_12 : Memory.addr) (a_11 : Memory.addr) (a_10 : Memory.addr) (t_1 : Memory.addr -> ℤ) (a_1 : Memory.addr) (i_1 : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) (a_14 : Memory.addr) (a_15 : Memory.addr) (a_3 : Memory.addr) (a_2 : Memory.addr) (a_7 : Memory.addr) (a_6 : Memory.addr) (a_9 : Memory.addr) (a_8 : Memory.addr) (a_5 : Memory.addr) (a_4 : Memory.addr) : let x : ℤ := A_Strlen.l_strlen t_2 a_16; let x_1 : ℤ := A_Strlen.l_strlen t_2 a_18; let a_19 : Memory.addr := Memory.shift a_18 x_1; let x_2 : ℤ := Memory.addr.offset a_18; let x_3 : ℤ := Memory.addr.offset a_17; let x_4 : ℤ := x_2 + x_1; ¬i = (0 : ℤ) → (Memory.addr.base a_13 = Memory.addr.base a_12) = (Memory.addr.base a_11 = Memory.addr.base a_10) → ¬x = (0 : ℤ) → ¬t_1 (Memory.shift a_1 i_1) = t_1 (Memory.shift a i_1) → t_2 (Memory.shift a_16 x) = (0 : ℤ) → t_2 a_19 = (0 : ℤ) → (0 : ℤ) ≤ i_1 → x_2 ≤ x_3 → (0 : ℤ) < x → i_1 < x → Memory.region (Memory.addr.base a_16) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_18) ≤ (0 : ℤ) → x_3 + x ≤ x_4 → Memory.linked t → Memory.sconst t_2 → Cint.is_sint32 i → Memory.addr_le a_18 a_17 → ¬A_StrStr.p_strmatch t_2 a_17 a_16 → A_Strlen.p_valid_str t t_2 a_16 → A_Strlen.p_valid_str t t_2 a_17 → A_Strlen.p_valid_str t t_2 a_18 → Cint.is_uint64 x → Cint.is_uint64 x_1 → Memory.valid_rd t (Memory.shift a_14 (0 : ℤ)) x → Memory.valid_rd t (Memory.shift a_15 (0 : ℤ)) x → Memory.addr_le a_17 a_19 → Cint.is_uint64 (x_2 + x_1 - x_3) → ((∃(i_2 : ℤ), ¬t_1 (Memory.shift a_3 i_2) = t_1 (Memory.shift a_2 i_2) ∧ (0 : ℤ) ≤ i_2 ∧ i_2 < x) → (∃(i_2 : ℤ), ¬t_1 (Memory.shift a_7 i_2) = t_1 (Memory.shift a_6 i_2) ∧ t_1 (Memory.shift a_9 i_2) = i + t_1 (Memory.shift a_8 i_2) ∧ (0 : ℤ) ≤ i_2 ∧ i_2 < x ∧ (∀(i_3 : ℤ), (0 : ℤ) ≤ i_3 → i_3 < i_2 → t_1 (Memory.shift a_5 i_3) = t_1 (Memory.shift a_4 i_3)))) → (∀(i_2 : ℤ), (0 : ℤ) ≤ i_2 → i_2 < x → ¬t_2 (Memory.shift a_16 i_2) = (0 : ℤ)) → (∀(i_2 : ℤ), (0 : ℤ) ≤ i_2 → i_2 < x_1 → ¬t_2 (Memory.shift a_18 i_2) = (0 : ℤ)) → (∀(a_20 : Memory.addr), Memory.addr_lt a_20 a_17 → Memory.addr_le a_18 a_20 → ¬A_StrStr.p_strmatch t_2 a_20 a_16) → x_3 ≤ x_4
  := sorry
end strstr_Why3_ide_VCstrstr_loop_term_positive_goal10

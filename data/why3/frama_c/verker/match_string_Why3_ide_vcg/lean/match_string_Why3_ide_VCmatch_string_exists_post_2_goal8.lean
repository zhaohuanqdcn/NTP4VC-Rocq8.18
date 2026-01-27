import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.Compound.Compound
import frama_c.verker.lib.lean.A_StrCmp.A_StrCmp
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import frama_c.verker.lib.lean.A_MatchString.A_MatchString
open Classical
open Lean4Why3
namespace match_string_Why3_ide_VCmatch_string_exists_post_2_goal8
theorem goal8 (t_4 : Memory.addr -> Memory.addr) (a_1 : Memory.addr) (i : ℤ) (i_1 : ℤ) (t_1 : Memory.addr -> ℤ) (i_3 : ℤ) (a : Memory.addr) (i_2 : ℤ) (t : ℤ -> ℤ) (t_2 : Memory.addr -> ℤ) (t_3 : Memory.addr -> ℤ) : let x : ℤ := A_MatchString.l_real_len t_4 a_1 i; let a_2 : Memory.addr := t_4 (Memory.shift a_1 i_1); let a_3 : Memory.addr := Memory.shift a_1 (0 : ℤ); A_StrCmp.l_strcmp t_1 (t_4 (Memory.shift a_1 i_3)) a = (0 : ℤ) → (0 : ℤ) ≤ i_2 → (0 : ℤ) ≤ i_3 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → x ≤ i → i_3 < x → i_2 ≤ x → i ≤ (2147483647 : ℤ) → Memory.framed t_4 → Memory.linked t → Memory.sconst t_1 → Cint.is_sint32 i_2 → Cint.is_uint64 i → Cint.is_uint64 i_3 → A_Strlen.p_valid_str t t_1 a → (if Cint.to_uint64 i_2 < i then t_2 = t_1 ∧ (if t_4 (Memory.shift a_1 i_2) = Memory.addr.mk (0 : ℤ) (0 : ℤ) then i_1 = -(22 : ℤ) else i_2 = i_1 ∧ t_3 = t_2 ∧ A_StrCmp.l_strcmp t_3 a_2 a = (0 : ℤ) ∧ A_Strlen.p_valid_str t t_3 a ∧ A_Strlen.p_valid_str t t_3 a_2 ∧ (∀(i_4 : ℤ), t_3 (Memory.shift a_2 i_4) = t_3 (Memory.shift a i_4) ∨ i_4 < (0 : ℤ) ∨ A_Strlen.l_strlen t_3 a_2 < i_4)) else i_1 = -(22 : ℤ)) → (x = i → Memory.valid_rw t a_3 i) → (x < i → Memory.valid_rw t a_3 ((1 : ℤ) + x)) → (∀(i_4 : ℤ), (0 : ℤ) ≤ i_4 → i_4 < i_2 → A_Strlen.p_valid_str t t_1 (t_4 (Memory.shift a_1 i_4))) → (∀(i_4 : ℤ), (0 : ℤ) ≤ i_4 → i_4 < i_2 → ¬A_StrCmp.l_strcmp t_1 (t_4 (Memory.shift a_1 i_4)) a = (0 : ℤ)) → (∀(i_4 : ℤ), (0 : ℤ) ≤ i_4 → i_4 < x → Cint.is_uint64 i_4 → A_Strlen.p_valid_str t t_1 (t_4 (Memory.shift a_1 i_4))) → (0 : ℤ) ≤ i_1 ∧ i_1 < x
  := sorry
end match_string_Why3_ide_VCmatch_string_exists_post_2_goal8

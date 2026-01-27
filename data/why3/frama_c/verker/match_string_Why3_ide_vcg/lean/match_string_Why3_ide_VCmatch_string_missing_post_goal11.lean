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
namespace match_string_Why3_ide_VCmatch_string_missing_post_goal11
theorem goal11 (t_2 : Memory.addr -> Memory.addr) (a_1 : Memory.addr) (i_1 : ℤ) (i : ℤ) (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (t : ℤ -> ℤ) : let a_2 : Memory.addr := t_2 (Memory.shift a_1 i_1); let x : ℤ := A_MatchString.l_real_len t_2 a_1 i; let a_3 : Memory.addr := Memory.shift a_1 (0 : ℤ); ¬a_2 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → A_StrCmp.l_strcmp t_1 a_2 a = (0 : ℤ) → (0 : ℤ) ≤ i_1 → Cint.to_uint64 i_1 < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → x ≤ i → i_1 ≤ x → i ≤ (2147483647 : ℤ) → Memory.framed t_2 → Memory.linked t → Memory.sconst t_1 → Cint.is_sint32 i_1 → Cint.is_uint64 i → A_Strlen.p_valid_str t t_1 a → A_Strlen.p_valid_str t t_1 a_2 → (x = i → Memory.valid_rw t a_3 i) → (x < i → Memory.valid_rw t a_3 ((1 : ℤ) + x)) → (∀(i_2 : ℤ), (0 : ℤ) ≤ i_2 → i_2 < i_1 → A_Strlen.p_valid_str t t_1 (t_2 (Memory.shift a_1 i_2))) → (∀(i_2 : ℤ), (0 : ℤ) ≤ i_2 → i_2 < i_1 → ¬A_StrCmp.l_strcmp t_1 (t_2 (Memory.shift a_1 i_2)) a = (0 : ℤ)) → (∀(i_2 : ℤ), (0 : ℤ) ≤ i_2 → i_2 < x → Cint.is_uint64 i_2 → A_Strlen.p_valid_str t t_1 (t_2 (Memory.shift a_1 i_2))) → (∀(i_2 : ℤ), (0 : ℤ) ≤ i_2 → i_2 < x → Cint.is_uint64 i_2 → ¬A_StrCmp.l_strcmp t_1 (t_2 (Memory.shift a_1 i_2)) a = (0 : ℤ)) → (∀(i_2 : ℤ), t_1 (Memory.shift a_2 i_2) = t_1 (Memory.shift a i_2) ∨ i_2 < (0 : ℤ) ∨ A_Strlen.l_strlen t_1 a_2 < i_2) → i_1 = -(22 : ℤ)
  := sorry
end match_string_Why3_ide_VCmatch_string_missing_post_goal11

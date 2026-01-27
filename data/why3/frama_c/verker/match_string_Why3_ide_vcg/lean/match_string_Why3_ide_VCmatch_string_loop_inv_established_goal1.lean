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
namespace match_string_Why3_ide_VCmatch_string_loop_inv_established_goal1
theorem goal1 (t_2 : Memory.addr -> Memory.addr) (a_1 : Memory.addr) (i : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) : let x : ℤ := A_MatchString.l_real_len t_2 a_1 i; let a_2 : Memory.addr := Memory.shift a_1 (0 : ℤ); Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → i ≤ (2147483647 : ℤ) → Memory.framed t_2 → Memory.linked t → Memory.sconst t_1 → Cint.is_uint64 i → A_Strlen.p_valid_str t t_1 a → (x = i → Memory.valid_rw t a_2 i) → (x < i → Memory.valid_rw t a_2 ((1 : ℤ) + x)) → (∀(i_1 : ℤ), (0 : ℤ) ≤ i_1 → i_1 < x → Cint.is_uint64 i_1 → A_Strlen.p_valid_str t t_1 (t_2 (Memory.shift a_1 i_1))) → x ≤ i ∧ (0 : ℤ) ≤ x
  := sorry
end match_string_Why3_ide_VCmatch_string_loop_inv_established_goal1

import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import frama_c.verker.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_StrnCmp.A_StrnCmp
import frama_c.verker.lib.lean.A_Strnlen.A_Strnlen
open Classical
open Lean4Why3
namespace sysfs_streq_Why3_ide_VCsysfs_streq_assert_goal12
theorem goal12 (a_3 : Memory.addr) (i : ℤ) (t_1 : Memory.addr -> ℤ) (a_2 : Memory.addr) (i_2 : ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) (p : Bool) (a_1 : Memory.addr) (a : Memory.addr) : let a_4 : Memory.addr := Memory.shift a_3 i; let x : ℤ := t_1 a_4; let a_5 : Memory.addr := Memory.shift a_2 i; let x_1 : ℤ := t_1 (Memory.shift a_2 i_2); let x_2 : ℤ := t_1 (Memory.shift a_3 i_2); let x_3 : ℤ := t_1 (Memory.shift a_2 i_1); let x_4 : ℤ := t_1 (Memory.shift a_3 i_1); i ≤ A_Strlen.l_strlen t_1 a_2 → i ≤ A_Strlen.l_strlen t_1 a_3 → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_3) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_uint64 i → A_Strlen.p_valid_str t t_1 a_2 → A_Strlen.p_valid_str t t_1 a_3 → A_StrnCmp.p_strnequal t_1 a_3 a_2 i → Cint.is_sint8 x → A_Strlen.p_valid_str t t_1 a_5 → A_Strlen.p_valid_str t t_1 a_4 → (if x = (0 : ℤ) then p = false ∧ (0 : ℤ) ≤ i_1 ∧ i_1 < i ∧ Cint.is_uint64 i_1 else p = true ∧ ¬t_1 a_1 = t_1 a ∧ a_5 = a ∧ a_4 = a_1 ∧ (0 : ℤ) ≤ i_2 ∧ i_2 < i ∧ Cint.is_uint64 i_2) → (∀(i_3 : ℤ), (0 : ℤ) ≤ i_3 → i_3 < i → t_1 (Memory.shift a_3 i_3) = t_1 (Memory.shift a_2 i_3)) → (if p = true then ¬x_1 = (0 : ℤ) ∧ ¬x_2 = (0 : ℤ) ∧ x_2 = x_1 else ¬x_3 = (0 : ℤ) ∧ ¬x_4 = (0 : ℤ) ∧ x_4 = x_3)
  := sorry
end sysfs_streq_Why3_ide_VCsysfs_streq_assert_goal12

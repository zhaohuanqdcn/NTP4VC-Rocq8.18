import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import frama_c.verker.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_SysfsStr.A_SysfsStr
import frama_c.verker.lib.lean.A_StrnCmp.A_StrnCmp
import frama_c.verker.lib.lean.A_Strnlen.A_Strnlen
open Classical
open Lean4Why3
namespace sysfs_streq_Why3_ide_VCsysfs_streq_assert_3_goal13
theorem goal13 (a : Memory.addr) (i : ℤ) (a_1 : Memory.addr) (t_1 : Memory.addr -> ℤ) (t : ℤ -> ℤ) : let a_2 : Memory.addr := Memory.shift a i; let a_3 : Memory.addr := Memory.shift a_1 i; t_1 a_2 = (0 : ℤ) → t_1 a_3 = (0 : ℤ) → i ≤ A_Strlen.l_strlen t_1 a → i ≤ A_Strlen.l_strlen t_1 a_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_uint64 i → A_Strlen.p_valid_str t t_1 a → A_Strlen.p_valid_str t t_1 a_1 → A_StrnCmp.p_strnequal t_1 a_1 a i → A_Strlen.p_valid_str t t_1 a_2 → A_Strlen.p_valid_str t t_1 a_3 → (∀(i_1 : ℤ), (0 : ℤ) ≤ i_1 → i_1 < i → t_1 (Memory.shift a_1 i_1) = t_1 (Memory.shift a i_1)) → (∀(i_1 : ℤ), let x : ℤ := t_1 (Memory.shift a i_1); let x_1 : ℤ := t_1 (Memory.shift a_1 i_1); (0 : ℤ) ≤ i_1 → i_1 < i → ¬x = (0 : ℤ) ∧ ¬x_1 = (0 : ℤ) ∧ x_1 = x) → A_SysfsStr.l_sysfs_strlen t_1 a_1 = A_SysfsStr.l_sysfs_strlen t_1 a
  := sorry
end sysfs_streq_Why3_ide_VCsysfs_streq_assert_3_goal13

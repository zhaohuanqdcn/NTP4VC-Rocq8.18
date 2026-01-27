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
namespace sysfs_streq_Why3_ide_VCsysfs_streq_assert_8_goal16
theorem goal16 (a : Memory.addr) (i : ℤ) (a_1 : Memory.addr) (t_1 : Memory.addr -> ℤ) (t : ℤ -> ℤ) : let a_2 : Memory.addr := Memory.shift a i; let a_3 : Memory.addr := Memory.shift a_1 i; let x : ℤ := A_SysfsStr.l_sysfs_strlen t_1 a_2; t_1 a_2 = (10 : ℤ) → t_1 a_3 = (0 : ℤ) → A_SysfsStr.l_sysfs_strlen t_1 a_3 = x → t_1 (Memory.shift a ((1 : ℤ) + i)) = (0 : ℤ) → i ≤ A_Strlen.l_strlen t_1 a → i ≤ A_Strlen.l_strlen t_1 a_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_uint64 i → A_Strlen.p_valid_str t t_1 a → A_Strlen.p_valid_str t t_1 a_1 → A_StrnCmp.p_strnequal t_1 a_1 a i → A_Strlen.p_valid_str t t_1 a_2 → A_Strlen.p_valid_str t t_1 a_3 → A_StrnCmp.p_strnequal t_1 a_3 a_2 x → (∀(i_1 : ℤ), (0 : ℤ) ≤ i_1 → i_1 < i → t_1 (Memory.shift a_1 i_1) = t_1 (Memory.shift a i_1)) → (∀(i_1 : ℤ), let x_1 : ℤ := t_1 (Memory.shift a i_1); let x_2 : ℤ := t_1 (Memory.shift a_1 i_1); (0 : ℤ) ≤ i_1 → i_1 < i → Cint.is_uint64 i_1 → ¬x_1 = (0 : ℤ) ∧ ¬x_2 = (0 : ℤ) ∧ x_2 = x_1) → A_SysfsStr.l_sysfs_strlen t_1 a = i
  := sorry
end sysfs_streq_Why3_ide_VCsysfs_streq_assert_8_goal16

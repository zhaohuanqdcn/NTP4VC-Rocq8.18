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
namespace sysfs_streq_Why3_ide_VCsysfs_streq_disjoint_not_trivial_trivial_nulls_goal1
theorem goal1 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) : let x : ℤ := A_SysfsStr.l_sysfs_strlen t_1 a; let x_1 : ℤ := A_SysfsStr.l_sysfs_strlen t_1 a_1; Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → A_Strlen.p_valid_str t t_1 a → A_Strlen.p_valid_str t t_1 a_1 → (¬x = (0 : ℤ) ∨ ¬x_1 = (0 : ℤ) ∨ (x_1 = (0 : ℤ)) = (x = (0 : ℤ))) ∧ (x = (0 : ℤ) ∨ x_1 = (0 : ℤ) ∨ (x_1 = (0 : ℤ)) = (x = (0 : ℤ)))
  := sorry
end sysfs_streq_Why3_ide_VCsysfs_streq_disjoint_not_trivial_trivial_nulls_goal1

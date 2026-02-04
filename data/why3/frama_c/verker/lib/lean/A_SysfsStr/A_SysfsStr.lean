import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.verker.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import frama_c.verker.lib.lean.A_StrnCmp.A_StrnCmp
import frama_c.verker.lib.lean.A_Strnlen.A_Strnlen
open Classical
open Lean4Why3
namespace A_SysfsStr
axiom l_sysfs_strlen : (Memory.addr -> ℤ) -> Memory.addr -> ℤ
axiom fix_l_sysfs_strlen (mchar_0 : Memory.addr -> ℤ) (s : Memory.addr) : if mchar_0 (Memory.shift s (0 : ℤ)) = (0 : ℤ) ∨ mchar_0 (Memory.shift s (0 : ℤ)) = (10 : ℤ) ∧ mchar_0 (Memory.shift s (1 : ℤ)) = (0 : ℤ) then l_sysfs_strlen mchar_0 s = (0 : ℤ) else Cint.to_uint64 ((1 : ℤ) + l_sysfs_strlen mchar_0 (Memory.shift s (1 : ℤ))) = l_sysfs_strlen mchar_0 s
axiom Q_TL_sysfs_strlen (mchar_0 : Memory.addr -> ℤ) (s : Memory.addr) : Cint.is_uint64 (l_sysfs_strlen mchar_0 s)
end A_SysfsStr

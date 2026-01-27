import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import frama_c.verker.lib.lean.Compound.Compound
import frama_c.verker.lib.lean.A_Strnlen.A_Strnlen
open Classical
open Lean4Why3
namespace strncpy_Why3_ide_VCstrncpy_loop_inv_established_goal2
theorem goal2 (a_1 : Memory.addr) (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (i : ℤ) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.base a_1; let x_1 : ℤ := Memory.addr.base a; let x_2 : ℤ := A_Strnlen.l_strnlen t_1 a i; ¬x = x_1 → Memory.region x_1 ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_uint64 i → A_Strlen.p_valid_str t t_1 a → A_Strnlen.p_valid_strn t t_1 a i → Memory.valid_rw t (Memory.shift a_1 (0 : ℤ)) ((1 : ℤ) + x_2) → Memory.addr_le a a ∧ Memory.addr_le a (Memory.shift a x_2)
  := sorry
end strncpy_Why3_ide_VCstrncpy_loop_inv_established_goal2

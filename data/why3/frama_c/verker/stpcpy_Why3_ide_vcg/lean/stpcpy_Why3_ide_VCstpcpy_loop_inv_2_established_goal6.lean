import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.Compound.Compound
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace stpcpy_Why3_ide_VCstpcpy_loop_inv_2_established_goal6
theorem goal6 (a_1 : Memory.addr) (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.base a_1; let x_1 : ℤ := Memory.addr.base a; let x_2 : ℤ := A_Strlen.l_strlen t_1 a; ¬x = x_1 → Memory.region x_1 ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → A_Strlen.p_valid_str t t_1 a → Memory.valid_rw t (Memory.shift a_1 (0 : ℤ)) ((1 : ℤ) + x_2) → Memory.addr_le a_1 a_1 ∧ Memory.addr_le a_1 (Memory.shift a_1 x_2)
  := sorry
end stpcpy_Why3_ide_VCstpcpy_loop_inv_2_established_goal6

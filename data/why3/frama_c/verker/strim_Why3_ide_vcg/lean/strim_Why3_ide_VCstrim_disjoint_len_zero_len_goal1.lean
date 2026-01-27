import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import frama_c.verker.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace strim_Why3_ide_VCstrim_disjoint_len_zero_len_goal1
theorem goal1 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (t : ℤ -> ℤ) : let x : ℤ := A_Strlen.l_strlen t_1 a; Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → A_Strlen.p_valid_str t t_1 a → ¬x = (0 : ℤ) ∨ x ≤ (0 : ℤ)
  := sorry
end strim_Why3_ide_VCstrim_disjoint_len_zero_len_goal1

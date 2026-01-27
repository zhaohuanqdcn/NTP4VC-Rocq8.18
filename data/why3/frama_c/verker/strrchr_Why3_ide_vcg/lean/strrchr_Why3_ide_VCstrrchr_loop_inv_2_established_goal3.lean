import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import frama_c.verker.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace strrchr_Why3_ide_VCstrrchr_loop_inv_2_established_goal3
theorem goal3 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (t : ℤ -> ℤ) (i : ℤ) : let x : ℤ := t_1 (Memory.addr.mk (0 : ℤ) (0 : ℤ)); Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_sint32 i → Cint.is_sint8 x → A_Strlen.p_valid_str t t_1 a → ¬x = Cint.to_sint8 i ∨ ¬Memory.addr_lt (Memory.addr.mk (0 : ℤ) (0 : ℤ)) a ∨ ¬Memory.addr_le a (Memory.addr.mk (0 : ℤ) (0 : ℤ))
  := sorry
end strrchr_Why3_ide_VCstrrchr_loop_inv_2_established_goal3

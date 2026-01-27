import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import frama_c.verker.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_StrPBrk.A_StrPBrk
import frama_c.verker.lib.lean.A_StrSpn.A_StrSpn
open Classical
open Lean4Why3
namespace strsep_Why3_ide_VCstrsep_complete_input_strpbrk_not_null_input_strpbrk_null____goal0
theorem goal0 (t_2 : Memory.addr -> Memory.addr) (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) : let a_2 : Memory.addr := t_2 a; let a_3 : Memory.addr := A_StrPBrk.l_strpbrk a_2 a_1; (¬A_Strlen.p_valid_str t t_1 a_2) = (a_2 = Memory.addr.mk (0 : ℤ) (0 : ℤ)) → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.framed t_2 → Memory.linked t → Memory.sconst t_1 → Memory.valid_rw t a (1 : ℤ) → A_Strlen.p_valid_str t t_1 a_1 → a_2 = Memory.addr.mk (0 : ℤ) (0 : ℤ) ∨ a_3 = Memory.addr.mk (0 : ℤ) (0 : ℤ) ∧ A_Strlen.p_valid_str t t_1 a_2 ∨ ¬a_3 = Memory.addr.mk (0 : ℤ) (0 : ℤ) ∧ A_Strlen.p_valid_str t t_1 a_2
  := sorry
end strsep_Why3_ide_VCstrsep_complete_input_strpbrk_not_null_input_strpbrk_null____goal0

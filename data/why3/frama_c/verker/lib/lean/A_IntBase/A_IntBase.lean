import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.verker.lib.lean.Compound.Compound
import frama_c.verker.lib.lean.A_Ctype.A_Ctype
open Classical
open Lean4Why3
namespace A_IntBase
noncomputable def p_is_hex (mchar_0 : Memory.addr -> ℤ) (s : Memory.addr) := mchar_0 (Memory.shift s (0 : ℤ)) = (48 : ℤ) ∧ A_Ctype.l_tolower (mchar_0 (Memory.shift s (1 : ℤ))) = (120 : ℤ) ∧ A_Ctype.p_isxdigit (mchar_0 (Memory.shift s (2 : ℤ)))
noncomputable def p_is_oct (mchar_0 : Memory.addr -> ℤ) (s : Memory.addr) := mchar_0 (Memory.shift s (0 : ℤ)) = (48 : ℤ) ∧ ¬p_is_hex mchar_0 s
noncomputable def p_is_dec (mchar_0 : Memory.addr -> ℤ) (s : Memory.addr) := ¬p_is_hex mchar_0 s ∧ ¬p_is_oct mchar_0 s
end A_IntBase

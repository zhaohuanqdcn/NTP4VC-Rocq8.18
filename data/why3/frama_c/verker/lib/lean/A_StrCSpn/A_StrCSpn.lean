import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.verker.lib.lean.A_StrSpn.A_StrSpn
import frama_c.verker.lib.lean.Compound.Compound
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace A_StrCSpn
axiom l_strcspn : Memory.addr -> Memory.addr -> ℤ
axiom Q_strcspn_base_case (mchar_0 : Memory.addr -> ℤ) (s : Memory.addr) (reject_0 : Memory.addr) (fact0 : mchar_0 s = (0 : ℤ)) : l_strcspn s reject_0 = (0 : ℤ)
axiom Q_strcspn_in_reject (mchar_0 : Memory.addr -> ℤ) (s : Memory.addr) (reject_0 : Memory.addr) : ¬mchar_0 s = (0 : ℤ) → A_StrSpn.p_in_array mchar_0 reject_0 (mchar_0 s) → l_strcspn s reject_0 = (0 : ℤ)
axiom Q_strcspn_not_in_reject (mchar_0 : Memory.addr -> ℤ) (s : Memory.addr) (reject_0 : Memory.addr) : ¬mchar_0 s = (0 : ℤ) → ¬A_StrSpn.p_in_array mchar_0 reject_0 (mchar_0 s) → (1 : ℤ) + l_strcspn (Memory.shift s (1 : ℤ)) reject_0 = l_strcspn s reject_0
end A_StrCSpn

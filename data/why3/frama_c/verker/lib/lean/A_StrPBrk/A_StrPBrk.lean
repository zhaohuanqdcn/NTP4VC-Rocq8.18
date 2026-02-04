import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.verker.lib.lean.A_StrSpn.A_StrSpn
import frama_c.verker.lib.lean.Compound.Compound
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace A_StrPBrk
axiom l_strpbrk : Memory.addr -> Memory.addr -> Memory.addr
axiom Q_strpbrk_base_case (mchar_0 : Memory.addr -> ℤ) (s : Memory.addr) (ct_0 : Memory.addr) (fact0 : mchar_0 s = (0 : ℤ)) : l_strpbrk s ct_0 = Memory.addr.mk (0 : ℤ) (0 : ℤ)
axiom Q_strpbrk_found (mchar_0 : Memory.addr -> ℤ) (s : Memory.addr) (ct_0 : Memory.addr) : ¬mchar_0 s = (0 : ℤ) → A_StrSpn.p_in_array mchar_0 ct_0 (mchar_0 s) → l_strpbrk s ct_0 = s
axiom Q_strpbrk_not_found (mchar_0 : Memory.addr -> ℤ) (s : Memory.addr) (ct_0 : Memory.addr) : ¬mchar_0 s = (0 : ℤ) → ¬A_StrSpn.p_in_array mchar_0 ct_0 (mchar_0 s) → l_strpbrk (Memory.shift s (1 : ℤ)) ct_0 = l_strpbrk s ct_0
end A_StrPBrk

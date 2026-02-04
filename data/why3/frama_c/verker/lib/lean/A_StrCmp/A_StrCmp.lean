import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.verker.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
open Classical
open Lean4Why3
namespace A_StrCmp
noncomputable def l_cmp (a : ℤ) (b : ℤ) := if b = a then (0 : ℤ) else if a < b then -(1 : ℤ) else (1 : ℤ)
axiom l_strncmp_1' : (Memory.addr -> ℤ) -> Memory.addr -> Memory.addr -> ℤ -> ℤ
axiom fix_l_strncmp_1' (mchar_0 : Memory.addr -> ℤ) (cs_0 : Memory.addr) (ct_0 : Memory.addr) (n : ℤ) : if n = -(1 : ℤ) then l_strncmp_1' mchar_0 cs_0 ct_0 n = (0 : ℤ) else if mchar_0 (Memory.shift ct_0 (0 : ℤ)) = mchar_0 (Memory.shift cs_0 (0 : ℤ)) then l_strncmp_1' mchar_0 (Memory.shift cs_0 (1 : ℤ)) (Memory.shift ct_0 (1 : ℤ)) (n - (1 : ℤ)) = l_strncmp_1' mchar_0 cs_0 ct_0 n else l_cmp (Cint.to_uint8 (mchar_0 (Memory.shift cs_0 (0 : ℤ)))) (Cint.to_uint8 (mchar_0 (Memory.shift ct_0 (0 : ℤ)))) = l_strncmp_1' mchar_0 cs_0 ct_0 n
noncomputable def l_strcmp (mchar_0 : Memory.addr -> ℤ) (cs_0 : Memory.addr) (ct_0 : Memory.addr) := l_strncmp_1' mchar_0 cs_0 ct_0 (A_Strlen.l_strlen mchar_0 cs_0)
noncomputable def p_equaln (mchar_0 : Memory.addr -> ℤ) (cs_0 : Memory.addr) (ct_0 : Memory.addr) (n : ℤ) := l_strncmp_1' mchar_0 cs_0 ct_0 n = (0 : ℤ)
noncomputable def p_equal (mchar_0 : Memory.addr -> ℤ) (cs_0 : Memory.addr) (ct_0 : Memory.addr) := l_strcmp mchar_0 cs_0 ct_0 = (0 : ℤ)
end A_StrCmp

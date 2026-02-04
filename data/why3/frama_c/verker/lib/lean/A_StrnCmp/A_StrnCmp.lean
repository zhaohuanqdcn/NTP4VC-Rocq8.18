import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.verker.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_Strnlen.A_Strnlen
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
open Classical
open Lean4Why3
namespace A_StrnCmp
axiom l_strncmp_2' : (Memory.addr -> ℤ) -> Memory.addr -> Memory.addr -> ℤ -> ℤ
axiom fix_l_strncmp_2' (mchar_0 : Memory.addr -> ℤ) (s1_0 : Memory.addr) (s2_0 : Memory.addr) (n : ℤ) : if n = (0 : ℤ) then l_strncmp_2' mchar_0 s1_0 s2_0 n = (0 : ℤ) else if mchar_0 (Memory.shift s2_0 (0 : ℤ)) = mchar_0 (Memory.shift s1_0 (0 : ℤ)) then if mchar_0 (Memory.shift s1_0 (0 : ℤ)) = (0 : ℤ) then l_strncmp_2' mchar_0 s1_0 s2_0 n = (0 : ℤ) else l_strncmp_2' mchar_0 (Memory.shift s1_0 (1 : ℤ)) (Memory.shift s2_0 (1 : ℤ)) (Cint.to_uint64 (n - (1 : ℤ))) = l_strncmp_2' mchar_0 s1_0 s2_0 n else Cint.to_sint32 (mchar_0 (Memory.shift s1_0 (0 : ℤ)) - mchar_0 (Memory.shift s2_0 (0 : ℤ))) = l_strncmp_2' mchar_0 s1_0 s2_0 n
noncomputable def p_strnequal (mchar_0 : Memory.addr -> ℤ) (s1_0 : Memory.addr) (s2_0 : Memory.addr) (n : ℤ) := l_strncmp_2' mchar_0 s1_0 s2_0 n = (0 : ℤ)
axiom Q_TL_strncmp_2' (mchar_0 : Memory.addr -> ℤ) (s1_0 : Memory.addr) (s2_0 : Memory.addr) (n : ℤ) : Cint.is_sint32 (l_strncmp_2' mchar_0 s1_0 s2_0 n)
end A_StrnCmp

import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.verker.lib.lean.A_StrCmp.A_StrCmp
import frama_c.verker.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
open Classical
open Lean4Why3
namespace A_MatchString
axiom l_match_string : (Memory.addr -> Memory.addr) -> (Memory.addr -> ℤ) -> Memory.addr -> ℤ -> Memory.addr -> ℤ
axiom fix_l_match_string (mptr_0 : Memory.addr -> Memory.addr) (mchar_0 : Memory.addr -> ℤ) (a : Memory.addr) (n : ℤ) (s : Memory.addr) : if n = (0 : ℤ) then l_match_string mptr_0 mchar_0 a n s = (0 : ℤ) else if A_StrCmp.l_strcmp mchar_0 (mptr_0 (Memory.shift a (0 : ℤ))) s = (0 : ℤ) then l_match_string mptr_0 mchar_0 a n s = (0 : ℤ) else l_match_string mptr_0 mchar_0 (Memory.shift a (1 : ℤ)) (Cint.to_uint64 (n - (1 : ℤ))) s = l_match_string mptr_0 mchar_0 a n s
axiom l_real_len : (Memory.addr -> Memory.addr) -> Memory.addr -> ℤ -> ℤ
axiom fix_l_real_len (mptr_0 : Memory.addr -> Memory.addr) (a : Memory.addr) (n : ℤ) : if n = (0 : ℤ) ∨ mptr_0 (Memory.shift a (0 : ℤ)) = Memory.addr.mk (0 : ℤ) (0 : ℤ) then l_real_len mptr_0 a n = (0 : ℤ) else Cint.to_uint64 ((1 : ℤ) + l_real_len mptr_0 (Memory.shift a (1 : ℤ)) (Cint.to_uint64 (n - (1 : ℤ)))) = l_real_len mptr_0 a n
axiom Q_TL_match_string (mptr_0 : Memory.addr -> Memory.addr) (mchar_0 : Memory.addr -> ℤ) (a : Memory.addr) (n : ℤ) (s : Memory.addr) : Cint.is_uint64 (l_match_string mptr_0 mchar_0 a n s)
axiom Q_TL_real_len (mptr_0 : Memory.addr -> Memory.addr) (a : Memory.addr) (n : ℤ) : Cint.is_uint64 (l_real_len mptr_0 a n)
end A_MatchString

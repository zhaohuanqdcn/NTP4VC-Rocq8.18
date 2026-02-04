import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.verker.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
open Classical
open Lean4Why3
namespace A_Strchrnul
axiom l_strchrnul : (Memory.addr -> ℤ) -> Memory.addr -> ℤ -> Memory.addr
axiom fix_l_strchrnul (mchar_0 : Memory.addr -> ℤ) (str_0 : Memory.addr) (c : ℤ) : if mchar_0 str_0 = c then l_strchrnul mchar_0 str_0 c = str_0 else if mchar_0 str_0 = (0 : ℤ) then l_strchrnul mchar_0 str_0 c = str_0 else l_strchrnul mchar_0 (Memory.shift str_0 (1 : ℤ)) c = l_strchrnul mchar_0 str_0 c
end A_Strchrnul

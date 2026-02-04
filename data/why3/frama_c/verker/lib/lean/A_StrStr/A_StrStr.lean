import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import frama_c.verker.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace A_StrStr
axiom l_strstr : Memory.addr -> Memory.addr -> Memory.addr
noncomputable def p_strmatch (mchar_0 : Memory.addr -> ℤ) (s1_0 : Memory.addr) (s2_0 : Memory.addr) := ∀(i : ℤ), (0 : ℤ) ≤ i → i < A_Strlen.l_strlen mchar_0 s2_0 → mchar_0 (Memory.shift s2_0 i) = mchar_0 (Memory.shift s1_0 i)
end A_StrStr

import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Axiomatic1.Axiomatic1
import frama_c.klibc_string.lib.lean.Compound.Compound
import frama_c.klibc_string.lib.lean.A_Length.A_Length
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace A_PosOfChar
axiom l_posofchar : (Memory.addr -> ℤ) -> Memory.addr -> ℤ -> ℤ
axiom Q_pos_of_char (c : ℤ) (malloc_0 : ℤ -> ℤ) (mchar_0 : Memory.addr -> ℤ) (s : Memory.addr) (pos_0 : ℤ) (fact0 : Cint.is_sint32 c) (fact1 : Axiomatic1.p_exists_first_occurence_of_char malloc_0 mchar_0 s c pos_0) : l_posofchar mchar_0 s c = pos_0
end A_PosOfChar

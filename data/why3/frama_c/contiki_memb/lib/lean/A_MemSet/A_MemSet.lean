import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.contiki_memb.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace A_MemSet
axiom l_memset : (Memory.addr -> ℤ) -> Memory.addr -> ℤ -> ℤ -> Bool
axiom Q_memset_def (n : ℤ) (mchar_0 : Memory.addr -> ℤ) (s : Memory.addr) (c : ℤ) : (∀(i : ℤ), (0 : ℤ) ≤ i → i < n → mchar_0 (Memory.shift s i) = c) = (l_memset mchar_0 s c n = true)
end A_MemSet

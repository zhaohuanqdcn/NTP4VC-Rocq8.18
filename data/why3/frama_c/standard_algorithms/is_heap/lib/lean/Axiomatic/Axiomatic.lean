import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.is_heap.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace Axiomatic
noncomputable def l_heapparent (i : ℤ) := Int.tdiv (i - (1 : ℤ)) (2 : ℤ)
noncomputable def p_isheap (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (n : ℤ) := ∀(i : ℤ), (0 : ℤ) < i → i < n → mint_0 (Memory.shift a i) ≤ mint_0 (Memory.shift a (l_heapparent i))
end Axiomatic

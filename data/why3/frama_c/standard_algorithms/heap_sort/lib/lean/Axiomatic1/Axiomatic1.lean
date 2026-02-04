import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.heap_sort.lib.lean.A_Count.A_Count
import frama_c.standard_algorithms.heap_sort.lib.lean.Compound.Compound
import frama_c.standard_algorithms.heap_sort.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace Axiomatic1
noncomputable def p_multisetunchanged_1' (mint_0 : Memory.addr -> ℤ) (mint_1 : Memory.addr -> ℤ) (a : Memory.addr) (first_0 : ℤ) (last_0 : ℤ) := ∀(i : ℤ), Cint.is_sint32 i → A_Count.l_count_1' mint_1 a first_0 last_0 i = A_Count.l_count_1' mint_0 a first_0 last_0 i
noncomputable def p_sorted_1' (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (m : ℤ) (n : ℤ) := ∀(i_1 : ℤ) (i : ℤ), i < n → m ≤ i_1 → i_1 < i → mint_0 (Memory.shift a i_1) ≤ mint_0 (Memory.shift a i)
noncomputable def l_heapparent (i : ℤ) := Int.tdiv (i - (1 : ℤ)) (2 : ℤ)
noncomputable def p_isheap (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (n : ℤ) := ∀(i : ℤ), (0 : ℤ) < i → i < n → mint_0 (Memory.shift a i) ≤ mint_0 (Memory.shift a (l_heapparent i))
end Axiomatic1

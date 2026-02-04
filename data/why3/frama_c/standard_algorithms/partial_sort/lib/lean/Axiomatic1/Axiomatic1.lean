import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.partial_sort.lib.lean.A_Count.A_Count
import Why3.Cint.Cint
import frama_c.standard_algorithms.partial_sort.lib.lean.Compound.Compound
import frama_c.standard_algorithms.partial_sort.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace Axiomatic1
noncomputable def p_hasvalue_1' (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (m : ℤ) (n : ℤ) (v : ℤ) := ∃(i : ℤ), mint_0 (Memory.shift a i) = v ∧ m ≤ i ∧ i < n
noncomputable def p_upperbound_1' (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (m : ℤ) (n : ℤ) (v : ℤ) := ∀(i : ℤ), m ≤ i → i < n → mint_0 (Memory.shift a i) ≤ v
noncomputable def p_maxelement (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (n : ℤ) (max_0 : ℤ) := (0 : ℤ) ≤ max_0 ∧ max_0 < n ∧ p_upperbound_1' mint_0 a (0 : ℤ) n (mint_0 (Memory.shift a max_0))
noncomputable def l_heapparent (i : ℤ) := Int.tdiv (i - (1 : ℤ)) (2 : ℤ)
noncomputable def p_isheap (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (n : ℤ) := ∀(i : ℤ), (0 : ℤ) < i → i < n → mint_0 (Memory.shift a i) ≤ mint_0 (Memory.shift a (l_heapparent i))
noncomputable def p_multisetunchanged_1' (mint_0 : Memory.addr -> ℤ) (mint_1 : Memory.addr -> ℤ) (a : Memory.addr) (first_0 : ℤ) (last_0 : ℤ) := ∀(i : ℤ), Cint.is_sint32 i → A_Count.l_count_1' mint_1 a first_0 last_0 i = A_Count.l_count_1' mint_0 a first_0 last_0 i
noncomputable def p_lowerbound_1' (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (m : ℤ) (n : ℤ) (v : ℤ) := ∀(i : ℤ), m ≤ i → i < n → v ≤ mint_0 (Memory.shift a i)
noncomputable def p_swappedinside (mint_0 : Memory.addr -> ℤ) (mint_1 : Memory.addr -> ℤ) (a : Memory.addr) (i : ℤ) (k : ℤ) (n : ℤ) := let a_1 : Memory.addr := Memory.shift a i; let a_2 : Memory.addr := Memory.shift a k; mint_1 a_1 = mint_0 a_2 ∧ mint_1 a_2 = mint_0 a_1 ∧ (0 : ℤ) ≤ i ∧ i < k ∧ k < n ∧ Axiomatic.p_unchanged_1' mint_0 mint_1 a (0 : ℤ) i ∧ Axiomatic.p_unchanged_1' mint_0 mint_1 a ((1 : ℤ) + i) k ∧ Axiomatic.p_unchanged_1' mint_0 mint_1 a ((1 : ℤ) + k) n
end Axiomatic1

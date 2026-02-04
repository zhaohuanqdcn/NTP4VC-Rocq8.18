import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.selection_sort.lib.lean.A_Count.A_Count
import Why3.Cint.Cint
import frama_c.standard_algorithms.selection_sort.lib.lean.Compound.Compound
import frama_c.standard_algorithms.selection_sort.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace Axiomatic1
noncomputable def p_sorted_1' (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (m : ℤ) (n : ℤ) := ∀(i_1 : ℤ) (i : ℤ), i < n → m ≤ i_1 → i_1 < i → mint_0 (Memory.shift a i_1) ≤ mint_0 (Memory.shift a i)
noncomputable def p_lowerbound_1' (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (m : ℤ) (n : ℤ) (v : ℤ) := ∀(i : ℤ), m ≤ i → i < n → v ≤ mint_0 (Memory.shift a i)
noncomputable def p_strictlowerbound_1' (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (m : ℤ) (n : ℤ) (v : ℤ) := ∀(i : ℤ), m ≤ i → i < n → v < mint_0 (Memory.shift a i)
noncomputable def p_strictupperbound_1' (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (m : ℤ) (n : ℤ) (v : ℤ) := ∀(i : ℤ), m ≤ i → i < n → mint_0 (Memory.shift a i) < v
noncomputable def p_upperbound_1' (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (m : ℤ) (n : ℤ) (v : ℤ) := ∀(i : ℤ), m ≤ i → i < n → mint_0 (Memory.shift a i) ≤ v
noncomputable def p_minelement (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (n : ℤ) (min_0 : ℤ) := (0 : ℤ) ≤ min_0 ∧ min_0 < n ∧ p_lowerbound_1' mint_0 a (0 : ℤ) n (mint_0 (Memory.shift a min_0))
noncomputable def p_multisetunchanged_1' (mint_0 : Memory.addr -> ℤ) (mint_1 : Memory.addr -> ℤ) (a : Memory.addr) (first_0 : ℤ) (last_0 : ℤ) := ∀(i : ℤ), Cint.is_sint32 i → A_Count.l_count_1' mint_1 a first_0 last_0 i = A_Count.l_count_1' mint_0 a first_0 last_0 i
end Axiomatic1

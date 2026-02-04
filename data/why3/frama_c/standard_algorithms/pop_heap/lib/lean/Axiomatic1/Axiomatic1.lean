import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.pop_heap.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.pop_heap.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.standard_algorithms.pop_heap.lib.lean.A_Count.A_Count
open Classical
open Lean4Why3
namespace Axiomatic1
noncomputable def p_heapmaximumchild (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (n : ℤ) (p : ℤ) (c : ℤ) := let x : ℤ := Axiomatic.l_heapleft p; let x_1 : ℤ := mint_0 (Memory.shift a c); let x_2 : ℤ := Axiomatic.l_heapright p; (0 : ℤ) ≤ p ∧ (2 : ℤ) + p ≤ n ∧ (p ≤ (2147483646 : ℤ) → Axiomatic.l_heapparent c = p) ∧ ((2 : ℤ) + x ≤ n → mint_0 (Memory.shift a x) ≤ x_1) ∧ ((2 : ℤ) + x_2 ≤ n → mint_0 (Memory.shift a x_2) ≤ x_1)
noncomputable def p_multisetunchanged_1' (mint_0 : Memory.addr -> ℤ) (mint_1 : Memory.addr -> ℤ) (a : Memory.addr) (first_0 : ℤ) (last_0 : ℤ) := ∀(i : ℤ), Cint.is_sint32 i → A_Count.l_count_1' mint_1 a first_0 last_0 i = A_Count.l_count_1' mint_0 a first_0 last_0 i
end Axiomatic1

import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.min_element.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace Axiomatic
noncomputable def p_lowerbound_1' (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (m : ℤ) (n : ℤ) (v : ℤ) := ∀(i : ℤ), m ≤ i → i < n → v ≤ mint_0 (Memory.shift a i)
noncomputable def p_strictlowerbound_1' (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (m : ℤ) (n : ℤ) (v : ℤ) := ∀(i : ℤ), m ≤ i → i < n → v < mint_0 (Memory.shift a i)
noncomputable def p_minelement (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (n : ℤ) (min_0 : ℤ) := (0 : ℤ) ≤ min_0 ∧ min_0 < n ∧ p_lowerbound_1' mint_0 a (0 : ℤ) n (mint_0 (Memory.shift a min_0))
end Axiomatic

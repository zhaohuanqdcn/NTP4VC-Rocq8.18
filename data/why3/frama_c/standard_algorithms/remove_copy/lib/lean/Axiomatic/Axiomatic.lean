import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.remove_copy.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace Axiomatic
noncomputable def p_unchanged_1' (mint_0 : Memory.addr -> ℤ) (mint_1 : Memory.addr -> ℤ) (a : Memory.addr) (m : ℤ) (n : ℤ) := ∀(i : ℤ), let a_1 : Memory.addr := Memory.shift a i; m ≤ i → i < n → mint_1 a_1 = mint_0 a_1
noncomputable def p_hasvalue_1' (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (m : ℤ) (n : ℤ) (v : ℤ) := ∃(i : ℤ), mint_0 (Memory.shift a i) = v ∧ m ≤ i ∧ i < n
end Axiomatic

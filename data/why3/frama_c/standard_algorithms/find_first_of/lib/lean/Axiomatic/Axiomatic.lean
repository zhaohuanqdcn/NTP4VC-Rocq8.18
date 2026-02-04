import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.find_first_of.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace Axiomatic
noncomputable def p_hasvalue_1' (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (m : ℤ) (n : ℤ) (v : ℤ) := ∃(i : ℤ), mint_0 (Memory.shift a i) = v ∧ m ≤ i ∧ i < n
noncomputable def p_hasvalueof (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (m : ℤ) (b : Memory.addr) (n : ℤ) := ∃(i : ℤ), (0 : ℤ) ≤ i ∧ i < m ∧ p_hasvalue_1' mint_0 b (0 : ℤ) n (mint_0 (Memory.shift a i))
end Axiomatic

import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.max_seq.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace Axiomatic
noncomputable def p_strictupperbound_1' (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (m : ℤ) (n : ℤ) (v : ℤ) := ∀(i : ℤ), m ≤ i → i < n → mint_0 (Memory.shift a i) < v
noncomputable def p_upperbound_1' (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (m : ℤ) (n : ℤ) (v : ℤ) := ∀(i : ℤ), m ≤ i → i < n → mint_0 (Memory.shift a i) ≤ v
noncomputable def p_maxelement (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (n : ℤ) (max_0 : ℤ) := (0 : ℤ) ≤ max_0 ∧ max_0 < n ∧ p_upperbound_1' mint_0 a (0 : ℤ) n (mint_0 (Memory.shift a max_0))
end Axiomatic

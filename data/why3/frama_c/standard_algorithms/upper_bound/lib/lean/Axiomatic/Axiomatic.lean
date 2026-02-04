import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.upper_bound.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace Axiomatic
noncomputable def p_upperbound_1' (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (m : ℤ) (n : ℤ) (v : ℤ) := ∀(i : ℤ), m ≤ i → i < n → mint_0 (Memory.shift a i) ≤ v
noncomputable def p_strictlowerbound_1' (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (m : ℤ) (n : ℤ) (v : ℤ) := ∀(i : ℤ), m ≤ i → i < n → v < mint_0 (Memory.shift a i)
noncomputable def p_sorted_1' (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (m : ℤ) (n : ℤ) := ∀(i_1 : ℤ) (i : ℤ), i < n → m ≤ i_1 → i_1 < i → mint_0 (Memory.shift a i_1) ≤ mint_0 (Memory.shift a i)
end Axiomatic

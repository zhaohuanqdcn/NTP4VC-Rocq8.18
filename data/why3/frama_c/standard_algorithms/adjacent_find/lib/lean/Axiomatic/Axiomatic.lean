import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.adjacent_find.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace Axiomatic
noncomputable def p_hasequalneighbors (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (n : ℤ) := ∃(i : ℤ), mint_0 (Memory.shift a ((1 : ℤ) + i)) = mint_0 (Memory.shift a i) ∧ (0 : ℤ) ≤ i ∧ (2 : ℤ) + i ≤ n
end Axiomatic

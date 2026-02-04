import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.iota.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace Axiomatic
noncomputable def p_iota (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (n : ℤ) (v : ℤ) := ∀(i : ℤ), (0 : ℤ) ≤ i → i < n → mint_0 (Memory.shift a i) = v + i
end Axiomatic

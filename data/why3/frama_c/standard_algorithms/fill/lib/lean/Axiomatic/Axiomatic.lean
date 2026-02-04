import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.fill.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace Axiomatic
noncomputable def p_constantrange (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (first_0 : ℤ) (last_0 : ℤ) (val_0 : ℤ) := ∀(i : ℤ), first_0 ≤ i → i < last_0 → mint_0 (Memory.shift a i) = val_0
end Axiomatic

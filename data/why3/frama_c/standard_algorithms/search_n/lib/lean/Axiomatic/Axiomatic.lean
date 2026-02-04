import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.search_n.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace Axiomatic
noncomputable def p_constantrange (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (first_0 : ℤ) (last_0 : ℤ) (val_0 : ℤ) := ∀(i : ℤ), first_0 ≤ i → i < last_0 → mint_0 (Memory.shift a i) = val_0
noncomputable def p_hasconstantsubrange (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (m : ℤ) (n : ℤ) (b : ℤ) := ∃(i : ℤ), let x : ℤ := n + i; (0 : ℤ) ≤ i ∧ x ≤ m ∧ p_constantrange mint_0 a i x b
end Axiomatic

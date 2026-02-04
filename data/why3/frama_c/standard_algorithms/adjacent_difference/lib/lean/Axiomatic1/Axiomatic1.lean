import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.adjacent_difference.lib.lean.Compound.Compound
import frama_c.standard_algorithms.adjacent_difference.lib.lean.A_DifferenceAxiomatic.A_DifferenceAxiomatic
import Why3.Cint.Cint
import frama_c.standard_algorithms.adjacent_difference.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace Axiomatic1
noncomputable def p_adjacentdifference (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (n : ℤ) (b : Memory.addr) := ∀(i : ℤ), (0 : ℤ) ≤ i → i < n → mint_0 (Memory.shift b i) = A_DifferenceAxiomatic.l_difference mint_0 a i
noncomputable def p_adjacentdifferencebounds (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (n : ℤ) := ∀(i : ℤ), let x : ℤ := A_DifferenceAxiomatic.l_difference mint_0 a i; (0 : ℤ) < i → i < n → -(2147483648 : ℤ) ≤ x ∧ x ≤ (2147483647 : ℤ)
end Axiomatic1

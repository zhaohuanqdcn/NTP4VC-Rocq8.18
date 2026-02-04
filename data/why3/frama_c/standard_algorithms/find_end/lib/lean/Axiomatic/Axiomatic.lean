import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.find_end.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace Axiomatic
noncomputable def p_equalranges_1' (mint_0 : Memory.addr -> ℤ) (mint_1 : Memory.addr -> ℤ) (a : Memory.addr) (n : ℤ) (b : Memory.addr) := ∀(i : ℤ), (0 : ℤ) ≤ i → i < n → mint_1 (Memory.shift a i) = mint_0 (Memory.shift b i)
noncomputable def p_hassubrange_1' (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (f : ℤ) (l : ℤ) (b : Memory.addr) (n : ℤ) := ∃(i : ℤ), f ≤ i ∧ n + i ≤ l ∧ p_equalranges_1' mint_0 mint_0 (Memory.shift a i) n b
end Axiomatic

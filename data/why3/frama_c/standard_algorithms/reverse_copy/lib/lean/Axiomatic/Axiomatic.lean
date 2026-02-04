import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.reverse_copy.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace Axiomatic
noncomputable def p_reverse_1' (mint_0 : Memory.addr -> ℤ) (mint_1 : Memory.addr -> ℤ) (a : Memory.addr) (n : ℤ) (b : Memory.addr) := ∀(i : ℤ), (0 : ℤ) ≤ i → i < n → mint_0 (Memory.shift b (n - (1 : ℤ) - i)) = mint_1 (Memory.shift a i)
noncomputable def p_reverse_2' (mint_0 : Memory.addr -> ℤ) (mint_1 : Memory.addr -> ℤ) (a : Memory.addr) (m : ℤ) (n : ℤ) (b : Memory.addr) (p : ℤ) := p_reverse_1' mint_0 mint_1 (Memory.shift a m) (n - m) (Memory.shift b p)
noncomputable def p_unchanged_1' (mint_0 : Memory.addr -> ℤ) (mint_1 : Memory.addr -> ℤ) (a : Memory.addr) (m : ℤ) (n : ℤ) := ∀(i : ℤ), let a_1 : Memory.addr := Memory.shift a i; m ≤ i → i < n → mint_1 a_1 = mint_0 a_1
end Axiomatic

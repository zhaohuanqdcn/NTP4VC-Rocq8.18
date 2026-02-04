import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.replace_copy.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace Axiomatic
noncomputable def p_replace_1' (mint_0 : Memory.addr -> ℤ) (mint_1 : Memory.addr -> ℤ) (a : Memory.addr) (n : ℤ) (b : Memory.addr) (v : ℤ) (w : ℤ) := ∀(i : ℤ), let x : ℤ := mint_1 (Memory.shift a i); let x_1 : ℤ := mint_0 (Memory.shift b i); (0 : ℤ) ≤ i → i < n → (x = v → x_1 = w) ∧ (¬x = v → x_1 = x)
noncomputable def p_unchanged_1' (mint_0 : Memory.addr -> ℤ) (mint_1 : Memory.addr -> ℤ) (a : Memory.addr) (m : ℤ) (n : ℤ) := ∀(i : ℤ), let a_1 : Memory.addr := Memory.shift a i; m ≤ i → i < n → mint_1 a_1 = mint_0 a_1
end Axiomatic

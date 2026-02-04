import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.rotate.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace Axiomatic
noncomputable def p_reverse_1' (mint_0 : Memory.addr -> ℤ) (mint_1 : Memory.addr -> ℤ) (a : Memory.addr) (n : ℤ) (b : Memory.addr) := ∀(i : ℤ), (0 : ℤ) ≤ i → i < n → mint_0 (Memory.shift b (n - (1 : ℤ) - i)) = mint_1 (Memory.shift a i)
noncomputable def p_reverse_2' (mint_0 : Memory.addr -> ℤ) (mint_1 : Memory.addr -> ℤ) (a : Memory.addr) (m : ℤ) (n : ℤ) (b : Memory.addr) (p : ℤ) := p_reverse_1' mint_0 mint_1 (Memory.shift a m) (n - m) (Memory.shift b p)
noncomputable def p_reverse_4' (mint_0 : Memory.addr -> ℤ) (mint_1 : Memory.addr -> ℤ) (a : Memory.addr) (m : ℤ) (n : ℤ) (p : ℤ) := p_reverse_2' mint_0 mint_1 a m n a p
noncomputable def p_reverse_5' (mint_0 : Memory.addr -> ℤ) (mint_1 : Memory.addr -> ℤ) (a : Memory.addr) (m : ℤ) (n : ℤ) := p_reverse_4' mint_0 mint_1 a m n m
noncomputable def p_equalranges_1' (mint_0 : Memory.addr -> ℤ) (mint_1 : Memory.addr -> ℤ) (a : Memory.addr) (n : ℤ) (b : Memory.addr) := ∀(i : ℤ), (0 : ℤ) ≤ i → i < n → mint_1 (Memory.shift a i) = mint_0 (Memory.shift b i)
noncomputable def p_equalranges_3' (mint_0 : Memory.addr -> ℤ) (mint_1 : Memory.addr -> ℤ) (a : Memory.addr) (m : ℤ) (n : ℤ) (b : Memory.addr) (p : ℤ) := p_equalranges_1' mint_0 mint_1 (Memory.shift a m) (n - m) (Memory.shift b p)
noncomputable def p_equalranges_4' (mint_0 : Memory.addr -> ℤ) (mint_1 : Memory.addr -> ℤ) (a : Memory.addr) (m : ℤ) (n : ℤ) (p : ℤ) := p_equalranges_3' mint_0 mint_1 a m n a p
end Axiomatic

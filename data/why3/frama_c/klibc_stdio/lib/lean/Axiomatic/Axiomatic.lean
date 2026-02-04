import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace Axiomatic
noncomputable def p_length_of_str_is (malloc_0 : ℤ -> ℤ) (mchar_0 : Memory.addr -> ℤ) (s : Memory.addr) (n : ℤ) := mchar_0 (Memory.shift s n) = (0 : ℤ) ∧ (0 : ℤ) ≤ n ∧ Memory.valid_rw malloc_0 (Memory.shift s (0 : ℤ)) ((1 : ℤ) + n) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i → i < n → ¬mchar_0 (Memory.shift s i) = (0 : ℤ))
end Axiomatic

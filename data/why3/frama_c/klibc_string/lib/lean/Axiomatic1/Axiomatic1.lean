import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.A_Length.A_Length
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace Axiomatic1
noncomputable def p_exists_first_occurence_of_char (malloc_0 : ℤ -> ℤ) (mchar_0 : Memory.addr -> ℤ) (s : Memory.addr) (c : ℤ) (pos_0 : ℤ) := let x : ℤ := Cint.to_sint8 c; let x_1 : ℤ := A_Length.l_length mchar_0 s; mchar_0 (Memory.shift s pos_0) = x ∧ (0 : ℤ) ≤ pos_0 ∧ pos_0 ≤ x_1 ∧ -(128 : ℤ) ≤ c ∧ c ≤ (127 : ℤ) ∧ Memory.valid_rw malloc_0 (Memory.shift s (0 : ℤ)) ((1 : ℤ) + x_1) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i → i < pos_0 → ¬mchar_0 (Memory.shift s i) = x)
noncomputable def p_char_in_str (mchar_0 : Memory.addr -> ℤ) (s : Memory.addr) (c : ℤ) := ∃(i : ℤ), mchar_0 (Memory.shift s i) = c ∧ (0 : ℤ) ≤ i ∧ i < A_Length.l_length mchar_0 s
end Axiomatic1

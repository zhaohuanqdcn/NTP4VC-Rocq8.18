import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
import frama_c.klibc_string.lib.lean.Compound.Compound
import frama_c.klibc_string.lib.lean.A_Length.A_Length
open Classical
open Lean4Why3
namespace strncat_Why3_ide_VCstrncat_complete_smaller_larger_goal0
theorem goal0 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (a_1 : Memory.addr) (i : ℤ) (i_1 : ℤ) (i_2 : ℤ) (t : ℤ -> ℤ) : let x : ℤ := A_Length.l_length t_1 a; let a_2 : Memory.addr := Memory.shift a_1 (0 : ℤ); let x_1 : ℤ := (2 : ℤ) * i; let a_3 : Memory.addr := Memory.shift a (0 : ℤ); let x_2 : ℤ := i + x; (0 : ℤ) ≤ i → (0 : ℤ) ≤ i_1 → i_1 < i → (0 : ℤ) ≤ i_2 → i_2 < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_uint32 i → Axiomatic.p_length_of_str_is t t_1 a_1 i_1 → Axiomatic.p_length_of_str_is t t_1 a_1 i_2 → i < x ∧ Memory.valid_rw t a_2 x_1 ∧ Memory.separated a_3 x_1 a_2 i ∧ (∃(i_3 : ℤ), (0 : ℤ) ≤ i_3 ∧ i_3 < i ∧ Axiomatic.p_length_of_str_is t t_1 a i_3) ∨ x ≤ i ∧ Memory.valid_rw t a_2 x_2 ∧ Memory.separated a_3 x_2 a_2 i ∧ (∃(i_3 : ℤ), (0 : ℤ) ≤ i_3 ∧ i_3 < i ∧ Axiomatic.p_length_of_str_is t t_1 a i_3)
  := sorry
end strncat_Why3_ide_VCstrncat_complete_smaller_larger_goal0

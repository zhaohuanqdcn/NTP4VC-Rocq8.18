import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.contiki_list.lib.lean.Compound.Compound
import frama_c.contiki_list.lib.lean.S1_list.S1_list
import frama_c.contiki_list.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace linked_n_before_last_Why3_ide_VClinked_n_before_last_assert_rte_signed_overflow_5_goal9
theorem goal9 (i : ℤ) (i_1 : ℤ) (i_2 : ℤ) (a : Memory.addr) (a_1 : Memory.addr) (a_2 : Memory.addr) (t_1 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) : let x : ℤ := i + i_1; let x_1 : ℤ := Cint.to_sint32 x; let x_2 : ℤ := i_1 + i_2; (0 : ℤ) < i → (0 : ℤ) < i_2 → (0 : ℤ) ≤ i_1 → (0 : ℤ) ≤ i_2 → i_2 < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → -(2147483647 : ℤ) ≤ i → -(2147483648 : ℤ) ≤ x → x ≤ (2147483647 : ℤ) → -(2147483647 : ℤ) ≤ x_1 → Memory.framed t_1 → Memory.linked t → Cint.is_sint32 i → Cint.is_sint32 i_1 → Cint.is_sint32 i_2 → Cint.is_sint32 (i - (1 : ℤ)) → Memory.valid_rw t (Memory.shift a_2 (0 : ℤ)) (2147483646 : ℤ) → Axiomatic.p_linked_n t t_1 a a_2 i_1 i a_1 → Axiomatic.p_linked_n t t_1 (t_1 (Memory.shift a_2 x_2)) a_2 x_2 (i - (1 : ℤ) - i_2) (t_1 (Memory.shift a_2 (i + i_1 - (1 : ℤ)))) → Memory.valid_rd t (Memory.shift a_2 (Cint.to_sint32 (x_1 - (1 : ℤ)))) (1 : ℤ) → -(2147483647 : ℤ) ≤ i_2
  := sorry
end linked_n_before_last_Why3_ide_VClinked_n_before_last_assert_rte_signed_overflow_5_goal9

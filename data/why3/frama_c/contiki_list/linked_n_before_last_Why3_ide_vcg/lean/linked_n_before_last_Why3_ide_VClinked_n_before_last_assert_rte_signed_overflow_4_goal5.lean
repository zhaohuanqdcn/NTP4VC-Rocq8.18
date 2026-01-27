import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.contiki_list.lib.lean.Compound.Compound
import frama_c.contiki_list.lib.lean.S1_list.S1_list
import frama_c.contiki_list.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace linked_n_before_last_Why3_ide_VClinked_n_before_last_assert_rte_signed_overflow_4_goal5
theorem goal5 (i : ℤ) (i_1 : ℤ) (a : Memory.addr) (a_1 : Memory.addr) (a_2 : Memory.addr) (t_1 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) : let x : ℤ := i + i_1; let x_1 : ℤ := Cint.to_sint32 x; (0 : ℤ) < i → (0 : ℤ) ≤ i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → -(2147483648 : ℤ) ≤ x → x ≤ (2147483647 : ℤ) → -(2147483647 : ℤ) ≤ x_1 → Memory.framed t_1 → Memory.linked t → Cint.is_sint32 i → Cint.is_sint32 i_1 → Memory.valid_rw t (Memory.shift a_2 (0 : ℤ)) (2147483646 : ℤ) → Axiomatic.p_linked_n t t_1 a a_2 i_1 i a_1 → Memory.valid_rd t (Memory.shift a_2 (Cint.to_sint32 (x_1 - (1 : ℤ)))) (1 : ℤ) → -(2147483647 : ℤ) ≤ i
  := sorry
end linked_n_before_last_Why3_ide_VClinked_n_before_last_assert_rte_signed_overflow_4_goal5

import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.contiki_list.lib.lean.Compound.Compound
import frama_c.contiki_list.lib.lean.S1_list.S1_list
import frama_c.contiki_list.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace linked_n_valid_range_Why3_ide_VClinked_n_valid_range_loop_inv_2_preserved_goal3
theorem goal3 (i_1 : ℤ) (i_2 : ℤ) (i : ℤ) (i_3 : ℤ) (a : Memory.addr) (a_2 : Memory.addr) (a_3 : Memory.addr) (t_1 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (a_1 : Memory.addr) : let x : ℤ := i_1 + i_2; i_2 ≤ i → (0 : ℤ) ≤ i_1 → (0 : ℤ) ≤ i_2 → i_2 < i → i_1 ≤ i_3 → i_3 ≤ x → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_3) ≤ (0 : ℤ) → Memory.framed t_1 → Memory.linked t → Cint.is_sint32 i → Cint.is_sint32 i_1 → Cint.is_sint32 i_2 → Cint.is_sint32 ((1 : ℤ) + i_2) → Memory.valid_rw t (Memory.shift a_3 (0 : ℤ)) (2147483646 : ℤ) → Axiomatic.p_linked_n t t_1 a a_3 i_1 i a_2 → Axiomatic.p_linked_n t t_1 a_1 a_3 x (i - i_2) a_2 → (∀(i_4 : ℤ), i_1 ≤ i_4 → i_4 < x → Memory.valid_rw t (t_1 (Memory.shift a_3 i_4)) (4 : ℤ)) → Memory.valid_rw t (t_1 (Memory.shift a_3 i_3)) (4 : ℤ)
  := sorry
end linked_n_valid_range_Why3_ide_VClinked_n_valid_range_loop_inv_2_preserved_goal3

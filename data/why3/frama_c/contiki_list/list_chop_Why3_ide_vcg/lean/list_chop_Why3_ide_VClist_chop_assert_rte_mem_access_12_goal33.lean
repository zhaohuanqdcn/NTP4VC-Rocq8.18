import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.contiki_list.lib.lean.Compound.Compound
import frama_c.contiki_list.lib.lean.S1_list.S1_list
import frama_c.contiki_list.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace list_chop_Why3_ide_VClist_chop_assert_rte_mem_access_12_goal33
theorem goal33 (i_1 : ℤ) (i_2 : ℤ) (t_1 : Memory.addr -> Memory.addr) (a_1 : Memory.addr) (a : Memory.addr) (i : ℤ) (t : ℤ -> ℤ) : let x : ℤ := i_1 + i_2; let a_2 : Memory.addr := t_1 (Memory.shift a_1 x); let a_3 : Memory.addr := Memory.shift a_2 (0 : ℤ); let a_4 : Memory.addr := t_1 a_3; let a_5 : Memory.addr := Memory.shift a_4 (0 : ℤ); let a_6 : Memory.addr := t_1 a_5; let a_7 : Memory.addr := t_1 a; let a_8 : Memory.addr := Memory.shift a_7 (0 : ℤ); let a_9 : Memory.addr := Memory.shift a_1 (0 : ℤ); let x_1 : ℤ := i + i_1; a_6 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → ¬a_6 = a_7 → ¬a_6 = t_1 a_8 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → (2 : ℤ) + i_2 ≤ i → Memory.framed t_1 → Memory.linked t → Cint.is_sint32 i → Cint.is_sint32 i_1 → Cint.is_sint32 i_2 → Memory.valid_rd t a (1 : ℤ) → Memory.valid_rw t a (1 : ℤ) → Memory.valid_rd t a_8 (1 : ℤ) → Memory.valid_rw t a_9 (2147483646 : ℤ) → Memory.separated a (1 : ℤ) a_9 (2147483646 : ℤ) → Memory.separated a_7 (4 : ℤ) a_9 (2147483646 : ℤ) → Memory.valid_rd t a_3 (1 : ℤ) → Memory.valid_rw t a_4 (4 : ℤ) → Memory.valid_rd t a_5 (1 : ℤ) → Axiomatic.p_linked_n t t_1 a_7 a_1 i_1 i a_6 → Axiomatic.p_linked_n t t_1 a_2 a_1 x (i - i_2) a_6 → (∀(i_3 : ℤ), i_1 ≤ i_3 → i_3 < x_1 → Memory.separated a (1 : ℤ) (t_1 (Memory.shift a_1 i_3)) (4 : ℤ)) → (∀(i_3 : ℤ), i_1 ≤ i_3 → i_3 < x_1 → Memory.separated (t_1 (Memory.shift a_1 i_3)) (4 : ℤ) a_9 (2147483646 : ℤ)) → (∀(i_4 : ℤ) (i_3 : ℤ), ¬i_4 = i_3 → i_1 ≤ i_3 → i_1 ≤ i_4 → i_3 < x_1 → i_4 < x_1 → ¬t_1 (Memory.shift a_1 i_4) = t_1 (Memory.shift a_1 i_3)) → (∀(i_4 : ℤ) (i_3 : ℤ), ¬i_4 = i_3 → i_1 ≤ i_3 → i_1 ≤ i_4 → i_3 < x_1 → i_4 < x_1 → Memory.separated (t_1 (Memory.shift a_1 i_4)) (4 : ℤ) (t_1 (Memory.shift a_1 i_3)) (4 : ℤ)) → Memory.valid_rd t (Memory.shift a_1 (Cint.to_sint32 (Cint.to_sint32 x_1 - (1 : ℤ)))) (1 : ℤ)
  := sorry
end list_chop_Why3_ide_VClist_chop_assert_rte_mem_access_12_goal33

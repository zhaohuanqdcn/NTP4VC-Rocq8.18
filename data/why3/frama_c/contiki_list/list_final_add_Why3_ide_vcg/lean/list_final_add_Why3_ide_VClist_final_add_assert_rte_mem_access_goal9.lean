import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.contiki_list.lib.lean.Compound.Compound
import frama_c.contiki_list.lib.lean.S1_list.S1_list
import Why3.Cint.Cint
import frama_c.contiki_list.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace list_final_add_Why3_ide_VClist_final_add_assert_rte_mem_access_goal9
theorem goal9 (i : ℤ) (i_1 : ℤ) (a_3 : Memory.addr) (t_1 : Memory.addr -> Memory.addr) (a : Memory.addr) (a_1 : Memory.addr) (a_2 : Memory.addr) (t : ℤ -> ℤ) : let x : ℤ := i + i_1; let a_4 : Memory.addr := Memory.shift a_3 (0 : ℤ); let a_5 : Memory.addr := t_1 a; t_1 (Memory.shift a_1 (0 : ℤ)) = Memory.addr.mk (0 : ℤ) (0 : ℤ) → (0 : ℤ) < x → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_3) ≤ (0 : ℤ) → x ≤ (2147483645 : ℤ) → Memory.framed t_1 → Memory.linked t → Cint.is_sint32 i → Cint.is_sint32 i_1 → Memory.valid_rw t a (1 : ℤ) → Memory.valid_rw t a_1 (4 : ℤ) → Memory.valid_rw t a_2 (4 : ℤ) → Memory.separated a (1 : ℤ) a_1 (4 : ℤ) → Memory.separated a (1 : ℤ) a_2 (4 : ℤ) → Memory.separated a_2 (4 : ℤ) a_1 (4 : ℤ) → Memory.valid_rw t a_4 (2147483646 : ℤ) → Memory.separated a (1 : ℤ) a_4 (2147483646 : ℤ) → Memory.separated a_1 (4 : ℤ) a_4 (2147483646 : ℤ) → Memory.separated a_5 (4 : ℤ) a_4 (2147483646 : ℤ) → Axiomatic.p_linked_n t t_1 a_5 a_3 i_1 (i - (1 : ℤ)) a_2 → Axiomatic.p_linked_n t t_1 a_2 a_3 (i + i_1 - (1 : ℤ)) (1 : ℤ) (t_1 (Memory.shift a_2 (0 : ℤ))) → (∀(i_2 : ℤ), i_1 ≤ i_2 → i_2 < x → Memory.separated a (1 : ℤ) (t_1 (Memory.shift a_3 i_2)) (4 : ℤ)) → (∀(i_2 : ℤ), i_1 ≤ i_2 → i_2 < x → Memory.separated a_1 (4 : ℤ) (t_1 (Memory.shift a_3 i_2)) (4 : ℤ)) → (∀(i_2 : ℤ), i_1 ≤ i_2 → i_2 < x → Memory.separated (t_1 (Memory.shift a_3 i_2)) (4 : ℤ) a_4 (2147483646 : ℤ)) → (∀(i_3 : ℤ) (i_2 : ℤ), ¬i_3 = i_2 → i_1 ≤ i_2 → i_1 ≤ i_3 → i_2 < x → i_3 < x → ¬t_1 (Memory.shift a_3 i_3) = t_1 (Memory.shift a_3 i_2)) → (∀(i_3 : ℤ) (i_2 : ℤ), ¬i_3 = i_2 → i_1 ≤ i_2 → i_1 ≤ i_3 → i_2 < x → i_3 < x → Memory.separated (t_1 (Memory.shift a_3 i_3)) (4 : ℤ) (t_1 (Memory.shift a_3 i_2)) (4 : ℤ)) → Memory.valid_rw t (Memory.shift a_3 (Cint.to_sint32 x)) (1 : ℤ)
  := sorry
end list_final_add_Why3_ide_VClist_final_add_assert_rte_mem_access_goal9

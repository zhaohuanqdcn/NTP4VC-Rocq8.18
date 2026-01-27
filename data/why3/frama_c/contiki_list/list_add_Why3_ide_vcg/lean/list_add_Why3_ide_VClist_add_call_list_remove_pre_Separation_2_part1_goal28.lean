import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.contiki_list.lib.lean.A_Index_of_item.A_Index_of_item
import frama_c.contiki_list.lib.lean.Compound.Compound
import frama_c.contiki_list.lib.lean.S1_list.S1_list
import Why3.Cint.Cint
import frama_c.contiki_list.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace list_add_Why3_ide_VClist_add_call_list_remove_pre_Separation_2_part1_goal28
theorem goal28 (i_1 : ℤ) (i : ℤ) (a_2 : Memory.addr) (t_1 : Memory.addr -> Memory.addr) (a : Memory.addr) (i_3 : ℤ) (i_2 : ℤ) (a_1 : Memory.addr) (t : ℤ -> ℤ) : let x : ℤ := i_1 - i; let a_3 : Memory.addr := Memory.shift a_2 (0 : ℤ); let a_4 : Memory.addr := t_1 a; ¬i_3 = i_2 → A_Index_of_item.l_index_of t_1 a_1 a_2 x i_1 = i_1 → (0 : ℤ) ≤ i → i ≤ i_1 → i_2 < i_1 → i_3 < i_1 → i_1 ≤ i + i_2 → i_1 ≤ i + i_3 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → i ≤ (2147483645 : ℤ) → i_1 ≤ (2147483645 : ℤ) → i_1 ≤ (2147483645 : ℤ) + i → Memory.framed t_1 → Memory.linked t → Cint.is_sint32 i → Cint.is_sint32 i_1 → Memory.valid_rw t a (1 : ℤ) → Memory.valid_rw t a_1 (4 : ℤ) → Memory.separated a (1 : ℤ) a_1 (4 : ℤ) → Cint.is_sint32 x → Memory.valid_rw t a_3 (2147483646 : ℤ) → Memory.separated a (1 : ℤ) a_3 (2147483646 : ℤ) → Memory.separated a_1 (4 : ℤ) a_3 (2147483646 : ℤ) → Memory.separated a_4 (4 : ℤ) a_3 (2147483646 : ℤ) → Memory.valid_rw t (Memory.shift a_2 x) i → Axiomatic.p_linked_n t t_1 a_4 a_2 x i (Memory.addr.mk (0 : ℤ) (0 : ℤ)) → (∀(i_4 : ℤ), i_4 < i_1 → i_1 ≤ i_4 + i → Cint.is_sint32 i_4 → ¬t_1 (Memory.shift a_2 i_4) = a_1) → (∀(i_4 : ℤ), i_4 < i_1 → i_1 ≤ i_4 + i → Memory.separated a (1 : ℤ) (t_1 (Memory.shift a_2 i_4)) (4 : ℤ)) → (∀(i_4 : ℤ), i_4 < i_1 → i_1 ≤ i_4 + i → Memory.separated (t_1 (Memory.shift a_2 i_4)) (4 : ℤ) a_3 (2147483646 : ℤ)) → (∀(i_4 : ℤ), let a_5 : Memory.addr := t_1 (Memory.shift a_2 i_4); ¬a_5 = a_1 → i_4 < i_1 → i_1 ≤ i_4 + i → Memory.separated a_1 (4 : ℤ) a_5 (4 : ℤ)) → (∀(i_5 : ℤ) (i_4 : ℤ), ¬i_5 = i_4 → i_4 < i_1 → i_5 < i_1 → i_1 ≤ i_4 + i → i_1 ≤ i_5 + i → ¬t_1 (Memory.shift a_2 i_5) = t_1 (Memory.shift a_2 i_4)) → (∀(i_5 : ℤ) (i_4 : ℤ), ¬i_5 = i_4 → i_4 < i_1 → i_5 < i_1 → i_1 ≤ i_4 + i → i_1 ≤ i_5 + i → Memory.separated (t_1 (Memory.shift a_2 i_5)) (4 : ℤ) (t_1 (Memory.shift a_2 i_4)) (4 : ℤ)) → Memory.separated (t_1 (Memory.shift a_2 i_3)) (4 : ℤ) (t_1 (Memory.shift a_2 i_2)) (4 : ℤ)
  := sorry
end list_add_Why3_ide_VClist_add_call_list_remove_pre_Separation_2_part1_goal28

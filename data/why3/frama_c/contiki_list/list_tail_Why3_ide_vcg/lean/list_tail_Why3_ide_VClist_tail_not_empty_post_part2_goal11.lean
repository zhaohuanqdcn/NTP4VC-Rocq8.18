import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.contiki_list.lib.lean.Compound.Compound
import frama_c.contiki_list.lib.lean.S1_list.S1_list
import frama_c.contiki_list.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace list_tail_Why3_ide_VClist_tail_not_empty_post_part2_goal11
theorem goal11 (i_1 : ℤ) (i_2 : ℤ) (t_1 : Memory.addr -> Memory.addr) (a_1 : Memory.addr) (a : Memory.addr) (i : ℤ) (t : ℤ -> ℤ) : let x : ℤ := i_1 + i_2; let a_2 : Memory.addr := t_1 (Memory.shift a_1 x); let a_3 : Memory.addr := t_1 (Memory.shift a_2 (0 : ℤ)); let a_4 : Memory.addr := t_1 a; a_3 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → ¬a_3 = a_4 → (0 : ℤ) ≤ i_2 → i_2 < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.framed t_1 → Memory.linked t → Cint.is_sint32 i → Cint.is_sint32 i_1 → Cint.is_sint32 i_2 → Memory.valid_rw t a (1 : ℤ) → Memory.valid_rw t (Memory.shift a_1 (0 : ℤ)) (2147483646 : ℤ) → Axiomatic.p_linked_n t t_1 a_4 a_1 i_1 i_2 a_2 → Axiomatic.p_linked_n t t_1 a_4 a_1 i_1 i a_3 → Axiomatic.p_linked_n t t_1 a_2 a_1 x (i - i_2) a_3 → t_1 (Memory.shift a_1 (i + i_1 - (1 : ℤ))) = a_2
  := sorry
end list_tail_Why3_ide_VClist_tail_not_empty_post_part2_goal11

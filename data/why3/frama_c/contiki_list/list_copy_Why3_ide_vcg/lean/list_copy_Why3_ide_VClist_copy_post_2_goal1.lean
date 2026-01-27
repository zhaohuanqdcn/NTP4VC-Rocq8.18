import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.contiki_list.lib.lean.Compound.Compound
import frama_c.contiki_list.lib.lean.S1_list.S1_list
import frama_c.contiki_list.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace list_copy_Why3_ide_VClist_copy_post_2_goal1
theorem goal1 (a_2 : Memory.addr) (t_1 : Memory.addr -> Memory.addr) (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (i_1 : ℤ) : let a_3 : Memory.addr := Memory.shift a_2 (0 : ℤ); let a_4 : Memory.addr := t_1 a; let m : Memory.addr -> Memory.addr := Function.update t_1 a_1 a_4; Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.framed t_1 → Memory.linked t → Cint.is_sint32 i → Cint.is_sint32 i_1 → Memory.valid_rw t a (1 : ℤ) → Memory.valid_rw t a_1 (1 : ℤ) → Memory.valid_rw t a_3 (2147483646 : ℤ) → Memory.separated a_1 (1 : ℤ) a_3 (2147483646 : ℤ) → Memory.separated (t_1 a_1) (4 : ℤ) a_3 (2147483646 : ℤ) → Axiomatic.p_linked_n t t_1 a_4 a_2 i_1 i (Memory.addr.mk (0 : ℤ) (0 : ℤ)) → (∀(i_2 : ℤ), i_1 ≤ i_2 → i_2 < i + i_1 → Memory.separated a_1 (1 : ℤ) (t_1 (Memory.shift a_2 i_2)) (4 : ℤ)) → Axiomatic.p_linked_n t m (m a) a_2 i_1 i (Memory.addr.mk (0 : ℤ) (0 : ℤ))
  := sorry
end list_copy_Why3_ide_VClist_copy_post_2_goal1

import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.contiki_list.lib.lean.Compound.Compound
import frama_c.contiki_list.lib.lean.S1_list.S1_list
import frama_c.contiki_list.lib.lean.Axiomatic.Axiomatic
import frama_c.contiki_list.lib.lean.Axiomatic1.Axiomatic1
open Classical
open Lean4Why3
namespace list_pop_Why3_ide_VClist_pop_empty_post_3_part2_goal10
theorem goal10 (t_2 : Memory.addr -> Memory.addr) (a : Memory.addr) (a_1 : Memory.addr) (i : ℤ) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℝ) : let a_2 : Memory.addr := t_2 a; let a_3 : Memory.addr := Memory.shift a_1 (0 : ℤ); a_2 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → (0 : ℤ) ≤ i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.framed t_2 → Memory.linked t → Cint.is_sint32 i → Memory.valid_rw t a (1 : ℤ) → Memory.valid_rw t a_3 (2147483646 : ℤ) → Memory.separated a (1 : ℤ) a_3 (2147483646 : ℤ) → Memory.separated a_2 (4 : ℤ) a_3 (2147483646 : ℤ) → Axiomatic.p_linked_n t t_2 a_2 a_1 i (0 : ℤ) a_2 → Axiomatic1.p_unchanged t t_2 t_1 t t_2 t_1 a_1 i i
  := sorry
end list_pop_Why3_ide_VClist_pop_empty_post_3_part2_goal10

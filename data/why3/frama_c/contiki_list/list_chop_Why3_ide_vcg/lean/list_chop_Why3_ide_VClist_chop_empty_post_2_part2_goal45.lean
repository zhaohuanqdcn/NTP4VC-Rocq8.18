import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.contiki_list.lib.lean.Compound.Compound
import frama_c.contiki_list.lib.lean.S1_list.S1_list
import frama_c.contiki_list.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace list_chop_Why3_ide_VClist_chop_empty_post_2_part2_goal45
theorem goal45 (t_1 : Memory.addr -> Memory.addr) (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) (i : ℤ) : let a_2 : Memory.addr := t_1 a; let a_3 : Memory.addr := t_1 (Memory.shift a_2 (0 : ℤ)); let a_4 : Memory.addr := Memory.shift a_1 (0 : ℤ); a_3 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → ¬a_3 = a_2 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.framed t_1 → Memory.linked t → Cint.is_sint32 i → Memory.valid_rw t a (1 : ℤ) → Memory.valid_rw t a_4 (2147483646 : ℤ) → Memory.separated a (1 : ℤ) a_4 (2147483646 : ℤ) → Memory.separated a_2 (4 : ℤ) a_4 (2147483646 : ℤ) → ¬Axiomatic.p_linked_n t t_1 a_2 a_1 i (0 : ℤ) a_3
  := sorry
end list_chop_Why3_ide_VClist_chop_empty_post_2_part2_goal45

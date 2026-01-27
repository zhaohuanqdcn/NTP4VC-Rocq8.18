import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.contiki_list.lib.lean.Compound.Compound
import frama_c.contiki_list.lib.lean.S1_list.S1_list
import Why3.Cint.Cint
import frama_c.contiki_list.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace array_push_Why3_ide_VCarray_push_post_StillLinked_part1_goal9
theorem goal9 (a_3 : Memory.addr) (a : Memory.addr) (a_1 : Memory.addr) (a_2 : Memory.addr) (i : ℤ) (t_1 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) : let a_4 : Memory.addr := Memory.shift a_3 (0 : ℤ); Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_3) ≤ (0 : ℤ) → i ≤ (2147483645 : ℤ) → Memory.framed t_1 → Memory.linked t → Cint.is_sint32 i → Memory.valid_rw t a_1 (1 : ℤ) → Memory.valid_rw t a_4 (2147483646 : ℤ) → Memory.separated a_1 (1 : ℤ) a_4 (2147483646 : ℤ) → Memory.separated (t_1 a_1) (4 : ℤ) a_4 (2147483646 : ℤ) → Axiomatic.p_linked_n t t_1 a a_3 i (0 : ℤ) a_2 → Axiomatic.p_linked_n t t_1 a a_3 ((1 : ℤ) + i) (0 : ℤ) a_2
  := sorry
end array_push_Why3_ide_VCarray_push_post_StillLinked_part1_goal9

import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.contiki_list.lib.lean.Compound.Compound
import frama_c.contiki_list.lib.lean.S1_list.S1_list
import Why3.Cint.Cint
import frama_c.contiki_list.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace linked_n_split_segment_right_Why3_ide_VClinked_n_split_segment_right_post_2_goal1
theorem goal1 (t_1 : Memory.addr -> Memory.addr) (a_2 : Memory.addr) (i : ℤ) (i_1 : ℤ) (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) : let a_3 : Memory.addr := t_1 (Memory.shift (t_1 (Memory.shift a_2 (i + i_1 - (1 : ℤ)))) (0 : ℤ)); (0 : ℤ) < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_3) ≤ (0 : ℤ) → Memory.framed t_1 → Memory.linked t → Cint.is_sint32 i → Cint.is_sint32 i_1 → Memory.valid_rw t (Memory.shift a_2 (0 : ℤ)) (2147483646 : ℤ) → Axiomatic.p_linked_n t t_1 a a_2 i_1 ((1 : ℤ) + i) a_1 → Axiomatic.p_linked_n t t_1 a_3 a_2 (i + i_1) (1 : ℤ) a_1
  := sorry
end linked_n_split_segment_right_Why3_ide_VClinked_n_split_segment_right_post_2_goal1

import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.contiki_list.lib.lean.Axiomatic.Axiomatic
import frama_c.contiki_list.lib.lean.Compound.Compound
import frama_c.contiki_list.lib.lean.S1_list.S1_list
open Classical
open Lean4Why3
namespace linked_n_starting_from_null_empty_Why3_ide_VClinked_n_starting_from_null_empty_post_goal0
theorem goal0 (a : Memory.addr) (t_1 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (i_1 : ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.framed t_1) (fact2 : Memory.linked t) (fact3 : Cint.is_sint32 i) (fact4 : Cint.is_sint32 i_1) (fact5 : Axiomatic.p_linked_n t t_1 (Memory.addr.mk (0 : ℤ) (0 : ℤ)) a i_1 i (Memory.addr.mk (0 : ℤ) (0 : ℤ))) : i = (0 : ℤ)
  := sorry
end linked_n_starting_from_null_empty_Why3_ide_VClinked_n_starting_from_null_empty_post_goal0

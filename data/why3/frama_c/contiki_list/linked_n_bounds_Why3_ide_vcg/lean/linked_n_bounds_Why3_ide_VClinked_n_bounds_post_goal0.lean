import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.contiki_list.lib.lean.Axiomatic.Axiomatic
import frama_c.contiki_list.lib.lean.Compound.Compound
import frama_c.contiki_list.lib.lean.S1_list.S1_list
open Classical
open Lean4Why3
namespace linked_n_bounds_Why3_ide_VClinked_n_bounds_post_goal0
theorem goal0 (a : Memory.addr) (a_1 : Memory.addr) (a_2 : Memory.addr) (t_1 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (i_1 : ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact2 : Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ)) (fact3 : Memory.framed t_1) (fact4 : Memory.linked t) (fact5 : Cint.is_sint32 i) (fact6 : Cint.is_sint32 i_1) (fact7 : Axiomatic.p_linked_n t t_1 a a_2 i_1 i a_1) : i = (0 : ℤ) ∧ (0 : ℤ) ≤ i_1 ∧ i_1 ≤ (2147483646 : ℤ) ∨ (0 : ℤ) < i ∧ (0 : ℤ) ≤ i_1 ∧ i_1 ≤ (2147483645 : ℤ)
  := sorry
end linked_n_bounds_Why3_ide_VClinked_n_bounds_post_goal0

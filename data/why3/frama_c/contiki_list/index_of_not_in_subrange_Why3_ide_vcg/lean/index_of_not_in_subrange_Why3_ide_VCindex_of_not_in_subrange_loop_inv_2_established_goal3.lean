import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.contiki_list.lib.lean.Compound.Compound
import frama_c.contiki_list.lib.lean.S1_list.S1_list
open Classical
open Lean4Why3
namespace index_of_not_in_subrange_Why3_ide_VCindex_of_not_in_subrange_loop_inv_2_established_goal3
theorem goal3 (t : Memory.addr -> Memory.addr) (a : Memory.addr) (i_2 : ℤ) (i : ℤ) (i_1 : ℤ) : let a_1 : Memory.addr := t (Memory.shift a i_2); (0 : ℤ) ≤ i → (0 : ℤ) ≤ i_2 → i_2 < i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.framed t → Cint.is_sint32 i → Cint.is_sint32 i_1 → Cint.is_sint32 i_2 → ¬(∀(i_3 : ℤ), i_3 < i_1 → i_2 ≤ i_3 → ¬a_1 = t (Memory.shift a i_3))
  := sorry
end index_of_not_in_subrange_Why3_ide_VCindex_of_not_in_subrange_loop_inv_2_established_goal3

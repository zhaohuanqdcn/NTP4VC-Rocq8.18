import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.contiki_list.lib.lean.Compound.Compound
import frama_c.contiki_list.lib.lean.S1_list.S1_list
open Classical
open Lean4Why3
namespace index_of_Why3_ide_VCindex_of_loop_inv_2_preserved_goal4
theorem goal4 (t_1 : Memory.addr -> Memory.addr) (a : Memory.addr) (i_2 : ℤ) (i_1 : ℤ) (i : ℤ) (i_3 : ℤ) (t : ℤ -> ℤ) : let a_1 : Memory.addr := t_1 (Memory.shift a i_2); ¬a_1 = t_1 (Memory.shift a i_1) → (0 : ℤ) ≤ i → i_1 ≤ i → i_1 < i → i_2 ≤ i_1 → i_3 ≤ i_1 → i_3 ≤ i_2 → (0 : ℤ) ≤ i_3 → i_3 < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.framed t_1 → Memory.linked t → Cint.is_sint32 i → Cint.is_sint32 i_1 → Cint.is_sint32 i_2 → Cint.is_sint32 i_3 → Cint.is_sint32 ((1 : ℤ) + i_1) → (i_3 ≤ i → Memory.valid_rw t (Memory.shift a i_3) (i - i_3)) → ¬(∀(i_4 : ℤ), i_4 < i_1 → i_3 ≤ i_4 → ¬a_1 = t_1 (Memory.shift a i_4))
  := sorry
end index_of_Why3_ide_VCindex_of_loop_inv_2_preserved_goal4

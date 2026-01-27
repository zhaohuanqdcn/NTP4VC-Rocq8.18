import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.contiki_list.lib.lean.Compound.Compound
import frama_c.contiki_list.lib.lean.S1_list.S1_list
open Classical
open Lean4Why3
namespace index_of_Why3_ide_VCindex_of_loop_inv_preserved_part1_goal3
theorem goal3 (i_1 : ℤ) (t_1 : Memory.addr -> Memory.addr) (a_1 : Memory.addr) (a : Memory.addr) (i : ℤ) (i_2 : ℤ) (t : ℤ -> ℤ) : let x : ℤ := (1 : ℤ) + i_1; ¬t_1 (Memory.shift a_1 i_1) = a → (0 : ℤ) ≤ i → i_1 ≤ i → i_1 < i → i_2 ≤ i_1 → (0 : ℤ) ≤ i_2 → i_2 < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.framed t_1 → Memory.linked t → Cint.is_sint32 i → Cint.is_sint32 i_1 → Cint.is_sint32 i_2 → Cint.is_sint32 x → (i_2 ≤ i → Memory.valid_rw t (Memory.shift a_1 i_2) (i - i_2)) → (∀(i_3 : ℤ), i_3 < i_1 → i_2 ≤ i_3 → ¬t_1 (Memory.shift a_1 i_3) = a) → i_2 ≤ x
  := sorry
end index_of_Why3_ide_VCindex_of_loop_inv_preserved_part1_goal3

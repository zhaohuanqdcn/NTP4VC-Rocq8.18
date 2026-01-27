import Why3.Base
import Why3.Qed.Qed
import frama_c.contiki_memb.lib.lean.Axiomatic13.Axiomatic13
import Why3.Memory.Memory
import frama_c.contiki_memb.lib.lean.Compound.Compound
import frama_c.contiki_memb.lib.lean.A_OccArray.A_OccArray
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace occ_a_split_Why3_ide_VCocc_a_split_loop_inv_preserved_goal0
theorem goal0 (i_1 : ℤ) (t : Memory.addr -> ℤ) (i_3 : ℤ) (a : Memory.addr) (i_2 : ℤ) (i_4 : ℤ) (i : ℤ) : let x : ℤ := (1 : ℤ) + i_1; A_OccArray.l_occ_a t i_3 a i_2 i_4 + A_OccArray.l_occ_a t i_3 a i_4 i_1 = A_OccArray.l_occ_a t i_3 a i_2 i_1 → i_1 ≤ i → i_4 ≤ i → i_1 < i → i_4 ≤ i_1 → i_2 ≤ i_4 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → i_1 ≤ (2147483646 : ℤ) → Memory.sconst t → Cint.is_sint32 i → Cint.is_sint32 i_1 → Cint.is_sint32 i_2 → Cint.is_sint32 i_3 → Cint.is_sint32 i_4 → Cint.is_sint32 x → i_4 ≤ x
  := sorry
end occ_a_split_Why3_ide_VCocc_a_split_loop_inv_preserved_goal0

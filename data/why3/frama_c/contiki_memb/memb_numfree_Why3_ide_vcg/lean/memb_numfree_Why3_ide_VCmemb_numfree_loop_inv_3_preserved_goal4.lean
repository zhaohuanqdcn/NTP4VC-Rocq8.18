import Why3.Base
import Why3.Qed.Qed
import frama_c.contiki_memb.lib.lean.Axiomatic13.Axiomatic13
import Why3.Memory.Memory
import frama_c.contiki_memb.lib.lean.Compound.Compound
import frama_c.contiki_memb.lib.lean.A_OccArray.A_OccArray
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace memb_numfree_Why3_ide_VCmemb_numfree_loop_inv_3_preserved_goal4
theorem goal4 (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_3 : Memory.addr -> Memory.addr) (t_2 : Memory.addr -> ℤ) (i_2 : ℤ) (t : ℤ -> ℤ) (i : ℤ) (i_1 : ℤ) : let a_1 : Memory.addr := Memory.shift a (1 : ℤ); let x : ℤ := t_1 a_1; let a_2 : Memory.addr := Memory.shift a (2 : ℤ); let a_3 : Memory.addr := t_3 a_2; let x_1 : ℤ := A_OccArray.l_occ_a t_2 (0 : ℤ) a_3 (0 : ℤ) i_2; let x_2 : ℤ := (1 : ℤ) + i_2; let a_4 : Memory.addr := Memory.shift a_3 i_2; let x_3 : ℤ := t_2 a_4; (0 : ℤ) ≤ i_2 → i_2 < x → i_2 ≤ x → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → x_1 ≤ i_2 → i_2 ≤ (2147483646 : ℤ) → Memory.framed t_3 → Memory.linked t → Memory.sconst t_2 → Cint.is_sint32 i → Cint.is_sint32 i_1 → Cint.is_sint32 i_2 → Cint.is_uint16 x → Cint.is_sint32 x_2 → Axiomatic13.p_valid_memb t t_3 t_1 a → Memory.valid_rd t a_2 (1 : ℤ) → Memory.valid_rd t a_1 (1 : ℤ) → Cint.is_sint8 x_3 → Memory.valid_rd t a_4 (1 : ℤ) → Cint.is_sint32 x_1 → (if x_3 = (0 : ℤ) then (1 : ℤ) + i = i_1 ∧ x_1 = i ∧ i ≤ (2147483646 : ℤ) else x_1 = i_1) → A_OccArray.l_occ_a t_2 (0 : ℤ) a_3 (0 : ℤ) x_2 = i_1
  := sorry
end memb_numfree_Why3_ide_VCmemb_numfree_loop_inv_3_preserved_goal4

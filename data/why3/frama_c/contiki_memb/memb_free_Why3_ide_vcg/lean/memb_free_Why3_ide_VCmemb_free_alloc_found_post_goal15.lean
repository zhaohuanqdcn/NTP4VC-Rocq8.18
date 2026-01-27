import Why3.Base
import Why3.Qed.Qed
import frama_c.contiki_memb.lib.lean.Axiomatic13.Axiomatic13
import Why3.Memory.Memory
import frama_c.contiki_memb.lib.lean.Compound.Compound
import frama_c.contiki_memb.lib.lean.A_OccArray.A_OccArray
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace memb_free_Why3_ide_VCmemb_free_alloc_found_post_goal15
theorem goal15 (a_1 : Memory.addr) (t_2 : Memory.addr -> ℤ) (t_5 : Memory.addr -> Memory.addr) (i_1 : ℤ) (i : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) (t_4 : Memory.addr -> ℤ) (t_1 : ℤ -> ℤ) (t_3 : Memory.addr -> ℤ) : let a_2 : Memory.addr := Memory.shift a_1 (1 : ℤ); let x : ℤ := t_2 a_2; let a_3 : Memory.addr := Memory.shift a_1 (3 : ℤ); let a_4 : Memory.addr := Memory.shift a_1 (2 : ℤ); let a_5 : Memory.addr := Memory.shift (t_5 a_4) i_1; Axiomatic13.l__memb_index t_5 t_2 a_1 (Axiomatic13.l__memb_ptr t_5 t_2 a_1 i) = i → (0 : ℤ) ≤ i → i ≤ x → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.framed t_5 → Memory.linked t → Memory.sconst t_4 → Cint.is_sint32 i → Cint.is_sint32 i_1 → Cint.is_uint16 x → Axiomatic13.p_valid_memb t t_5 t_2 a_1 → Axiomatic13.p__memb_has t_5 t_2 a_1 a → Memory.valid_rd t a_3 (1 : ℤ) → Memory.valid_rd t a_2 (1 : ℤ) → Axiomatic13.p__memb_allocated t_5 t_4 t_2 a_1 a → (if i < x then i_1 = i ∧ t_1 = t ∧ Axiomatic13.l__memb_ptr t_5 t_2 a_1 i_1 = a ∧ Function.update t_4 a_5 (0 : ℤ) = t_3 ∧ Memory.valid_rd t_1 a_4 (1 : ℤ) ∧ Memory.valid_rd t_1 a_5 (1 : ℤ) ∧ Memory.valid_rw t_1 a_5 (1 : ℤ) else t_4 = t_3) → (∀(i_2 : ℤ), (0 : ℤ) ≤ i_2 → i_2 < i → ¬Memory.shift (t_5 a_3) (i_2 * t_2 (Memory.shift a_1 (0 : ℤ))) = a) → ¬Axiomatic13.p__memb_allocated t_5 t_3 t_2 a_1 a
  := sorry
end memb_free_Why3_ide_VCmemb_free_alloc_found_post_goal15

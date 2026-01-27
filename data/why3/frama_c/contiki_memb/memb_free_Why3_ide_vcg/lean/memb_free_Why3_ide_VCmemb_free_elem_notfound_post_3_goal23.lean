import Why3.Base
import Why3.Qed.Qed
import frama_c.contiki_memb.lib.lean.Axiomatic13.Axiomatic13
import Why3.Memory.Memory
import frama_c.contiki_memb.lib.lean.Compound.Compound
import frama_c.contiki_memb.lib.lean.A_OccArray.A_OccArray
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace memb_free_Why3_ide_VCmemb_free_elem_notfound_post_3_goal23
theorem goal23 (t_3 : Memory.addr -> Memory.addr) (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (i : ℤ) (t : ℤ -> ℤ) (t_2 : Memory.addr -> ℤ) : let a_1 : Memory.addr := Axiomatic13.l__memb_ptr t_3 t_1 a i; let a_2 : Memory.addr := Memory.shift a (1 : ℤ); let x : ℤ := t_1 a_2; let a_3 : Memory.addr := Memory.shift a (2 : ℤ); let a_4 : Memory.addr := Memory.shift a (3 : ℤ); let a_5 : Memory.addr := Memory.shift (t_3 a_3) i; Axiomatic13.l__memb_index t_3 t_1 a a_1 = i → (0 : ℤ) ≤ i → i < x → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.framed t_3 → Memory.linked t → Memory.sconst t_2 → Cint.is_sint32 i → Cint.is_uint16 x → Axiomatic13.p_valid_memb t t_3 t_1 a → Memory.valid_rd t a_3 (1 : ℤ) → Memory.valid_rd t a_4 (1 : ℤ) → Memory.valid_rd t a_2 (1 : ℤ) → Cint.is_sint8 (t_2 a_5) → Memory.valid_rd t a_5 (1 : ℤ) → Memory.valid_rw t a_5 (1 : ℤ) → ¬Axiomatic13.p__memb_has t_3 t_1 a a_1 → ¬(∀(i_1 : ℤ), (0 : ℤ) ≤ i_1 → i_1 < i → ¬Memory.shift (t_3 a_4) (i_1 * t_1 (Memory.shift a (0 : ℤ))) = a_1)
  := sorry
end memb_free_Why3_ide_VCmemb_free_elem_notfound_post_3_goal23

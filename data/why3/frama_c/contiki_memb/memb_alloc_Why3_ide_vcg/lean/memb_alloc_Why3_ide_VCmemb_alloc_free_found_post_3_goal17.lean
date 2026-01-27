import Why3.Base
import Why3.Qed.Qed
import frama_c.contiki_memb.lib.lean.Axiomatic13.Axiomatic13
import Why3.Memory.Memory
import frama_c.contiki_memb.lib.lean.Compound.Compound
import frama_c.contiki_memb.lib.lean.A_OccArray.A_OccArray
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace memb_alloc_Why3_ide_VCmemb_alloc_free_found_post_3_goal17
theorem goal17 (a : Memory.addr) (t_4 : Memory.addr -> Memory.addr) (t_1 : Memory.addr -> ℤ) (i_2 : ℤ) (t_2 : Memory.addr -> ℤ) (i : ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) (t_3 : Memory.addr -> ℤ) : let a_1 : Memory.addr := Memory.shift a (2 : ℤ); let a_2 : Memory.addr := t_4 a_1; let a_3 : Memory.addr := Memory.shift a (1 : ℤ); let x : ℤ := t_1 a_3; let a_4 : Memory.addr := Memory.shift a (0 : ℤ); let x_1 : ℤ := t_1 a_4; let a_5 : Memory.addr := Memory.shift a_2 i_2; let x_2 : ℤ := i_2 * x_1; t_2 (Memory.shift a_2 i) = (0 : ℤ) → (0 : ℤ) ≤ i → (0 : ℤ) ≤ i_1 → i < x → i_1 ≤ x → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.framed t_4 → Memory.linked t → Memory.sconst t_2 → Cint.is_sint32 i_1 → Cint.is_sint32 i_2 → Cint.is_uint16 x → Cint.is_uint16 x_1 → Axiomatic13.p_valid_memb t t_4 t_1 a → Memory.valid_rd t a_3 (1 : ℤ) → (if i_1 < x then i_2 = i_1 ∧ t_2 a_5 = (0 : ℤ) ∧ Function.update t_2 a_5 (1 : ℤ) = t_3 ∧ -(2147483648 : ℤ) ≤ x_2 ∧ x_2 ≤ (2147483647 : ℤ) ∧ Memory.valid_rd t a_1 (1 : ℤ) ∧ Memory.valid_rd t (Memory.shift a (3 : ℤ)) (1 : ℤ) ∧ Memory.valid_rd t a_4 (1 : ℤ) ∧ Memory.valid_rd t a_5 (1 : ℤ) ∧ Memory.valid_rw t a_5 (1 : ℤ) else t_3 = t_2) → (∀(i_3 : ℤ), (0 : ℤ) ≤ i_3 → i_3 < i_1 → ¬t_2 (Memory.shift a_2 i_3) = (0 : ℤ)) → (1 : ℤ) + Axiomatic13.l__memb_numfree t_4 t_3 t_1 a = Axiomatic13.l__memb_numfree t_4 t_2 t_1 a
  := sorry
end memb_alloc_Why3_ide_VCmemb_alloc_free_found_post_3_goal17

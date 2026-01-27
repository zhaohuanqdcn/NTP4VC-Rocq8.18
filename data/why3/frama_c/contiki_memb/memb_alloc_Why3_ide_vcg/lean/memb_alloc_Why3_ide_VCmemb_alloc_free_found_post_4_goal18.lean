import Why3.Base
import Why3.Qed.Qed
import frama_c.contiki_memb.lib.lean.Axiomatic13.Axiomatic13
import Why3.Memory.Memory
import frama_c.contiki_memb.lib.lean.Compound.Compound
import frama_c.contiki_memb.lib.lean.A_OccArray.A_OccArray
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace memb_alloc_Why3_ide_VCmemb_alloc_free_found_post_4_goal18
theorem goal18 (a_1 : Memory.addr) (t_4 : Memory.addr -> Memory.addr) (t_1 : Memory.addr -> ℤ) (i_2 : ℤ) (t_2 : Memory.addr -> ℤ) (i : ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) (t_3 : Memory.addr -> ℤ) (a : Memory.addr) : let a_2 : Memory.addr := Memory.shift a_1 (2 : ℤ); let a_3 : Memory.addr := t_4 a_2; let a_4 : Memory.addr := Memory.shift a_1 (1 : ℤ); let x : ℤ := t_1 a_4; let a_5 : Memory.addr := Memory.shift a_1 (0 : ℤ); let x_1 : ℤ := t_1 a_5; let a_6 : Memory.addr := Memory.shift a_3 i_2; let a_7 : Memory.addr := Memory.shift a_1 (3 : ℤ); let x_2 : ℤ := i_2 * x_1; t_2 (Memory.shift a_3 i) = (0 : ℤ) → (0 : ℤ) ≤ i → (0 : ℤ) ≤ i_1 → i < x → i_1 ≤ x → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.framed t_4 → Memory.linked t → Memory.sconst t_2 → Cint.is_sint32 i_1 → Cint.is_sint32 i_2 → Cint.is_uint16 x → Cint.is_uint16 x_1 → Axiomatic13.p_valid_memb t t_4 t_1 a_1 → Memory.valid_rd t a_4 (1 : ℤ) → (if i_1 < x then i_2 = i_1 ∧ t_2 a_6 = (0 : ℤ) ∧ Function.update t_2 a_6 (1 : ℤ) = t_3 ∧ Memory.shift (t_4 a_7) x_2 = a ∧ -(2147483648 : ℤ) ≤ x_2 ∧ x_2 ≤ (2147483647 : ℤ) ∧ Memory.valid_rd t a_2 (1 : ℤ) ∧ Memory.valid_rd t a_7 (1 : ℤ) ∧ Memory.valid_rd t a_5 (1 : ℤ) ∧ Memory.valid_rd t a_6 (1 : ℤ) ∧ Memory.valid_rw t a_6 (1 : ℤ) else t_3 = t_2 ∧ Memory.addr.mk (0 : ℤ) (0 : ℤ) = a) → (∀(i_3 : ℤ), (0 : ℤ) ≤ i_3 → i_3 < i_1 → ¬t_2 (Memory.shift a_3 i_3) = (0 : ℤ)) → Axiomatic13.p__memb_allocated t_4 t_3 t_1 a_1 a
  := sorry
end memb_alloc_Why3_ide_VCmemb_alloc_free_found_post_4_goal18

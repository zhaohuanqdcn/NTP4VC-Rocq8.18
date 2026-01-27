import Why3.Base
import Why3.Qed.Qed
import frama_c.contiki_memb.lib.lean.Axiomatic13.Axiomatic13
import Why3.Memory.Memory
import frama_c.contiki_memb.lib.lean.Compound.Compound
import frama_c.contiki_memb.lib.lean.A_OccArray.A_OccArray
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace memb_free_Why3_ide_VCmemb_free_loop_inv_3_preserved_goal4
theorem goal4 (t_3 : Memory.addr -> Memory.addr) (t_1 : Memory.addr -> ℤ) (a_1 : Memory.addr) (i : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) (t_2 : Memory.addr -> ℤ) : let a_2 : Memory.addr := Axiomatic13.l__memb_ptr t_3 t_1 a_1 i; let a_3 : Memory.addr := Memory.shift a_1 (1 : ℤ); let x : ℤ := t_1 a_3; let a_4 : Memory.addr := Memory.shift a_1 (0 : ℤ); let x_1 : ℤ := t_1 a_4; let x_2 : ℤ := (1 : ℤ) + i; let a_5 : Memory.addr := Memory.shift a_1 (3 : ℤ); ¬a_2 = a → Axiomatic13.l__memb_index t_3 t_1 a_1 a_2 = i → (0 : ℤ) ≤ i → i < x → i ≤ x → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → i ≤ (2147483646 : ℤ) → Memory.framed t_3 → Memory.linked t → Memory.sconst t_2 → Cint.is_sint32 i → Cint.is_uint16 x → Cint.is_uint16 x_1 → Cint.is_sint32 x_2 → Axiomatic13.p_valid_memb t t_3 t_1 a_1 → Memory.valid_rd t a_5 (1 : ℤ) → Memory.valid_rd t a_3 (1 : ℤ) → Memory.valid_rd t a_4 (1 : ℤ) → (∀(i_1 : ℤ), (0 : ℤ) ≤ i_1 → i_1 < i → ¬Memory.shift (t_3 a_5) (i_1 * x_1) = a) → Axiomatic13.l__memb_ptr t_3 t_1 a_1 x_2 = Memory.shift a_2 x_1
  := sorry
end memb_free_Why3_ide_VCmemb_free_loop_inv_3_preserved_goal4

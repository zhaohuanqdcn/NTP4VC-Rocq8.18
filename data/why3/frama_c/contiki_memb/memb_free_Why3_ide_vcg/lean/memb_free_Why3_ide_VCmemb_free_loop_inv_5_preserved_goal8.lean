import Why3.Base
import Why3.Qed.Qed
import frama_c.contiki_memb.lib.lean.Axiomatic13.Axiomatic13
import Why3.Memory.Memory
import frama_c.contiki_memb.lib.lean.Compound.Compound
import frama_c.contiki_memb.lib.lean.A_OccArray.A_OccArray
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace memb_free_Why3_ide_VCmemb_free_loop_inv_5_preserved_goal8
theorem goal8 (a : Memory.addr) (t_3 : Memory.addr -> Memory.addr) (t_1 : Memory.addr -> ℤ) (i_1 : ℤ) (i : ℤ) (t : ℤ -> ℤ) (t_2 : Memory.addr -> ℤ) : let a_1 : Memory.addr := Memory.shift a (3 : ℤ); let a_2 : Memory.addr := t_3 a_1; let a_3 : Memory.addr := Memory.shift a (0 : ℤ); let x : ℤ := t_1 a_3; let x_1 : ℤ := i_1 * x; let a_4 : Memory.addr := Axiomatic13.l__memb_ptr t_3 t_1 a i; let a_5 : Memory.addr := Memory.shift a (1 : ℤ); let x_2 : ℤ := t_1 a_5; ¬Memory.shift a_2 x_1 = a_4 → Axiomatic13.l__memb_index t_3 t_1 a a_4 = i → (0 : ℤ) ≤ i → i_1 ≤ i → (0 : ℤ) ≤ i_1 → i < x_2 → i ≤ x_2 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → i ≤ (2147483646 : ℤ) → Memory.framed t_3 → Memory.linked t → Memory.sconst t_2 → Cint.is_sint32 i → Cint.is_sint32 i_1 → Cint.is_uint16 x_2 → Cint.is_uint16 x → Cint.is_sint32 ((1 : ℤ) + i) → Axiomatic13.p_valid_memb t t_3 t_1 a → Memory.valid_rd t a_1 (1 : ℤ) → Memory.valid_rd t a_5 (1 : ℤ) → Memory.valid_rd t a_3 (1 : ℤ) → ¬(∀(i_2 : ℤ), (0 : ℤ) ≤ i_2 → i_2 < i → ¬x_1 = i_2 * x)
  := sorry
end memb_free_Why3_ide_VCmemb_free_loop_inv_5_preserved_goal8

import Why3.Base
import Why3.Qed.Qed
import frama_c.contiki_memb.lib.lean.Axiomatic13.Axiomatic13
import Why3.Memory.Memory
import frama_c.contiki_memb.lib.lean.Compound.Compound
import frama_c.contiki_memb.lib.lean.A_OccArray.A_OccArray
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace memb_alloc_Why3_ide_VCmemb_alloc_loop_inv_preserved_goal2
theorem goal2 (a : Memory.addr) (t_3 : Memory.addr -> Memory.addr) (i : ℤ) (t_2 : Memory.addr -> ℤ) (t_1 : Memory.addr -> ℤ) (t : ℤ -> ℤ) : let a_1 : Memory.addr := Memory.shift a (2 : ℤ); let a_2 : Memory.addr := t_3 a_1; let a_3 : Memory.addr := Memory.shift a_2 i; let x : ℤ := t_2 a_3; let a_4 : Memory.addr := Memory.shift a (1 : ℤ); let x_1 : ℤ := t_1 a_4; ¬x = (0 : ℤ) → (0 : ℤ) ≤ i → i < x_1 → i ≤ x_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → i ≤ (2147483646 : ℤ) → Memory.framed t_3 → Memory.linked t → Memory.sconst t_2 → Cint.is_sint32 i → Cint.is_uint16 x_1 → Cint.is_sint32 ((1 : ℤ) + i) → Axiomatic13.p_valid_memb t t_3 t_1 a → Memory.valid_rd t a_1 (1 : ℤ) → Memory.valid_rd t a_4 (1 : ℤ) → Cint.is_sint8 x → Memory.valid_rd t a_3 (1 : ℤ) → (∀(i_1 : ℤ), (0 : ℤ) ≤ i_1 → i_1 < i → ¬t_2 (Memory.shift a_2 i_1) = (0 : ℤ)) → -(1 : ℤ) ≤ i
  := sorry
end memb_alloc_Why3_ide_VCmemb_alloc_loop_inv_preserved_goal2

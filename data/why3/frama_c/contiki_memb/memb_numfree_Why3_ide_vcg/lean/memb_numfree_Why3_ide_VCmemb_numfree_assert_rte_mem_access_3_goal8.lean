import Why3.Base
import Why3.Qed.Qed
import frama_c.contiki_memb.lib.lean.Axiomatic13.Axiomatic13
import Why3.Memory.Memory
import frama_c.contiki_memb.lib.lean.Compound.Compound
import frama_c.contiki_memb.lib.lean.A_OccArray.A_OccArray
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace memb_numfree_Why3_ide_VCmemb_numfree_assert_rte_mem_access_3_goal8
theorem goal8 (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_3 : Memory.addr -> Memory.addr) (t_2 : Memory.addr -> ℤ) (i : ℤ) (t : ℤ -> ℤ) : let a_1 : Memory.addr := Memory.shift a (1 : ℤ); let x : ℤ := t_1 a_1; let a_2 : Memory.addr := t_3 (Memory.shift a (2 : ℤ)); let x_1 : ℤ := A_OccArray.l_occ_a t_2 (0 : ℤ) a_2 (0 : ℤ) i; (0 : ℤ) ≤ i → i < x → i ≤ x → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → x_1 ≤ i → Memory.framed t_3 → Memory.linked t → Memory.sconst t_2 → Cint.is_sint32 i → Cint.is_uint16 x → Axiomatic13.p_valid_memb t t_3 t_1 a → Memory.valid_rd t a_1 (1 : ℤ) → Cint.is_sint32 x_1 → Memory.valid_rd t (Memory.shift a_2 i) (1 : ℤ)
  := sorry
end memb_numfree_Why3_ide_VCmemb_numfree_assert_rte_mem_access_3_goal8

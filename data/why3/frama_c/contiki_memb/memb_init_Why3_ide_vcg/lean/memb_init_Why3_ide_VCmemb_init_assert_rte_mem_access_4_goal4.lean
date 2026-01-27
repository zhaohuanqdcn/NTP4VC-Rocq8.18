import Why3.Base
import Why3.Qed.Qed
import frama_c.contiki_memb.lib.lean.Axiomatic13.Axiomatic13
import Why3.Memory.Memory
import frama_c.contiki_memb.lib.lean.Compound.Compound
import frama_c.contiki_memb.lib.lean.A_OccArray.A_OccArray
import Why3.Cint.Cint
import frama_c.contiki_memb.lib.lean.Axiomatic12.Axiomatic12
import frama_c.contiki_memb.lib.lean.A_MemSet.A_MemSet
open Classical
open Lean4Why3
namespace memb_init_Why3_ide_VCmemb_init_assert_rte_mem_access_4_goal4
theorem goal4 (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_4 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (t_3 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) : let a_1 : Memory.addr := Memory.shift a (1 : ℤ); let x : ℤ := t_1 a_1; let a_2 : Memory.addr := Memory.shift a (0 : ℤ); let a_3 : Memory.addr := Memory.shift a (2 : ℤ); let a_4 : Memory.addr := t_4 a_3; Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.framed t_4 → Memory.linked t → Memory.sconst t_3 → Cint.is_uint16 x → Cint.is_uint16 (t_1 a_2) → Axiomatic13.p_valid_memb t t_4 t_1 a → Memory.valid_rd t a_3 (1 : ℤ) → Memory.valid_rd t a_1 (1 : ℤ) → Axiomatic12.p_valid_or_empty t a_4 x → A_MemSet.l_memset (Memory.havoc t_2 t_3 (Memory.shift a_4 (0 : ℤ)) x) a_4 (0 : ℤ) x = true → Memory.valid_rd t a_2 (1 : ℤ)
  := sorry
end memb_init_Why3_ide_VCmemb_init_assert_rte_mem_access_4_goal4

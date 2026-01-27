import Why3.Base
import Why3.Qed.Qed
import frama_c.contiki_memb.lib.lean.Axiomatic13.Axiomatic13
import Why3.Memory.Memory
import frama_c.contiki_memb.lib.lean.Compound.Compound
import frama_c.contiki_memb.lib.lean.A_OccArray.A_OccArray
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace memb_inmemb_Why3_ide_VCmemb_inmemb_assert_rte_signed_overflow_2_goal4
theorem goal4 (t_1 : Memory.addr -> ℤ) (a_1 : Memory.addr) (a : Memory.addr) (t_2 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) : let x : ℤ := t_1 (Memory.shift a_1 (1 : ℤ)); let x_1 : ℤ := t_1 (Memory.shift a_1 (0 : ℤ)); let a_2 : Memory.addr := Memory.shift a_1 (3 : ℤ); Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.framed t_2 → Memory.linked t → Cint.is_uint16 x → Cint.is_uint16 x_1 → Axiomatic13.p_valid_memb t t_2 t_1 a_1 → Memory.valid_rd t a_2 (1 : ℤ) → Memory.addr_le (t_2 a_2) a → x * x_1 ≤ (2147483647 : ℤ)
  := sorry
end memb_inmemb_Why3_ide_VCmemb_inmemb_assert_rte_signed_overflow_2_goal4

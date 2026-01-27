import Why3.Base
import Why3.Qed.Qed
import frama_c.contiki_memb.lib.lean.Axiomatic13.Axiomatic13
import Why3.Memory.Memory
import frama_c.contiki_memb.lib.lean.Compound.Compound
import frama_c.contiki_memb.lib.lean.A_OccArray.A_OccArray
import Why3.Cint.Cint
import frama_c.contiki_memb.lib.lean.Axiomatic12.Axiomatic12
open Classical
open Lean4Why3
namespace memb_init_Why3_ide_VCmemb_init_call_memset_pre_valid_s_goal9
theorem goal9 (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_3 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (t_2 : Memory.addr -> ℤ) : let a_1 : Memory.addr := Memory.shift a (1 : ℤ); let x : ℤ := t_1 a_1; let a_2 : Memory.addr := Memory.shift a (2 : ℤ); Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.framed t_3 → Memory.linked t → Memory.sconst t_2 → Cint.is_uint16 x → Cint.is_uint16 (t_1 (Memory.shift a (0 : ℤ))) → Axiomatic13.p_valid_memb t t_3 t_1 a → Memory.valid_rd t a_2 (1 : ℤ) → Memory.valid_rd t a_1 (1 : ℤ) → Axiomatic12.p_valid_or_empty t (t_3 a_2) x
  := sorry
end memb_init_Why3_ide_VCmemb_init_call_memset_pre_valid_s_goal9

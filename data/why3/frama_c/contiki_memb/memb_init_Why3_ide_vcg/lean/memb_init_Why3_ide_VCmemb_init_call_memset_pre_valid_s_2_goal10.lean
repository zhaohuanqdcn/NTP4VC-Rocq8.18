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
namespace memb_init_Why3_ide_VCmemb_init_call_memset_pre_valid_s_2_goal10
theorem goal10 (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_4 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (t_3 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) : let a_1 : Memory.addr := Memory.shift a (1 : ℤ); let x : ℤ := t_1 a_1; let a_2 : Memory.addr := Memory.shift a (0 : ℤ); let x_1 : ℤ := t_1 a_2; let x_2 : ℤ := x * x_1; let a_3 : Memory.addr := Memory.shift a (2 : ℤ); let a_4 : Memory.addr := Memory.shift a (3 : ℤ); let a_5 : Memory.addr := t_4 a_3; Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → -(2147483648 : ℤ) ≤ x_2 → x_2 ≤ (2147483647 : ℤ) → Memory.framed t_4 → Memory.linked t → Memory.sconst t_3 → Cint.is_uint16 x → Cint.is_uint16 x_1 → Axiomatic13.p_valid_memb t t_4 t_1 a → Memory.valid_rd t a_3 (1 : ℤ) → Memory.valid_rd t a_4 (1 : ℤ) → Memory.valid_rd t a_1 (1 : ℤ) → Memory.valid_rd t a_2 (1 : ℤ) → Axiomatic12.p_valid_or_empty t a_5 x → A_MemSet.l_memset (Memory.havoc t_2 t_3 (Memory.shift a_5 (0 : ℤ)) x) a_5 (0 : ℤ) x = true → Axiomatic12.p_valid_or_empty t (t_4 a_4) (Cint.to_uint32 x_2)
  := sorry
end memb_init_Why3_ide_VCmemb_init_call_memset_pre_valid_s_2_goal10

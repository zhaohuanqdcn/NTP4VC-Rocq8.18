import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.contiki_list.lib.lean.Compound.Compound
import frama_c.contiki_list.lib.lean.S1_list.S1_list
open Classical
open Lean4Why3
namespace list_init_Why3_ide_VClist_init_post_goal0
theorem goal0 (a_1 : Memory.addr) (a : Memory.addr) (t_1 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) : let a_2 : Memory.addr := Memory.shift a_1 (0 : ℤ); Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.framed t_1 → Memory.linked t → Memory.valid_rw t a (1 : ℤ) → Memory.valid_rw t a_2 (2147483646 : ℤ) → Memory.separated a (1 : ℤ) a_2 (2147483646 : ℤ) → Memory.separated (t_1 a) (4 : ℤ) a_2 (2147483646 : ℤ) → Memory.separated (Memory.addr.mk (0 : ℤ) (0 : ℤ)) (4 : ℤ) a_2 (2147483646 : ℤ)
  := sorry
end list_init_Why3_ide_VClist_init_post_goal0

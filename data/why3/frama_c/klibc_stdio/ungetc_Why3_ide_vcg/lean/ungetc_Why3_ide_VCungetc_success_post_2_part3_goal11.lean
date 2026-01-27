import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_stdio.lib.lean.Axiomatic3.Axiomatic3
open Classical
open Lean4Why3
namespace ungetc_Why3_ide_VCungetc_success_post_2_part3_goal11
theorem goal11 (a_9 : Memory.addr) (t_3 : Memory.addr -> Memory.addr) (a_2 : Memory.addr) (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (a_4 : Memory.addr) (i : ℤ) (t : ℤ -> ℤ) (t_2 : Memory.addr -> ℤ) (a_1 : Memory.addr) (a_3 : Memory.addr) (a_5 : Memory.addr) (a_6 : Memory.addr) (a_8 : Memory.addr) (a_7 : Memory.addr) : let a_10 : Memory.addr := Memory.shift a_9 (6 : ℤ); let a_11 : Memory.addr := t_3 a_10; Memory.shift a_2 (0 : ℤ) = Memory.shift a (0 : ℤ) → t_1 (Memory.shift a_4 (8 : ℤ)) = (0 : ℤ) → t_1 (Memory.shift a_9 (8 : ℤ)) = (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → -(128 : ℤ) ≤ i → i ≤ (127 : ℤ) → Memory.framed t_3 → Memory.linked t → Memory.sconst t_2 → Cint.is_sint32 i → Axiomatic3.p_valid_io_file_pvt t t_3 t_1 a_1 → Axiomatic3.p_valid_io_file_pvt t t_3 t_1 a_3 → ¬Memory.addr_le (t_3 (Memory.shift a_5 (6 : ℤ))) (t_3 (Memory.shift a_6 (5 : ℤ))) → ¬Memory.addr_le a_11 (t_3 (Memory.shift a_9 (5 : ℤ))) → Function.update t_3 a_10 (Memory.shift a_11 (-(1 : ℤ))) (Memory.shift a_8 (6 : ℤ)) = Memory.shift (t_3 (Memory.shift a_7 (6 : ℤ))) (-(1 : ℤ))
  := sorry
end ungetc_Why3_ide_VCungetc_success_post_2_part3_goal11

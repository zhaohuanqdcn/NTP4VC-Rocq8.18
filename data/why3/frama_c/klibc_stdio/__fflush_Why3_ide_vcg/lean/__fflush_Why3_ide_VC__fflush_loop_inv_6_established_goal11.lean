import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_stdio.lib.lean.Axiomatic3.Axiomatic3
open Classical
open Lean4Why3
namespace __fflush_Why3_ide_VC__fflush_loop_inv_6_established_goal11
theorem goal11 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (t_2 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) : let x : ℤ := t_1 (Memory.shift a (8 : ℤ)); t_1 (Memory.shift a (7 : ℤ)) = (0 : ℤ) → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.framed t_2 → Memory.linked t → Cint.is_uint32 (t_1 (Memory.shift a (9 : ℤ))) → Cint.is_uint32 x → Axiomatic3.p_valid_io_file_pvt t t_2 t_1 a → Memory.valid_rw t (Memory.shift (t_2 (Memory.shift a (5 : ℤ))) (0 : ℤ)) x
  := sorry
end __fflush_Why3_ide_VC__fflush_loop_inv_6_established_goal11

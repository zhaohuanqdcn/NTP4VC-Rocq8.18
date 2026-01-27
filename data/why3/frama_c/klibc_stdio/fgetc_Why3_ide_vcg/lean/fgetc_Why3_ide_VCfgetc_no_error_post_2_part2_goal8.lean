import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_stdio.lib.lean.Axiomatic3.Axiomatic3
open Classical
open Lean4Why3
namespace fgetc_Why3_ide_VCfgetc_no_error_post_2_part2_goal8
theorem goal8 (a_2 : Memory.addr) (t_1 : Memory.addr -> ℤ) (a_4 : Memory.addr) (a : Memory.addr) (a_7 : Memory.addr) (t_3 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (t_2 : Memory.addr -> ℤ) (a_1 : Memory.addr) (a_3 : Memory.addr) (a_6 : Memory.addr) (a_5 : Memory.addr) : let a_8 : Memory.addr := Memory.shift a_2 (0 : ℤ); let x : ℤ := t_1 (Memory.shift a_4 (7 : ℤ)); ¬a_8 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → a_8 = Memory.shift a (0 : ℤ) → t_1 (Memory.shift a_7 (7 : ℤ)) = (0 : ℤ) → (0 : ℤ) < x → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.framed t_3 → Memory.linked t → Memory.sconst t_2 → Cint.is_uint32 x → Axiomatic3.p_valid_io_file_pvt t t_3 t_1 a_1 → Axiomatic3.p_valid_io_file_pvt t t_3 t_1 a_3 → t_3 (Memory.shift a_6 (6 : ℤ)) = Memory.shift (t_3 (Memory.shift a_5 (6 : ℤ))) (1 : ℤ)
  := sorry
end fgetc_Why3_ide_VCfgetc_no_error_post_2_part2_goal8

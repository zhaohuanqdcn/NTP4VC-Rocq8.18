import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_stdio.lib.lean.Axiomatic3.Axiomatic3
open Classical
open Lean4Why3
namespace fwrite_noflush_Why3_ide_VCfwrite_noflush_loop_inv_established_goal17
theorem goal17 (i_1 : ℤ) (a : Memory.addr) (a_1 : Memory.addr) (t_3 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (t_2 : Memory.addr -> ℤ) (i : ℤ) (t_1 : Memory.addr -> ℤ) (fact0 : (0 : ℤ) ≤ i_1) (fact1 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact2 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact3 : Memory.framed t_3) (fact4 : Memory.linked t) (fact5 : Memory.sconst t_2) (fact6 : Cint.is_uint32 i_1) (fact7 : Cint.is_sint32 i) (fact8 : Axiomatic3.p_valid_io_file_pvt t t_3 t_1 a) (fact9 : Memory.valid_rw t (Memory.shift a_1 (0 : ℤ)) i_1) : i = (4 : ℤ) ∨ i = (11 : ℤ)
  := sorry
end fwrite_noflush_Why3_ide_VCfwrite_noflush_loop_inv_established_goal17

import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import frama_c.klibc_stdio.lib.lean.Axiomatic3.Axiomatic3
open Classical
open Lean4Why3
namespace fclose_Why3_ide_VCfclose_call_fflush_pre_goal13
theorem goal13 (a_2 : Memory.addr) (a : Memory.addr) (t_2 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (a_1 : Memory.addr) (a_3 : Memory.addr) (a_4 : Memory.addr) : let a_5 : Memory.addr := Memory.shift a_2 (0 : ℤ); a_5 = Memory.shift a (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.framed t_2 → Memory.linked t → Axiomatic3.p_valid_io_file_pvt t t_2 t_1 a_1 → Axiomatic3.p_valid_io_file_pvt t t_2 t_1 a_3 → a_5 = Memory.addr.mk (0 : ℤ) (0 : ℤ) ∨ Memory.shift a_4 (0 : ℤ) = a_5
  := sorry
end fclose_Why3_ide_VCfclose_call_fflush_pre_goal13

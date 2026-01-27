import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_stdio.lib.lean.Axiomatic3.Axiomatic3
open Classical
open Lean4Why3
namespace __fflush_Why3_ide_VC__fflush_call_fseek_pre_goal29
theorem goal29 (t_1 : Memory.addr -> ℤ) (a_1 : Memory.addr) (t_2 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (a : Memory.addr) : let x : ℤ := t_1 (Memory.shift a_1 (7 : ℤ)); ¬x = (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.framed t_2 → Memory.linked t → Cint.is_uint32 x → Axiomatic3.p_valid_io_file_pvt t t_2 t_1 a_1 → Memory.shift a_1 (0 : ℤ) = Memory.shift a (0 : ℤ)
  := sorry
end __fflush_Why3_ide_VC__fflush_call_fseek_pre_goal29

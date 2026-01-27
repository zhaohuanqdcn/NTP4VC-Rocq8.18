import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Globals.Globals
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_stdio.lib.lean.Axiomatic3.Axiomatic3
open Classical
open Lean4Why3
namespace fflush_Why3_ide_VCfflush_assign_exit_part11_goal13
theorem goal13 (t_1 : Memory.addr -> ℤ) (a_6 : Memory.addr) (t_2 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (a : Memory.addr) (a_1 : Memory.addr) (a_5 : Memory.addr) (a_2 : Memory.addr) (a_4 : Memory.addr) (a_3 : Memory.addr) : let x : ℤ := t_1 (Memory.shift a_6 (8 : ℤ)); let a_7 : Memory.addr := Memory.shift (Memory.shift a_6 (0 : ℤ)) (1 : ℤ); ¬Memory.addr.mk (1723 : ℤ) (0 : ℤ) = a_6 → ¬x = (0 : ℤ) → Memory.region (0 : ℤ) ≤ (0 : ℤ) → Memory.framed t_2 → Memory.linked t → Cint.is_uint32 x → Axiomatic3.p_valid_io_file_pvt t t_2 t_1 a → Axiomatic3.p_valid_io_file_pvt t t_2 t_1 a_1 → Axiomatic3.p_valid_io_file_pvt t t_2 t_1 a_6 → ¬Memory.invalid t a_7 (1 : ℤ) → a_7 = Memory.shift a_5 (7 : ℤ) ∨ a_7 = Memory.shift a_2 (8 : ℤ) ∨ a_7 = Memory.shift (Memory.shift a_4 (0 : ℤ)) (1 : ℤ) ∨ Memory.shift (Memory.shift a_3 (0 : ℤ)) (2 : ℤ) = a_7
  := sorry
end fflush_Why3_ide_VCfflush_assign_exit_part11_goal13

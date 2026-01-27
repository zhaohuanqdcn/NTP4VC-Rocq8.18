import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Globals.Globals
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_stdio.lib.lean.Axiomatic3.Axiomatic3
open Classical
open Lean4Why3
namespace fflush_Why3_ide_VCfflush_loop_inv_preserved_part1_goal0
theorem goal0 (a_2 : Memory.addr) (t_1 : Memory.addr -> ℤ) (i_4 : ℤ) (t_2 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (a : Memory.addr) (a_1 : Memory.addr) (i : ℤ) (i_1 : ℤ) (i_2 : ℤ) (i_3 : ℤ) : let a_3 : Memory.addr := Memory.shift a_2 (8 : ℤ); let x : ℤ := t_1 a_3; let a_4 : Memory.addr := Memory.shift a_2 (0 : ℤ); ¬Memory.addr.mk (1723 : ℤ) (0 : ℤ) = a_2 → ¬x = (0 : ℤ) → Memory.region (0 : ℤ) ≤ (0 : ℤ) → -(1 : ℤ) ≤ i_4 → Memory.framed t_2 → Memory.linked t → Cint.is_sint32 i_4 → Cint.is_uint32 x → Axiomatic3.p_valid_io_file_pvt t t_2 t_1 a → Axiomatic3.p_valid_io_file_pvt t t_2 t_1 a_1 → Axiomatic3.p_valid_io_file_pvt t t_2 t_1 a_2 → Axiomatic3.p_valid_io_file_pvt t t_2 (Function.update (Function.update (Function.update (Function.update t_1 a_3 i) (Memory.shift a_4 (2 : ℤ)) i_1) (Memory.shift a_4 (1 : ℤ)) i_2) (Memory.shift a_2 (7 : ℤ)) i_3) (t_2 (Memory.shift a_2 (4 : ℤ)))
  := sorry
end fflush_Why3_ide_VCfflush_loop_inv_preserved_part1_goal0

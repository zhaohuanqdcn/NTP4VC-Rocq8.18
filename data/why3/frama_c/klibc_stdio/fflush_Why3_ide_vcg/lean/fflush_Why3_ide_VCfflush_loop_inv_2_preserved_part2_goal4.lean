import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Globals.Globals
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import frama_c.klibc_stdio.lib.lean.Axiomatic3.Axiomatic3
open Classical
open Lean4Why3
namespace fflush_Why3_ide_VCfflush_loop_inv_2_preserved_part2_goal4
theorem goal4 : let a : Memory.addr := Memory.addr.mk (1723 : ℤ) (0 : ℤ); ∀(t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> Memory.addr) (a_3 : Memory.addr) (a_2 : Memory.addr) (a_1 : Memory.addr), ¬a = a_3 → t_1 (Memory.shift a_3 (8 : ℤ)) = (0 : ℤ) → Memory.region (0 : ℤ) ≤ (0 : ℤ) → Memory.framed t_2 → Memory.linked t → Axiomatic3.p_valid_io_file_pvt t t_2 t_1 a_1 → Axiomatic3.p_valid_io_file_pvt t t_2 t_1 a_2 → Axiomatic3.p_valid_io_file_pvt t t_2 t_1 a_3 → ¬t_2 (Memory.shift a_3 (4 : ℤ)) = a
  := sorry
end fflush_Why3_ide_VCfflush_loop_inv_2_preserved_part2_goal4

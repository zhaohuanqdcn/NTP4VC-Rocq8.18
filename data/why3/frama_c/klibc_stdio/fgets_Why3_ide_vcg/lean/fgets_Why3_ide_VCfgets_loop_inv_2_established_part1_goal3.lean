import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import frama_c.klibc_stdio.lib.lean.Axiomatic3.Axiomatic3
open Classical
open Lean4Why3
namespace fgets_Why3_ide_VCfgets_loop_inv_2_established_part1_goal3
theorem goal3 (a_2 : Memory.addr) (a : Memory.addr) (a_4 : Memory.addr) (t_3 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (t_2 : Memory.addr -> ℤ) (t_1 : Memory.addr -> ℤ) (a_1 : Memory.addr) (a_3 : Memory.addr) : let a_5 : Memory.addr := Memory.shift a_2 (0 : ℤ); ¬a_5 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → a_5 = Memory.shift a (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_4) ≤ (0 : ℤ) → Memory.framed t_3 → Memory.linked t → Memory.sconst t_2 → Axiomatic3.p_valid_io_file_pvt t t_3 t_1 a_1 → Axiomatic3.p_valid_io_file_pvt t t_3 t_1 a_3 → Axiomatic3.p_valid_file t t_1 a_5 → Memory.addr_le a_4 a_4
  := sorry
end fgets_Why3_ide_VCfgets_loop_inv_2_established_part1_goal3

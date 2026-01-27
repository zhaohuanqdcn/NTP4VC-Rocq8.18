import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.swap_ranges.lib.lean.Compound.Compound
import frama_c.standard_algorithms.swap_ranges.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace swap_ranges_Why3_ide_VCswap_ranges_loop_inv_equal_2_established_goal7
theorem goal7 (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (t_1 : Memory.addr -> ℤ) : let a_2 : Memory.addr := Memory.shift a (0 : ℤ); let a_3 : Memory.addr := Memory.shift a_1 (0 : ℤ); Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Memory.valid_rw t a_2 i → Memory.valid_rw t a_3 i → Memory.separated a_3 i a_2 i → Axiomatic.p_equalranges_1' t_1 t_1 a (0 : ℤ) a_1
  := sorry
end swap_ranges_Why3_ide_VCswap_ranges_loop_inv_equal_2_established_goal7

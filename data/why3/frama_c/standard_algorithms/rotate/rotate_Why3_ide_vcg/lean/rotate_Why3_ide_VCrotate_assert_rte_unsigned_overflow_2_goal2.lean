import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.rotate.lib.lean.Compound.Compound
import frama_c.standard_algorithms.rotate.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace rotate_Why3_ide_VCrotate_assert_rte_unsigned_overflow_2_goal2
theorem goal2 (a : Memory.addr) (i_1 : ℤ) (i : ℤ) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) : let a_1 : Memory.addr := Memory.shift a (0 : ℤ); (0 : ℤ) < i_1 → i_1 ≤ i → i_1 < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Memory.valid_rw t a_1 i → Memory.valid_rw t a_1 i_1 → Axiomatic.p_reverse_5' (Memory.havoc t_1 t_2 a_1 i_1) t_2 a (0 : ℤ) i_1 → i ≤ (4294967295 : ℤ) + i_1
  := sorry
end rotate_Why3_ide_VCrotate_assert_rte_unsigned_overflow_2_goal2

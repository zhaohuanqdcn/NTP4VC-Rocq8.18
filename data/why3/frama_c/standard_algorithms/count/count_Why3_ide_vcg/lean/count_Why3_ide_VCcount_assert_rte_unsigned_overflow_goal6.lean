import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.count.lib.lean.Axiomatic1.Axiomatic1
import frama_c.standard_algorithms.count.lib.lean.A_Count.A_Count
import Why3.Cint.Cint
import frama_c.standard_algorithms.count.lib.lean.Compound.Compound
import frama_c.standard_algorithms.count.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace count_Why3_ide_VCcount_assert_rte_unsigned_overflow_goal6
theorem goal6 (a : Memory.addr) (i_1 : ℤ) (t_1 : Memory.addr -> ℤ) (i : ℤ) (t : ℤ -> ℤ) : let a_1 : Memory.addr := Memory.shift a i_1; let x : ℤ := t_1 a_1; let x_1 : ℤ := A_Count.l_count_1' t_1 a (0 : ℤ) i_1 x; i_1 ≤ i → (0 : ℤ) ≤ i_1 → i_1 < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → x_1 ≤ i_1 → (0 : ℤ) ≤ x_1 → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_sint32 x → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i → Memory.valid_rd t a_1 (1 : ℤ) → Cint.is_uint32 x_1 → x_1 ≤ (4294967294 : ℤ)
  := sorry
end count_Why3_ide_VCcount_assert_rte_unsigned_overflow_goal6

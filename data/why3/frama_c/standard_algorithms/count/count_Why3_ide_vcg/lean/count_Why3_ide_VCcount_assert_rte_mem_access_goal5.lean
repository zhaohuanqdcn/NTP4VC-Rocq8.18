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
namespace count_Why3_ide_VCcount_assert_rte_mem_access_goal5
theorem goal5 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (i_2 : ℤ) (i : ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) : let x : ℤ := A_Count.l_count_1' t_1 a (0 : ℤ) i_2 i; i_2 ≤ i_1 → (0 : ℤ) ≤ i_2 → i_2 < i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → x ≤ i_2 → (0 : ℤ) ≤ x → Memory.linked t → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_sint32 i → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i_1 → Cint.is_uint32 x → Memory.valid_rd t (Memory.shift a i_2) (1 : ℤ)
  := sorry
end count_Why3_ide_VCcount_assert_rte_mem_access_goal5

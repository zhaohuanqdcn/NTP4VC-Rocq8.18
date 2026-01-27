import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.fill.lib.lean.Compound.Compound
import frama_c.standard_algorithms.fill.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace fill_Why3_ide_VCfill_assert_rte_unsigned_overflow_goal6
theorem goal6 (a : Memory.addr) (i_2 : ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) (i : ℤ) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) : let a_1 : Memory.addr := Memory.shift a (0 : ℤ); i_2 ≤ i_1 → (0 : ℤ) ≤ i_2 → i_2 < i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_sint32 i → Memory.valid_rw t a_1 i_1 → Memory.valid_rw t (Memory.shift a i_2) (1 : ℤ) → Axiomatic.p_constantrange (Memory.havoc t_1 t_2 a_1 i_1) a (0 : ℤ) i_2 i → i_2 ≤ (4294967294 : ℤ)
  := sorry
end fill_Why3_ide_VCfill_assert_rte_unsigned_overflow_goal6

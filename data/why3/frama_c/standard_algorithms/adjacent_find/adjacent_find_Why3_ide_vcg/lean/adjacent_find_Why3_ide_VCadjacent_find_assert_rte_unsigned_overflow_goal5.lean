import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.adjacent_find.lib.lean.Compound.Compound
import frama_c.standard_algorithms.adjacent_find.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace adjacent_find_Why3_ide_VCadjacent_find_assert_rte_unsigned_overflow_goal5
theorem goal5 (i_1 : ℤ) (i : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) : let x : ℤ := (1 : ℤ) + i_1; (0 : ℤ) ≤ i_1 → i_1 < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → (2 : ℤ) ≤ i → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_sint32 (t_1 (Memory.shift a i_1)) → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i → ¬Axiomatic.p_hasequalneighbors t_1 a x → Cint.is_sint32 (t_1 (Memory.shift a x)) → i_1 ≤ (4294967294 : ℤ)
  := sorry
end adjacent_find_Why3_ide_VCadjacent_find_assert_rte_unsigned_overflow_goal5

import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.find_first_of.lib.lean.Compound.Compound
import frama_c.standard_algorithms.find_first_of.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace find_first_of_Why3_ide_VCfind_first_of_assert_rte_unsigned_overflow_goal5
theorem goal5 (a_1 : Memory.addr) (i_1 : ℤ) (t_1 : Memory.addr -> ℤ) (i : ℤ) (i_2 : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) : let a_2 : Memory.addr := Memory.shift a_1 i_1; let x : ℤ := t_1 a_2; i_1 ≤ i → (0 : ℤ) ≤ i_1 → i_1 < i → (0 : ℤ) ≤ i_2 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_sint32 (t_1 (Memory.shift a i_2)) → Cint.is_sint32 x → ¬Axiomatic.p_hasvalueof t_1 a_1 i_1 a i_2 → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i_2 → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i → Memory.valid_rd t a_2 (1 : ℤ) → ¬Axiomatic.p_hasvalue_1' t_1 a (0 : ℤ) i_2 x → i_1 ≤ (4294967294 : ℤ)
  := sorry
end find_first_of_Why3_ide_VCfind_first_of_assert_rte_unsigned_overflow_goal5

import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.equal_range.lib.lean.S1_size_type_pair.S1_size_type_pair
import Why3.Cint.Cint
import frama_c.standard_algorithms.equal_range.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.equal_range.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace equal_range_Why3_ide_VCequal_range_post_result_goal0
theorem goal0 (s : S1_size_type_pair.s1_size_type_pair) (i_1 : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (t_1 : Memory.addr -> ℤ) : let x : ℤ := S1_size_type_pair.s1_size_type_pair.f1_size_type_pair_first s; let x_1 : ℤ := S1_size_type_pair.s1_size_type_pair.f1_size_type_pair_second s; x ≤ i_1 → x_1 ≤ i_1 → (0 : ℤ) ≤ x → (0 : ℤ) ≤ x_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → S1_size_type_pair.iss1_size_type_pair s → Memory.linked t → Cint.is_uint32 i_1 → Cint.is_sint32 i → Cint.is_uint32 x → Cint.is_uint32 x_1 → Axiomatic.p_sorted_1' t_1 a (0 : ℤ) i_1 → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i_1 → Axiomatic.p_lowerbound_1' t_1 a x i_1 i → Axiomatic.p_strictupperbound_1' t_1 a (0 : ℤ) x i → Axiomatic.p_upperbound_1' t_1 a (0 : ℤ) x_1 i → Axiomatic.p_strictlowerbound_1' t_1 a x_1 i_1 i → x ≤ x_1
  := sorry
end equal_range_Why3_ide_VCequal_range_post_result_goal0

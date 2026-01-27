import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.adjacent_find.lib.lean.Compound.Compound
import frama_c.standard_algorithms.adjacent_find.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace adjacent_find_Why3_ide_VCadjacent_find_none_post_result_goal8
theorem goal8 (i_1 : ℤ) (i_2 : ℤ) (a : Memory.addr) (i : ℤ) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) : let x : ℤ := (1 : ℤ) + i_1; let x_1 : ℤ := (1 : ℤ) + i_2; let a_1 : Memory.addr := Memory.shift a i_2; (0 : ℤ) ≤ i_1 → i_1 < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → (2 : ℤ) ≤ i → i_1 ≤ (4294967294 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → ¬Axiomatic.p_hasequalneighbors t_1 a i → Cint.is_sint32 (t_1 (Memory.shift a i_1)) → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i → ¬Axiomatic.p_hasequalneighbors t_1 a x → Cint.is_sint32 (t_1 (Memory.shift a x)) → (if (2 : ℤ) + i_1 ≤ i then i_2 = i_1 ∧ t_1 (Memory.shift a x_1) = t_1 a_1 ∧ Memory.valid_rd t a_1 (1 : ℤ) ∧ Memory.valid_rd t (Memory.shift a (Cint.to_uint32 x_1)) (1 : ℤ) else x = i_2) → i_2 = i
  := sorry
end adjacent_find_Why3_ide_VCadjacent_find_none_post_result_goal8

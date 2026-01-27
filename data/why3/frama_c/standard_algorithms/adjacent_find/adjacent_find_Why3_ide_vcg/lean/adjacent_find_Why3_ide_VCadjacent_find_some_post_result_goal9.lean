import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.adjacent_find.lib.lean.Compound.Compound
import frama_c.standard_algorithms.adjacent_find.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace adjacent_find_Why3_ide_VCadjacent_find_some_post_result_goal9
theorem goal9 (a : Memory.addr) (i_2 : ℤ) (t_1 : Memory.addr -> ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) (i : ℤ) : let a_1 : Memory.addr := Memory.shift a i_2; let x : ℤ := t_1 a_1; let x_1 : ℤ := (1 : ℤ) + i_2; let x_2 : ℤ := t_1 (Memory.shift a x_1); let x_3 : ℤ := (1 : ℤ) + i_1; Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Axiomatic.p_hasequalneighbors t_1 a i → Cint.is_sint32 x → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i → Cint.is_sint32 x_2 → (if (2 : ℤ) ≤ i then (0 : ℤ) ≤ i_1 ∧ i_1 < i ∧ i_1 ≤ (4294967294 : ℤ) ∧ ¬Axiomatic.p_hasequalneighbors t_1 a x_3 ∧ (if (2 : ℤ) + i_1 ≤ i then i_2 = i_1 ∧ x_2 = x ∧ Memory.valid_rd t a_1 (1 : ℤ) ∧ Memory.valid_rd t (Memory.shift a (Cint.to_uint32 x_1)) (1 : ℤ) else x_3 = i_2) else i_2 = i) → (0 : ℤ) ≤ i_2 ∧ (2 : ℤ) + i_2 ≤ i
  := sorry
end adjacent_find_Why3_ide_VCadjacent_find_some_post_result_goal9

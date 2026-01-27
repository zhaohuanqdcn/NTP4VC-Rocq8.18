import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.max_element.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace max_element_Why3_ide_VCmax_element_not_empty_post_upper_goal9
theorem goal9 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (i_1 : ℤ) (i : ℤ) (i_3 : ℤ) (i_2 : ℤ) (t : ℤ -> ℤ) : let x : ℤ := t_1 (Memory.shift a i_1); (0 : ℤ) < i → i_3 ≤ i → (0 : ℤ) ≤ i_1 → i_1 < i → (0 : ℤ) ≤ i_2 → i_2 < i → (0 : ℤ) ≤ i_3 → i ≤ i_3 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 i_3 → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i → (∀(i_4 : ℤ), (0 : ℤ) ≤ i_4 → i_4 < i_1 → t_1 (Memory.shift a i_4) < x) → (∀(i_4 : ℤ), (0 : ℤ) ≤ i_4 → i_4 < i_3 → t_1 (Memory.shift a i_4) ≤ x) → t_1 (Memory.shift a i_2) ≤ x
  := sorry
end max_element_Why3_ide_VCmax_element_not_empty_post_upper_goal9

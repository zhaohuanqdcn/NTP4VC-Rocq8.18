import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.max_element.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace max_element_Why3_ide_VCmax_element_loop_inv_upper_preserved_goal5
theorem goal5 (a : Memory.addr) (i_1 : ℤ) (t_1 : Memory.addr -> ℤ) (i_3 : ℤ) (i : ℤ) (i_4 : ℤ) (t : ℤ -> ℤ) (i_2 : ℤ) : let a_1 : Memory.addr := Memory.shift a i_1; let x : ℤ := t_1 a_1; let a_2 : Memory.addr := Memory.shift a i_3; let x_1 : ℤ := t_1 a_2; (0 : ℤ) < i → i_3 ≤ i → (0 : ℤ) ≤ i_1 → i_1 < i → (0 : ℤ) ≤ i_3 → i_3 < i → i_4 ≤ i_3 → (0 : ℤ) ≤ i_4 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → i_3 ≤ (4294967294 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_uint32 i_3 → Cint.is_uint32 ((1 : ℤ) + i_3) → Cint.is_sint32 x → Cint.is_sint32 x_1 → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i → Memory.valid_rd t a_1 (1 : ℤ) → Memory.valid_rd t a_2 (1 : ℤ) → (if x < x_1 then i_3 = i_2 else i_2 = i_1) → (∀(i_5 : ℤ), (0 : ℤ) ≤ i_5 → i_5 < i_1 → t_1 (Memory.shift a i_5) < x) → (∀(i_5 : ℤ), (0 : ℤ) ≤ i_5 → i_5 < i_3 → t_1 (Memory.shift a i_5) ≤ x) → t_1 (Memory.shift a i_4) ≤ t_1 (Memory.shift a i_2)
  := sorry
end max_element_Why3_ide_VCmax_element_loop_inv_upper_preserved_goal5
